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
xtest = xo(set,:);
ytest = yo(set);
% plot training vs. test data points
plot3(xtrain(:,1),xtrain(:,2),ytrain,'.k','MarkerSize',30);
plot3(xtest(:,1),xtest(:,2),ytest,'.y','MarkerSize',30);

%% Ordinary Least Square
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

%% nnrb: Radial basis neural network
lambda = 0.5; %Gaussian spread: larger lambda makes surface smoother, but may also cause ill-conditioned R
X = xtrain;

% data normalization
Xmean = mean(X);
Xstd = std(X);
X = bsxfun(@minus,X,Xmean);
X = bsxfun(@rdivide,X,Xstd);

y = ytrain;
[n,p] = size(xtrain);

% Compute correlation matrix
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
yhat = zeros(length(ytest),1);
for qq = 1:length(ytest)
    for pp = 1:n
        r(pp,qq) = exp(-1/lambda*norm(X(pp,:)-Xtest(qq,:))^2);
    end
    yhat(qq) = r(:,qq)'*(R\ytrain);
end
e = yhat-ytest;
R2_nnrb = 1-(e'*e)/((ytest-mean(ytest))'*(ytest-mean(ytest)));

% Visualize predicted fuel efficiency
Xtest = xo;
Xtest = bsxfun(@minus,Xtest,Xmean);
Xtest = bsxfun(@rdivide,Xtest,Xstd);
r = zeros(n,length(yo));
yhat = zeros(length(yo),1);
for qq = 1:length(yo)
    for pp = 1:n
        r(pp,qq) = exp(-1/lambda*norm(X(pp,:)-Xtest(qq,:))^2);
    end
    yhat(qq) = r(:,qq)'*(R\ytrain);
end
[X,Y] = meshgrid(eng_consum_spd',eng_consum_trq');
surf(X,Y,reshape(yhat,12,17)');

%% kriging (Gaussian process)
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


%% Feedforward neural net
yhat = zeros(length(yo),1);
for i = 1:length(yo)
    yhat(i) = net1(xo(i,:)');
end
[X,Y] = meshgrid(eng_consum_spd',eng_consum_trq');
surf(X,Y,reshape(yhat,12,17)');