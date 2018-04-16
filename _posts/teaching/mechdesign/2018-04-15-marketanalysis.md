---
categories: mechdesign_lecture
layout: mechdesign_default
title:  Tutorial on Product Market Analysis
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


# Tutorial on Product Market Analysis

## Introduction

In this class we have went through the process of going from some design requirements to 
the determination of a detailed design. For example, you went from the goal of trying to improve the 
acceleration performance of a car to the design of dimensions of shafts and gears in the transmission. 
But how do designers come up with design requirements in the first place? 
Or in the case of your project, why is the acceleration performance something we care about, given the 
fact that pushing the acceleration performance to the limit may negatively affect 
other attributes of the car, say, emission and price? The answer is that we design for what 
our potential users want. So, if we are targeting people you meet in a motorsport park, then the gut 
feeling is that they want speed. 

But if you are a designer, you will have to think deeper: How much acceleration power 
will make your target users happy, and still consider buying your car (since your cost and price go up as you 
upgrade the engine)? Engineering
 design at any level (from sizes of gears and pinions to product-level attributes such as speed and price), 
 always involves balancing conflicting goals. In detailed design, 
 this balance can be made based on analysis rooted from physics, mechanics, and material science. 
So analogously, we also need some quantitative analysis to be able to  
make rigorous decisions at earlier stages of the design process, instead of relying on gut feeling.
<!--such as balancing the performance target (e.g., acceleration) and product cost (which affects the price).-->

The purpose of this tutorial is therefore to introduce the basic tools for quantitatively understanding 
what users want and how much they want them, a topic usually called *preference elicitation* or 
*preference learning*. Learning preferences is originally more of an art, and carried out by human beings. 
With the growing amount of user data (and a lack of rules for regulating the usage of such data), 
this task has become routine for machines, with standardized 
procedures developed (e.g. A/B test). While privacy issue is of major concern, the good news for 
designers is that 
 we can now characterize our target users with numbers and certainty, and that helps a lot in confirming 
 or revealing where the design effort should be spent. 

