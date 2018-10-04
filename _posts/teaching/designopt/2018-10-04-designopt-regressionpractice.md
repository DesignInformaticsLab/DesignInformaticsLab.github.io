---
categories: designopt_tutorial
layout: opt_default
title:  Regression Application - Predicting Fuel Efficiency from Data
published: true
---
<style TYPE="text/css">
code.has-jax {font: inherit; font-size: 100%; background: inherit; border: inherit;}
</style>
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
    tex2jax: {
        inlineMath: [['$','$'], ['\\(','\\)']],
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'] // removed 'code' entry
    }
});
MathJax.Hub.Queue(function() {
    var all = MathJax.Hub.getAllJax(), i;
    for(i = 0; i < all.length; i += 1) {
        all[i].SourceElement().parentNode.className += ' has-jax';
    }
});
</script>
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

## Overview
In this exercise you will put the regression techniques learned through the last few lectures
to use. An engine fuel efficiency data can be downloaded [here](../_teaching/designopt/enginedata.mat).
Use the data to create regression models and answer the following questions
based on what you observed:

1. When applying OLS, how do you determine the features?

2. How does the number of features affect your training and test R-square values?

3. Is it always better to include more features?

4. How does the distribution of the training sample affect the test R-square?

5. Do you find Latin hypercube sampling to have better test R-square than random sampling?

6. What is the difference between feedforward neural network and Kriging?

## Sample codes
A sample code can be downloaded [here](../_teaching/designopt/enginedata.mat).
In the following, we briefly go through the code.

### Data visualization

{% highlight MATLAB %}
close all;
rng(4); % set random seed so that results are reproducible

