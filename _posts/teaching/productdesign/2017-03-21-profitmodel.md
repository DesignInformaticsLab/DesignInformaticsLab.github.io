---
categories: productdesign_lecture
layout: apd_default
title:  Macroeconomics and Profit Model
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


# Macroeconomics and Profit Model
by Max Yi Ren

## Disclaimer
This [lecture note][1] is created by Dr. Namwoo Kang and Dr. Panos Papalambros. 
The [spreadsheet for demonstration][2] is from Dr. Alex Burnap and Dr. Panos Paplambros. 
Others from the [ODE lab][3] also contributed to these materials throughout years. 

The following activities are based on the [course spreadsheet][4].

## Activity 1
Consider you are competing companies selling 
exactly the same product, say a teddy bear. The consumer's part-worth on the price is -1. Discuss
among yourselves to come up with a MSRP. 

Note: The market share of your product depends on not only the price you set, but also those of your 
competitors. A common model for predicting the market share is the following:

$$s_i = \frac{\exp(\theta p_i)}{\sum_{j=1}^N \exp(\theta p_j)},$$

where $s_i$ is the $i$th companies market share, $\theta$ is the part-worth of the price 
(here we assume a homogeneous preference model for all consumers), $p_i$ is the price set by
company $i$. 

In this case, the profit of a company is simply $s_ip_i$.

* Task 1: Compete in a simulated market and see who has the highest profit. 
* Task 2: Learn from your previous lesson and compete again. How will you change your price?
* Task 3: If all competitors are driven by profit, does there exists an equilibrium of prices, 
i.e., a set of prices that no one is motivated to change?

## Activity 2
Now include design in your decision making: Let the design variables be the size of the bear, and
the fluffiness. The artificial part-worths are -0.1, 0.0008, and 1.5 for price, size and fluffiness.
The unit cost is 0.001 (dollar per inch cubed) and 5 (dollar per fluffiness). The range of size is 
1000 to 100000, and 1 to 10 for fluffiness. Make a decision on your MSRP, size and fluffiness. 

Note: The profit in this case will be $s_i(p_i-c_i)$, where $c_i$ is the unit cost.

[1]: /_teaching/productdesign/ProfitModel.pptx
[2]: /_teaching/productdesign/BeamProfitMaximizationExample.xlsx
[3]: http://ode.engin.umich.edu
[4]: https://docs.google.com/spreadsheets/d/1sCL38r9I73seXU7IXAj6VPdroeFTddfsGBVgFXyvBMA/edit#gid=5391810