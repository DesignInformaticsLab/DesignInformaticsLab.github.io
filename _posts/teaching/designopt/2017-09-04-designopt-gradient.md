---
categories: designopt_tutorial
layout: opt_default
title:  Modern gradient descent algorithms
published: false
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

This is a concise summary of recent developments in gradient descent algorithms. The algorithms
we discuss are mostly used for problems that (1) require a large amount of data for gradient calculation 
 (e.g., for machine learning and optimal control), 
 (2) cannot afford Hessian calculation, and (3) cannot afford line search. This introduction is based on Sebastian Ruder's [post][ruder]
 on the same topic.

### **Table of Contents**
1. [Stochastic gradient descent](#sgd)
2. [Momentum and Nestrov accelerated gradient](#nag)
3. [AdaDelta and RMSprop](#adadelta)
4. [Adam and beyond](#adam)
4. [Summary](#summary)

***

### **Stochastic Gradient Descent <a name="sgd"></a>**
Consider problems of the type $$\min_{\theta} F(\theta) \doteq \sum_{i=1}^N f_i(x_i,\theta)$$ where $$\theta$$ are
the variables, $$f_i$$ is a loss function for the $$i$$th scenario with parameters $$x_i$$. 
In control, $$f_i$$ may represent the difference between a target system state $$x_i$$ and the actual
state governed by parameters $$\theta$$ of a controller; 
in parameter estimation (system identification), $$f_i$$ represents the difference between the 
observation $$x_i$$ and a model parameterized by $$\theta$$. To find the best $$\theta$$, we 
 will calculate the gradient $$\nabla_{\theta} F = \sum_{i=1}^N \nabla_{\theta} f_i $$. Notice that
 this calculation requires all $$N$$ data points, where $$N$$ could be a large number or ever growing.
 This makes gradient descent computationally inefficient, since each iteration of the descent
 requires recalculation of $$\nabla_{\theta} f_i$$ even though the gradients do not change much
 when the step size is small.

Stochastic Gradient Descent (SGD) is a solution to this issue. In the mini-batch mode, each iteration 
of SGD updates $$\theta$$ based on only a small batch of $$f_i$$: 
$$\theta_{k+1} = \theta_k - \eta \sum_{i=j}^{j+t} \nabla_{\theta} f_i$$,
where $$j$$ is a random index, $$t$$ is the mini-batch size, and $$\eta$$ is a learning rate (step size).

Unlike gradient descent with line search, SGD does not necessarily decrease function value as it only
uses part of the gradient information to take a step. However, it does move towards a local solution
in a long run with much less cost than gradient descent. Note that tuning the learning rate is
critical: a large $$\eta$$ may create a divergent sequence of solutions or lead to early convergence
towards non-optimal solutions; while a small $$\eta$$ may cause slow convergence.
In the following sections, we introduce algorithms that attempt to address this issue of a vanilla SGD.

### **Momentum and Nestrov Accelerated Gradient <a name="nag"></a>**
The momentum method address the oscillation issue of SGD (and gradient descent) when the objective has
large condition number (largest eigenvalue of its Hessian divided by smallest eigenvalue). It has
the following update scheme:
$$ \theta_{k+1} = \theta_k - v_t $$ and $$ v_t = \gamma v_{t-1} + \eta \nabla_{\theta} F$$.

### **AdaDelta and RMSprop <a name="adadelta"></a>**
#### AdaGrad
Before talking about AdaDelta or RMSprop algorithm, let's take a look at teh AdaGrad first. The AdaGrade update rule is given by the following formula:

??????

G is the historical gradient information. For each parameter we store sum of squares of its all historical gradients, which is to be used to scale the learning rate in later calculation. Unlike SGD, the learning rate of AdaGrad is different for each of the parameters. The parameter value will be large if the historical gradients were small and the value will be small whenever historical gradients were large.

In some of the cases the learning rate keep decreasing from iteration to iteration and finally reach near zeros at a large iteration step, which is a potential problem and solved by the AdaDelta algorithm shown as following.

#### AdaDelta
Adadelta combines two ideas, first one is to scale learning rate based on historical gradient while taking into account only recent time window - not the whole history, unlike AdaGrad. The second one is to use component that serves as acceleration term, that accumulates historical updates, similar to momentum.

The update rule is shown as following steps:
- Compute gradient g_t at current time t

- Accumulate gradients(AdaGrad-like step)

- Compute update

- Accumulate updates(momentum-like step)

- Apply the update

where ?? is a decay constant and ?? is there for numerical stability (usually very small number).

#### RMSprop
The purpose of RMSprop is similar to Adadelta, which is used to resolve the diminishing learning rate issue for AdaGrad, whose update process is shown as below:

???????????????????????


### **Adam and beyond <a name="adam"></a>**
Adam is another optimization algorithm that has be widely used in neural network community. It is similar to AdaGrad, but with adaptive parameters choice. The updating rule for Adam is determined based on estimation of first(mean) and second raw moment of historical gradients. These numbers are corrected at each iteration.

Adam update rule consists of the following steps:
- Compute gradient ?? at current time t

- Update biased first moment estimation

- Update biased second raw moment estimation

- Compute bias-corrected first moment estimation

- Compute bias-corrected second raw moment estimation

- Update parameters

### **Summary <a name="summary"></a>**
