---
categories: productdesign_tutorial
layout: apd_default
title:  Qualtrics Discrete Choice Analysis Tutorial
published: true
---
# Qualtrics Discrete Choice Analysis (DCA) Tutorial
by Max Yi Ren

I wrote this tutorial under the situation that (1) ASU only support Qualtrics as its survey provider 
and (2) at the moment of writing, Qualtrics does not have discrete choice functionalities. Please
check software/cloud service that provide such functionalities before you delve into this.

The tutorial will have two parts: We first introduce a script that automatically generates
a Qualtrics survey (only the DCA portion) for given attributes and attribute levels. We then
introduce an analysis script based on Kenneth Train's Hierarchical Bayes code, that outputs
the part-worths of attributes and levels.
 
## Product Attributes and Levels
**Attributes** are properties of the product that directly affect the purchase decision of consumers, 
e.g., price, MPG, acceleration, safety for a car. Note that in conventional marketing research, attributes
are only restricted to the quantifiable properties. Recent research in preference learning
has extended to "complex attributes" that are not directly quantifiable, e.g., aesthetics. See *** for example.

**Levels** of an attribute could be continuous, discrete, or categorical, e.g., price levels are 
continuous in nature, safety ratings are discrete (ordinal), while engine type (hybrid or gasoline)
is categorical.

## Survey creation
### Generation of a DCA survey
Please download the [script][1]. 

### Testing the survey
Once you set up the survey, and before you launch it, please preview the survey to make sure it 
flows well and is free of bugs. To do so, simply click the **Preview Survey** button. 

### Launch the survey
Once the survey is all set, you can launch it by email or through an anonymous link. You can find 
these choices under the **Distributions** tab.

### Download the data
You can download the currently stored data any time during the launch. To do so, go to the "Data & Analysis"
tab and choose **Export & Import->Export Data->Download Data Table**. Note that choosing "Export Data with Legacy Format"
will also work but the resulting csv file will have a slightly different format.

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

### Confirm the utility model
Here we need to look at how many part-worths we need to build a good utility model. In the worst case,
one would need to assign part-worths to each attribute level, if everything attribute contributes nonlinearly
to the utility. If you used a lot of attributes and/or levels while your number of participants is small, this
model may not be a good choice. The rule of thumb is that you don't want to have more part-worths to estimate,
than the amount of pairwise choice responses you collected. In the case of a small amount of participants,
we would try to simplify the utility model. For example, it is reasonable to consider that price has a linear (and negative)
impact on human choice making, i.e., more expensive products attract less people, given all other attributes the same.
Thus we only require one part-worth for price.

### Create a mixed logit model
Once you set up the utility model, please run the [mixed logit algorithm][2] to derive the part-worth estimates.

### Report your results


[1]: /
[2]: /