%Visualize the data
% eng_consum_spd is the engine speed (rad/s)
% eng_consum_trq is the engine torque (Nm)
[X,Y] = meshgrid(eng_consum_spd',eng_consum_trq');
[M,c] = contourf(X,Y,eng_fuel_map_gpkWh',30); % draw contour
colormap parula
xlabel('Engine speed');ylabel('Engine torque');title('Engine fuel consumption (gram/kWh)')
figure;colormap parula;hold on;
surf(X,Y,eng_fuel_map_gpkWh');alpha 0.5 % draw surface
xlabel('Engine speed');ylabel('Engine torque');title('Engine fuel consumption (gram/kWh)')
{% endhighlight %}

After loading the data (double click on the .mat file you just downloaded within Matlab),
the above code visualizes the engine efficiency map. Note that the unit of the map is
gram/kWh, therefore lower values are of higher efficiency.

### Data preparation
The following script prepares the training and test data. The idea is to use
the training data to build the regression model, and test this model using the test data.
Note that here we assume we see the test data just so that we can
understand what happens when the model is deployed. In reality, the test
data is never seen and cannot be used to influence the regression model.

Here, we use two methods to create the training data. One is to use random sampling
(commented out in the following code) and the other is to use Latin Hypercube sampling.
Please test to see which one is better in terms of test R-square.

{% highlight MATLAB %}
%Prepare training and test data
xo = zeros(12*17,2); % 2D input (engine speed, engine torque)
yo = zeros(12*17,1); % 1D output (engine fuel efficiency, gram per kWh)
for i = 1:12 % discrete engine speed
    for j = 1:17 % discrete engine torque
        xo(i+(j-1)*12,:) = [eng_consum_spd(i),eng_consum_trq(j)];
        yo(i+(j-1)*12,:) = eng_fuel_map_gpkWh(i,j);
    end
end
set = 1:12*17;

trainn = 4; % set training data size to be trainn*17
xtrain = zeros(trainn*17,2);
ytrain = zeros(trainn*17,1);
% use Latin Hypercube sampling
lhsample = lhsdesign(trainn*17,2,'iterations',100);
lhsample = bsxfun(@times, lhsample,...
    [max(eng_consum_spd)-min(eng_consum_spd),max(eng_consum_trq)-min(eng_consum_trq)]);
lhsample = bsxfun(@plus, lhsample, [min(eng_consum_spd), min(eng_consum_trq)]);
xcandidate = xo;
% match Latin hypercube samples to the predefined grid
for count = 1:trainn*17
    [~,id] = min(sum(bsxfun(@minus, xcandidate, lhsample(count,:)).^2,2));
    xtrain(count,:) = xcandidate(id,:);
    ytrain(count) = yo(set(id),:);
    xcandidate(id,:)=[];
    set(id) = [];
end

% use random samples
% for count = 1:trainn*17
%     id = floor(rand*length(set))+1;
%     xtrain(count,:) = xo(set(id),:);
%     ytrain(count) = yo(set(id),:);
%     set(id) = [];
% end

% use all remaining data points for test
xtest = xo(set,:);x
ytest = yo(set);
% plot training vs. test data points
plot3(xtrain(:,1),xtrain(:,2),ytrain,'.k','MarkerSize',30);
plot3(xtest(:,1),xtest(:,2),ytest,'.y','MarkerSize',30);
{% endhighlight %}

### Ordinary Least Square
The following script performs OLS estimation, reports the test R-square,
and outputs a visual comparison between the true efficiency map and the predicted one.
Try to change the features, defined as ```X```, and see if doing so improves
the test R-square.

{% highlight MATLAB %}
% use OLS for regression
% try different complexities of polynomials
X = [xtrain,xtrain.^2,xtrain(:,1).*xtrain(:,2),xtrain(:,1).^2.*xtrain(:,2),xtrain(:,1).*xtrain(:,2).^2];
% normalize data to avoid ill-conditioning due to different scales of
% inputs. This is not super necessary since MATLAB solver takes care of
% pre-conditioning.
Xmean = mean(X);
Xstd = std(X);
X = bsxfun(@minus,X,Xmean); % normalization step 1: set mean to zero
X = bsxfun(@rdivide,X,Xstd); % normalization step 2: set std to 1
X = [ones(length(ytrain),1),X]; % allow bias
y = ytrain;
[n,p] = size(xtrain);
beta = (X'*X)\(X'*y); % OLS estimation

% Compute test R2
Xtest = [xtest,xtest.^2,xtest(:,1).*xtest(:,2),xtest(:,1).^2.*xtest(:,2),xtest(:,1).*xtest(:,2).^2];
Xtest = bsxfun(@minus,Xtest,Xmean);
Xtest = bsxfun(@rdivide,Xtest,Xstd);
Xtest = [ones(length(ytest),1),Xtest];
e = Xtest*beta-ytest;
R2_OLS = 1-(e'*e)/((ytest-mean(ytest))'*(ytest-mean(ytest)));

% Visualize the predicted fuel efficiency
xplot = [xo, xo.^2, xo(:,1).*xo(:,2), xo(:,1).^2.*xo(:,2), xo(:,1).*xo(:,2).^2];
xplot = bsxfun(@minus,xplot,Xmean);
xplot = bsxfun(@rdivide,xplot,Xstd);
xplot = [ones(length(yo),1),xplot];
yplot = xplot*beta;
[X,Y] = meshgrid(eng_consum_spd',eng_consum_trq');
surf(X,Y,reshape(yplot,12,17)');
{% endhighlight %}

### Gaussian process

Gaussian process allows you to fit through all training data points exactly,
while using the least "complex" function. This however, as you will see, may lead
to large prediction error, and thus requires fine-tuning of the Gaussian spread (```lambda``` in the following code).
Also a more even spread of samples through Latin Hypercube will help.

{% highlight MATLAB %}
lambda = 0.3; %Gaussian spread
X = xtrain;
Xmean = mean(X);
Xstd = std(X);
X = bsxfun(@minus,X,Xmean);
X = bsxfun(@rdivide,X,Xstd);
y = ytrain;
[n,p] = size(xtrain);
R = zeros(n);
for pp = 1:n
    for qq = (pp+1):n
        R(pp,qq) = exp(-1/lambda*norm(X(pp,:)-X(qq,:))^2);
    end
end
R = R + R';
R = R + eye(n);

% Compute test R2
Xtest = xtest;
Xtest = bsxfun(@minus,Xtest,Xmean);
Xtest = bsxfun(@rdivide,Xtest,Xstd);
r = zeros(n,length(ytest));
b = (ones(1,n)*(R\y))/(ones(1,n)*(R\ones(n,1)));
yhat = zeros(length(ytest),1);
for qq = 1:length(ytest)
    for pp = 1:n
        r(pp,qq) = exp(-1/lambda*norm(X(pp,:)-Xtest(qq,:))^2);
    end
    yhat(qq) = b + r(:,qq)'*(R\(ytrain-b*ones(n,1)));
end
e = yhat-ytest;
R2_kriging = 1-(e'*e)/((ytest-mean(ytest))'*(ytest-mean(ytest)));

% Visualize predicted fuel efficiency
Xtest = xo;
Xtest = bsxfun(@minus,Xtest,Xmean);
Xtest = bsxfun(@rdivide,Xtest,Xstd);
r = zeros(n,length(yo));
b = (ones(1,n)*(R\y))/(ones(1,n)*(R\ones(n,1)));
yhat = zeros(length(yo),1);
for qq = 1:length(yo)
    for pp = 1:n
        r(pp,qq) = exp(-1/lambda*norm(X(pp,:)-Xtest(qq,:))^2);
    end
    yhat(qq) = b + r(:,qq)'*(R\(ytrain-b*ones(n,1)));
end
[X,Y] = meshgrid(eng_consum_spd',eng_consum_trq');
surf(X,Y,reshape(yhat,12,17)');
{% endhighlight %}

### Feedforward Neural Net
While there is a script way to use the feedforward network, Matlab does provide
a network fitting app that is easy to use (with limited functionality).
The following code visualizes the outputs from the network ```net```.

{% highlight MATLAB %}
yhat = zeros(length(yo),1);
for i = 1:length(yo)
    yhat(i) = net1(xo(i,:)');
end
[X,Y] = meshgrid(eng_consum_spd',eng_consum_trq');
surf(X,Y,reshape(yhat,12,17)');
{% endhighlight %}