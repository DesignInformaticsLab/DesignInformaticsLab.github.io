---
categories: productdesign_lecture
layout: apd_default
title:  Business Plan
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


# Business Plan
by Max Yi Ren

## Disclaimer
This lecture note is created based on existing materials from the [ODE lab][3] at University of Michigan. 

## Why a Business Plan
The business plan shows how your proposed project makes value. 
It describes a projected reality and **includes a lot of assumptions**.

## Business positioning

* Determine who you are and who is your direct customer. If there is also an indirect customer,
  decide the structure of the three-way relationship. Write it down.

* Determine if you make a business case for yourself or for your customer. In the second case,
  decide what it is that you propose for yourself (sell or gift an idea, a patent, a product, ...). Write it
  down.
  
## Business plan elements

  1. Business opportunity
      1. Business objective (why)
      2. Product description (what)
      3. Market analysis (where)
      4. Capital and personnel resources (how)
    
  2. Financial data
      1. Capital equipment and supply list 
      2. Break-even analysis 
      3. Three-year summary of Pro-forma income and cost projections 
    
  3. Supporting documents
      1. Existing patents
      2. Technical analysis and benchmarking
    
## Interest
Interest can be thought as the "rental charge" for the use of money.

Simple interest:
    
* Principal ($P$) = dollar value at the time given
* (Discount) Rate ($i$) = interest earned per unit principal per unit time
* Future value ($FV$) =  value at a future point

Formulas:

* One period: $FV = P + Pi = P(1+i)$
* Multiple ($n$) periods: $FV = P(1+i)^n$

### Present value
Future value can be converted into present value. 

Present value allows the evaluation of multiple value amounts
arriving at different times to be equivalently valued at a given
point in time.

Present value $PV = FV/(1+i)^n$

### Series compound future value
Series of equal payments ($R$) given at regular time periods
$$ FV = [\frac{(1+i)^n-1}{i}]R$$

Practice: Calculate the future value of $R = 5,000$ at the end of each year for 5 years at $6\%$.

### Series present value
Series of equal payments ($R$) given at regular time periods

$$ PV = [\frac{(1+i)^n-1}{i(1+i)^n}]R $$

Practice: Calculate the present value of $R = 5,000$ at the end of each year for 5 years at $6\%$.

### Gradient series
$R$ now changes $g\%$ at the end of each year

$$PV = [\frac{1-(1+g)^n(1+i)^{-n}}{i-g}]R$$, when $g=i$, we have $$PV = \frac{nR}{1+i}$$.

### Net present value
With a series of $R$s. 

$$NPV = \sum_{t=0}^N \frac{R_t}{(1+i)^t} $$, 
where $R_t$ is the investment at time $t$.

### Using Excel for calculation

* Future value = FV(rate,nper,pmt,pv,type)
* Present value = PV(rate,nper,pmt,fv,type)
* Net present value = NPV(rate,value1,value2, ...)
* Non-uniform net present value = XNPV(rate,values,dates)

## Simple investment economics
How do we evaluate alternative financing and investment decisions for launching a new product?

Investment economics or capital budgeting seeks to answer
this question.

* Net present value (NPV)
* Annual cost
* Internal rate of return (IRR)
* Breakeven analysis

### How to calculate NPV
see above.

### How to calculate annual cost
Calculate the annual investment cost using 
$$ R = [\frac{i(1+i)^n}{(1+i)^n-1}]PV $$, 
or using the Excel function pmt(rate,nper,pv,fv,type); the annual maintenance cost, income, etc.

### How to calculate IRR
**Discount rate**: the rate at which the present value of a series of
investments is equal to the present value of the returns on
those investments. 

For an investment that requires and produces a number of cash
flows over time, **Internal Rate of Return** is the discount rate
that makes the net present value of those cash flows equal to
zero.

For a set of transactions over time, the IRR on your transactions
will give you a picture of your overall rate of return.

Given the NPV formula:
 
$$NPV = \sum_{t=0}^N \frac{R_t}{(1+i)^t} $$, 

IRR is the discount rate which sets the NPV of the given cash 
flows made at the given times to zero. This is a nonlinear equation that must be 
solved numerically. Note that some of the cash flow $R_t$s are expenses.

### How to perform break-even analysis
Find how many periods are needed to equal the present value (PV) of
the investment cost

## Activity 1: Interest
Use [this problem][1] to practice the above analysis tools.



[1]: https://docs.google.com/spreadsheets/d/1sCL38r9I73seXU7IXAj6VPdroeFTddfsGBVgFXyvBMA/edit#gid=428714885
[3]: http://ode.engin.umich.edu