In this tutorial, we introduce Discrete Choice Analysis (DCA), a standard method for learning user preferences.
 The theory behind the method can be tracked by to Dr. [Daniel McFadden](https://en.wikipedia.org/wiki/Daniel_McFadden),
  who shared the 2000 Nobel Prize in Economic Sciences due to his work in discrete choice.

The tutorial will have two parts, without going deep into the math. In the first part, 
we introduce a method for collecting data. A MATLAB script will be given to automatically generate
a survey where participants are asked to compare pairs of design alternatives. In the second part, we
introduce an analysis script (based on Dr. [Kenneth Train][3]'s mixed logit code), 
that outputs a quantitative model of the users' preference based on the collected responses.

To start, please download the codes from **[here][code]**. You will also need to register on Qualtrics 
(free for ASU students) as this is the survey platform we will use. **NOTE**: There are couple of online
platforms that provide DCA. None are free. The method I came up with in this tutorial is FREE, but as you 
can imagine, is not the most user-friendly.

Disclaimer: This tutorial is developed based on my [notes](http://designinformaticslab.github.io/productdesign_tutorial/2017/02/06/qualtrics_tutorial.html)
for my product design class.

## Part 1: Survey for data collection

### Product Attributes, Levels, and Part-worths
The following definitions are given to ease the discussion on the survey and the analysis.

**Attributes** are properties of the product that directly affect the purchase decision of consumers, 
e.g., price, MPG, acceleration, safety for a car. Note that in conventional marketing research, attributes
are only restricted to quantifiable properties. 
<!--My recent research in preference learning-->
<!--has extended to "complex attributes" that are not directly quantifiable, e.g., aesthetics. -->
<!--See [this][namwoopaper].-->

**Levels** of an attribute could be continuous, discrete, or categorical, e.g., price levels are 
continuous in nature, safety ratings are discrete (ordinal), while engine type (hybrid or gasoline)
is categorical.

**Part-worths** represent the sensitivity of one's preference to each attribute level. This is under
the assumption that the preference ($u$) is a linear function of all levels: 
$$u({\bf x}) = \beta_{11} x_{11} + \beta_{21} x_{21} + \cdots $$,
where $\beta_{ij}$ is the part-worth for the $j$th level of the $i$th attribute.

Note that the above formulation assigns each level an individual part-worth, thus it models the nonlinear
preference for each attribute. This is not always necessary if we know that a linear trend exists for 
certain attributes.
For example, if we assume that people get happier linearly with lower price, then we can set
$\beta_{\text{price}}\text{Price}$.

### Generation of a DCA survey
We will use ```generate_survey.m``` here. This script allows you to set up the attributes and levels 
that you believe your consumer group cares about.
To do so, simply modify the *attributes* and *levels* variables in the following:

```
%%%%%%%%%%%%%%%%%%%%%%% Enter survey settings %%%%%%%%%%%%%%%%%%%%%%%%%%%
attributes = ***;
levels = ***;
number_questions = 10; % MAE540: Do not change
number_alternatives = 2; % MAE540: Do not change
%%%%%%%%%%%%%%%%%%%%%%% Enter survey settings %%%%%%%%%%%%%%%%%%%%%%%%%%%
```

The number of questions and the number of alternatives are fixed, i.e., you will have a survey
with 10 pairwise comparison questions. Note that the survey won't work properly if you add new pairwise
comparison blocks by copying from these existing ones in Qualtrics. 

Running the MATLAB script will create a file with the extension ```.qsf```. On Qualtrics, choose 
```tools -> import survey``` to upload this file and create a new survey. 

### Testing the survey
Once you set up the survey, and before you launch it, please preview the survey to make sure it 
flows well and is free of bugs. To do so, click the **Preview Survey** button. 

### Launch the survey
Once the survey is all set, you can launch it by email or through an anonymous link. You can find 
these choices under the ```Distributions``` tab.

### Download the data
You can download the currently stored data any time during the launch. To do so, go to the ```Data & Analysis```
tab and choose **Export & Import->Export Data->Export Data with Legacy Format**. Note that choosing 
"Download Data Table"
will also work but the resulting csv file will have a slightly different format and you will need to 
modify the analysis code
to accommodate this.

## Data analysis

### Preprocess the data
The first thing we need to do is to remove all unnecessary information from the downloaded csv file. 
Once done, your file should have rows that look like the following:

| choice to question 1 (this should be either 1 or 2) | product1_attribute1_level | product1_attribute2_level | ... | product2_attribute1_level | ... |

To explain, 

* each row contains the choices of one participant
* each row has 10 sections corresponding to 10 questions
* in each section, the first column is either 1 or 2, indicating the chosen product in that pair
* the rest of the columns in a section represent the attribute level configurations of the two products. Product 1 goes first.

### Specify the preference model
We will use "analysis.m" for setting up the model and conducting analysis. 

First, make sure that the attributes and levels in this code are set to be 
consistent with the survey.

Now we need to look at how many part-worths to include in the 
preference (or called *utility*) model. In the worst case,
one would need to assign part-worths to every attribute level, 
if every attribute contributes nonlinearly
to the preference. However, using a lot of attributes and/or levels 
while the number of participants is small could lead to a model with high uncertainty. 
The rule of thumb is to avoid having more part-worths than the amount of pairwise 
choice responses you collected. In the case of a small amount of responses,
we would try to simplify the preference model. 
For example, as mentioned above, it is often reasonable to consider that price 
has a linear (and negative)
impact on human choice making, i.e., more expensive products 
attract less people, given all other attributes the same.
Thus we only need one part-worth for price to model consumers' sensitivity to price.

The preference model can be set up by the following lines in the code:

```
x = [x(:,1:5)*[15000,25000,35000,45000,55000]'/10000,x(:,6:8),...
    x(:,9:13)*[20,30,40,50,60]'/10,x(:,14:16),x(:,17:21)*[2,4,6,8,10]',...
    x(:,22:24),x(:,25:end)*[100,200,300,400]'/100];
number_features = size(x,2);
```

Here $x$ is the data matrix containing all alternatives shown during the survey. Columns represent attributes.
The above code turns binary codings of price, MPG, acceleration, and range into real-valued ones,
so as to reduce the number of part-worths to estimate, assuming that consumers' preference change
linearly with respect to these attributes.
 
Accordingly, one will also need to change the following line (see the following explanation on random and fixed coefficients as well):

```
NAMES = {'Price';'US';'European';'Asian';'MPG';'3 Stars';'4 Stars';'5 Stars';...
    '0-60 Acc';'Gasoline';'Hybrid';'EV';'Range'};
```

This line specifies the name tags for each part-worth. As you can see, for linear attributes, such as Price,
the tag is on the attribute itself, while for nonlinear ones, such as Make, we will need to specify
the levels as each one of them has a part-worth.

### Create a mixed logit model
Some other details can be fine-tuned.

**Random Coefficients** are the subset of part-worths that you assume will be different for each participant.
The algorithm will provide a population-level estimate of these part-worths and also the individual-level ones.
This allows you to identify clusters of consumer groups and potentially design a product family for each group.
To set up random coefficients, change the following line:

```
IDV = [3+(1:number_features)',ones(number_features,1)];
```

Here IDV is a matrix with 2 columns. The first is for part-worth IDs, while the second for their corresponding model distributions.
You can use "normal" if the coefficient can be either positive or negative (i.e., some people like it one way and others the opposite).
Or you can use "lognormal" (or "truncated normal") if the coefficient should always be positive (e.g., people always prefer lower price, 
or equivalently, the coefficient on the negative price should always be positive).

**Fixed coefficients** are shared part-worths across the population. 

**Covariance** of random coefficients can be enabled by the following line:

```
FULLCV=1;
```

When set to 1, the algorithm will estimate the covariance matrix of the random coefficients, i.e., to figure out how one's preference
on one attribute (or level) goes along with another. When set to 0, we assume that each random coefficient is drawn 
independently from their own distributions, i.e., the covariance matrix is diagonal.

### Report your results
Once you finish running the algorithm, you will see a report in the console regarding the population-level part-worth estimates.

```
                            Mean      StdDev     Share<0    Share=0
Price      normal        -44.1162    35.0456     0.9005     0.0000
US         normal          4.5242     3.0156     0.0675     0.0000
European   normal        -10.6381     3.3212     0.9995     0.0000
Asian      normal        -16.4397     6.0171     0.9955     0.0000
MPG        normal          4.3942    18.6809     0.4010     0.0000
3 Stars    normal          4.7563     1.5386     0.0005     0.0000
4 Stars    normal          9.8865     3.5058     0.0025     0.0000
5 Stars    normal         76.0481     9.7685     0.0000     0.0000
0-60 Acc   normal         -1.9035     3.8505     0.6955     0.0000
Gasoline   normal         10.4817     1.4848     0.0000     0.0000
Hybrid     normal         10.6684     3.1326     0.0000     0.0000
EV         normal         18.4972    29.3292     0.2635     0.0000
Range      normal         20.6140    27.1308     0.2265     0.0000
```

You can also find the individual level estimates from the variable "cmeans".

[code]: /_teaching/productdesign/discrete_choice_analysis.zip
[3]: http://eml.berkeley.edu//~train/
[namwoopaper]: http://designinformaticslab.github.io/project-crowdsourcing/2016/05/29/carmax.html
