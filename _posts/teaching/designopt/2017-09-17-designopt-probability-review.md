---
categories: designopt_tutorial
layout: opt_default
title:  Probability and Statistics Review
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

## Probability and Statistics Review

The topic on probability and statistics is seemingly off for an optimization class, but in fact it is a closely 
related topic. There are several reasons to pick up basic probability and statistics background before 
we move forward in the class.

1. **Response surface**: The evaluation of engineering systems often requires significant computational cost, 
which makes optimization algorithm unafforable or even intractable. In these case, response surface methods 
can help. A response surface is a **statistical** model that approximates the true physical responses of 
the system to be designed, allowing fast prediction of system performance
without running the actual simulations or experiments. 

2. **Parameter estimation**: Some systems under design may contain unknown parameters, e.g., material 
elasticity or battery resistance. To be able to optimize such systems, we need to first identify these 
parameters. Parameter estimation is essentially a regression problem.

3. **Reliability based design optimization**: Some design optimization problems have probabilistic 
objective, e.g., the profit of selling a product, or fatigue of a material, due to uncontrollable 
factors, e.g., consumer choices, or material initial cracks. In these 
cases, it is important that we not only design for good average performance, but also for minimal 
chance of failure. For example, one can define the objective as $$F(x) = p(f(x)>f^*)$$ where 
$$f^*$$ is a lower bound. To optimize for such an objective, one will
need to quantify the probabilistic distribution of $$f(x)$$.
 
### Probability vs. statistics
 
**Probability** theory is about the derivation and analysis of 
**models** that may help to explain real-world observations through deduction. E.g., we can deduct the 
probability of having two students with the same birthday 
in the class without using data.
 
**Statistics** is about the analysis of **data** that may help to derive hypotheses
and models through induction.
E.g., we can test the hypothesis that people born more often in the fall (I made it up) if we
observe such a trend from the data.

### Continuous random variables

Probability density function (pdf)} $$f_X(x)$$ of random variable $$X$$ describes the probability:

$$P(x_1 \leq X \leq x_2) = \int_{x_1}^{x_2} f_X(x)dx$$

pdf properties: $$f_X(x) \geq 0, \qquad \int_{-\infty}^{\infty} f_X(x) = 1$$

Let $$X$$ be a continuous random variable with pdf $$f_X(x)$$. The **mean** (expected value) 
of $$X$$ is $$\mu = E(X) = \int_{-\infty}^{\infty} x f_X(x) dx$$.

The variance is $$\sigma^2 = \int_{-\infty}^{\infty} (x-\mu)^2 f_X(x) dx$$.

### Normal distribution

A normal distribution has pdf

$$f_X(x) = \frac{1}{\sigma\sqrt{2\pi}}e^{-\frac{(x-\mu)^2}{2\sigma^2}}$$
 
When $\mu = 0$ and $\sigma = 1$, we have a {\bf standard} normal distribution.

### How to derive the normal pdf?

Consider throwing a dart at the origin of an x-y plane. You are aiming at the origin, but random errors 
in your throw will produce varying results. We assume that:

* errors in x and y directions are independent
* chance to hit anywhere on a circle is the same
* large errors are less likely than small errors

