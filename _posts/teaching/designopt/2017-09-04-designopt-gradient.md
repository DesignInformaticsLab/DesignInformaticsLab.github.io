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

### **Adam and beyond <a name="adam"></a>**

### **Summary <a name="summary"></a>**