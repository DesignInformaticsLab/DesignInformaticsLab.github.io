---
categories: productdesign_lecture
layout: apd_default
title:  Microeconomics and Profit Model
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


# Microeconomics and Profit Model
by Max Yi Ren

## Disclaimer
This [lecture note][1] is created by Dr. Namwoo Kang and Dr. Panos Papalambros. 
The [spreadsheet for demonstration][2] is from Dr. Alex Burnap and Dr. Panos Paplambros. 
Others from the [ODE lab][3] also contributed to these materials throughout years. 

The following activities are based on the [course spreadsheet][4].

## Activity 1: Market simulation with pricing
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

## Activity 2: Market simulation with pricing and product positioning
Now include design in your decision making: Let the design variables be the size of the bear, and
the fluffiness. The artificial part-worths are -0.1, 0.0008, and 1.5 for price, size and fluffiness.
The unit cost is 0.001 (dollar per inch cubed) and 5 (dollar per fluffiness). The range of size is 
1000 to 100000, and 1 to 10 for fluffiness. Make a decision on your MSRP, size and fluffiness. 

Note: The profit in this case will be $s_i(p_i-c_i)$, where $c_i$ is the unit cost.

## Activity 3: Optimal decision making
From Activity 2, you might find it hard to make a decision on what design attribute levels
and prices to set, in order to maximize your profit given all your competitors. 
To this end, develop an optimization routine in MATLAB to automatically adjust your
design decisions according to the market. 

A template of the code can be found [here][5].

Once done, run the competition again, with your algorithm rather than gut feeling.

### Brief intro of fmincon: The optimizer for nonlinear constrained problems
Nonlinear constrained optimization problems have the following general form:

$$\min_x f(x)$$

$$\text{subject to}: g(x)\leq 0, h(x)=0$$ 

Here $f(x)$, $g(x)$ and $h(x)$ are the objective, the inequality constraints, and the
equality constraints, respectively. $x$ are the variables. In our case, the objective
is the profit, and constraints are related to bounds of design variables and other 
engineering considerations.

The usage of fmincon can be found by typing ```help fmincon``` in the MATLAB terminal. 
The most common call has the following form

``` [x,f] = fmincon(@(x)objective(x,arg1,arg2,...),x0,A,b,Aeq,beq,lb,ub,@(x)nonlinear)```

Here ```arg1```, ```arg2``` are inputs to the objective function. In our case, these
could be part-worths and product costs that influences the profit, yet are not part of 
the variables. ```Ax <= b``` are the linear inequality constraints; ```Aeq x = beq``` are the 
equality constraints.  ```lb``` and ```ub``` are the lower and upper bounds on the variables.
```@(x)nonlinear``` is the function handle for nonlinear constraints.

## Activity 4: The equilibrium
You may noticed from Activity 3 that there exists an equilibrium of the market. Conduct
analysis to find out what that equilibrium is. 

A template of the code can be found at the bottom of "optimal_profit_template.m". Need to 
download files from Activity 3.

## Activity 5: Formulate your own decision problem
If your company plans to upgrade manufacturing capabilities with a max budget of $500,000, how 
will you rigorously plan the upgrade? Consider the following upgrade costs:

* Upper bound on teddy bear size: $100 for each additional unit improvement
* Upper bound on teddy bear fluffiness: $100,000 for each additional unit improvement

Does your decision depend on your competitors' product positioning?

## Activity 6: A more complicated game
If you want to form an organization with companies to maximize your profit, 
how many companies will you include in the organization? Consider a penalty of $1,000,000 for betrayal.

[1]: /_teaching/productdesign/ProfitModel.pptx
[2]: /_teaching/productdesign/BeamProfitMaximizationExample.xlsx
[3]: http://ode.engin.umich.edu
[4]: https://docs.google.com/spreadsheets/d/1sCL38r9I73seXU7IXAj6VPdroeFTddfsGBVgFXyvBMA/edit#gid=5391810
[5]: /_teaching/productdesign/optimal_profit_template.zip