See [the derivation of normal pdf](http://www.ncssm.edu/courses/math/Talks/PDFS/normal.pdf)

### Probability calculation under normal pdf

For a general normal distribution random variable $$X \sim N(\mu, \sigma^2)$$, the probability for $$X$$ to assume a 
value between $$x_1$$ and $$x_2$$ can be calculated by using definition:

$$P(x_1 \leq X \leq x_2) = \int_{x_1}^{x_2} \frac{1}{\sigma\sqrt{2\pi}} e^{\frac{(x-\mu)^2}{2\sigma^2}}dx$$
    
This integral does not have a closed-form solution.

### Cumulative distribution function (cdf)

The cdf for a random variable $$X$$ is

$$F_X(x) = \int_{-\infty}^{x} f_X(x)dx$$.

Therefore
$$P(x_1 \leq X \leq x_2) = F_X(x_2) - F_X(x_1)$$

### Transformation to standard normal
    
A general normal random variable $$X \sim N(\mu, \sigma^2)$$ can be transformed in to a 
standard normal random variable $$Z$$ by

$$Z = \frac{X-\mu}{\sigma}$$

Probability calculation
$$P(x_1 \leq X \leq x_2) = P(\frac{x_1-\mu}{\sigma}\leq \frac{X-\mu}{\sigma} \leq \frac{x_2-\mu}{\sigma}) = P(z_1 \leq Z \leq z_2)$$.

### Exercise 1

A certain type of storage battery lasts, on average, 3 years with a standard deviation of 0.5 years. 
Assuming that the battery life are normally distributed.

Determine the probability that a given battery will last more than 2.3 years.

Determine the probability that a given battery will last more than 2 but less than 3.5 years.

### Independently and identically distributed random variables

Let repeated measurements $$x_1, x_2, \cdots, x_n$$ be drawn from the same distribution. 
We can consider these measurements as realizations of $$n$$ **identically and independently distributed** (iid) random variables:

$$X_1, \cdots, X_n \sim f_X(x)$$,

with mean $$\mu$$ and variance $$\sigma^2$$.

Let $$\bar{X} = \frac{1}{n}\sum_{i=1}^n X_i$$ be the average of these measurements. The mean of $$\bar{X}$$ is

$$\mu_{\bar{X}} = E(\frac{1}{n}\sum_{i=1}^n X_i) = \mu$$.

The variance is

$$\sigma^2_{\bar{X}} = E\left((\frac{1}{n}\sum_{i=1}^n X_i - \mu)^2\right) = \frac{\sigma^2}{n}$$.

Therefore, the average of normal random variables is a random variable:

$$\bar{X} \sim N(\mu, \frac{\sigma^2}{n})$$.

### Exercise 2

A voltage measurement $$X$$ has a normal distribution with $$\mu$$ = 40 (V) and $$\sigma$$ = 6 (V).

Find the value of $$x$$ such that $$P(X \leq x) = 45\%$$

Find the value of $$x$$ such that $$P(X \geq x) = 14\%$$

Find the value of $$d_1$$ such that $$P(\mu - d_1 \leq X \leq \mu + d_1) = 90\%$$

If 3 measurements are made and averaged, find the value of $$d_2$$ such that $$P(\mu - d_2 \leq X_{avg} \leq \mu + d_2) = 90\%$$

### Likelihood

Consider a pdf $$p(x;\theta)$$ where $$x$$ is the random variable and $$\theta$$ is the parameter of the pdf. E.g., when 
the pdf is a normal distribution, $$x \sim p(x;\theta)$$ where $$\theta$$ represents the mean and the standard deviation.

If we are given data $$x_1$$, $$x_2$$, ...,$$x_n$$. Can we **estimate** what $$\theta$$ is?

Parameter estimation relies on the concept of **likeliood**.

Here consider that $$x_1$$, $$x_2$$, ...,$$x_n$$ are iid samples from $$p(x;\theta)$$. Then the likelihood function is

$$ L(\theta; x_1,\cdots,x_n) = \prod_{i=1}^n p(x_i;\theta)$$.

Or more often, we use the **negative log-likelihood** function:

$$ l(\theta; x_1,\cdots,x_n) = -\sum_{i=1}^n \log p(x_i;\theta)$$.

The **maximum likelihood estimations** (MLE) are derived by minimizing $$l$$ with respect to $$\theta$$. Take normal
distribution as an example, we have

$$l(\theta; x_1,\cdots,x_n) = \sum_{i=1}^n (\frac{(x_i-\mu)^2}{2\sigma^2} + \log \sqrt{2\pi} + \log\sigma)$$

The optimal solutions are $$\mu_{MLE} = \frac{\sum_{i=1}^n x_i}{n} $$, and $$\sigma_{MLE}^2 = \frac{\sum_{i=1}^n (x_i-\mu)^2}{n} $$.

Notice that both $$\mu_{MLE}$$ and $$\sigma_{MLE}^2$$ are random variables since $$x_i$$ are random variables.

The mean of $$\mu^*$$ is $$\mu$$, thus we call $$\mu^*$$ an **unbiased** estimate.

For $$\sigma_{MLE} = \frac{\sum_{i=1}^n (x_i-\mu)^2}{n} $$, since the calculation involves $$\mu$$ which is unknown, one can 
plug in $$\mu_{MLE}$$ as an approximation. However, doing so will make $$\sigma_{MLE}$$ a biased estimate. One can check by calculating
the mean of $$\sigma_{MLE}^2$$

$$\mathbb{E}[\sigma_{MLE}^2] = \mathbb{E}[\frac{\sum_{i=1}^n (x_i-\mu)^2}{n}] = \frac{n-1}{n} \sigma^2$$.

Therefore, we use the [correction](https://en.wikipedia.org/wiki/Bessel%27s_correction) $$\sigma_{MLE}^2 = \frac{\sum_{i=1}^n (x_i-\mu)^2}{n-1}$$.


