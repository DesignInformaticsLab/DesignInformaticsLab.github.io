---
categories: designopt_tutorial
layout: opt_default
title:  Modern gradient descent algorithms
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

## Modern Gradient Descent Algorithms

This is a concise summary of recent developments in gradient descent algorithms. The algorithms
we discuss are mostly used for problems that (1) require a large amount of data for gradient calculation 
 (e.g., for machine learning and optimal control), 
 (2) cannot afford Hessian calculation, and (3) cannot afford line search. This introduction is based on Sebastian Ruder's [post](http://ruder.io/optimizing-gradient-descent/)
 on the same topic.

### **Table of Contents**
1. [Stochastic gradient descent](#sgd)
2. [Momentum and Nestrov accelerated gradient](#nag)
3. [AdaDelta and RMSprop](#adadelta)
4. [Adam and beyond](#adam)

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

#### Momentum

The momentum method address the oscillation issue of SGD (and gradient descent) when the objective has
large condition number (largest eigenvalue of its Hessian divided by smallest eigenvalue). It has
the following update scheme:
$$ \theta_{k+1} = \theta_k - v_t $$ and $$ v_t = \gamma v_{t-1} + \eta \nabla_{\theta} F$$.

If one considers gradient descent as a proportional controller, then the Momentum method is similar to 
a discrete-time integral controller: It is good at correcting persistent error, and thus has better performance
at addressing ill-conditioned problems than gradient descent. See this
[paper](https://www4.comp.polyu.edu.hk/~cslzhang/paper/CVPR18_PID.pdf) on the connection between PID and momentum.

#### Nestrov Accelerated Gradient

Notice that a pure integral controller will diverge from the equilibrium due to the momentum. Thus we 
need an algorithm that slows down when the solution approaches the equilibrium. Thus comes NAG.

The idea is this: We know that we will use our momentum term $$\gamma v_{t-1}$$ to move the parameters $$\theta$$. 
Thus $$\theta_k-\gamma v_{t-1}$$ gives an approximation of the next position of the parameters. 
We can calculate the gradient not with respect to the current parameters $$\theta_k$$ 
but this approximated future position. This leads to the update:

$$ \theta_{k+1} = \theta_k - v_t $$ and $$ v_t = \gamma v_{t-1} + \eta \nabla_{\theta} F(\theta_k-\gamma v_{t-1})$$.


### **AdaDelta and RMSprop <a name="adadelta"></a>**

#### AdaGrad ([paper](http://www.jmlr.org/papers/volume12/duchi11a/duchi11a.pdf))

When using SGD on a sparse set of data (i.e., data that allows you to improve in one direction or another, but not all 
together), the improvement in each dimension will be uneven. To address this issue, we would like an algorithm
that makes more aggressive moves in directions that haven't been improved much, and less in those that have been updated 
frequently. AdaDelta and RMSprop do this.

Before talking about AdaDelta or RMSprop algorithms, we shall introduce
AdaGrad first. The AdaGrade update rule is given by the following formula:

$$ G^{k} = G^{k-1} + \nabla J(\theta ^{k-1})^{2},$$

and 

$$ \theta ^{k} = \theta ^{k-1} - \frac{\alpha}{\sqrt{G^{k-1}}}\cdot \nabla J(\theta ^{k-1}).$$

Here $$G$$ is the historical gradient information. For each parameter we store sum of squares 
of its all historical gradients, which is to be used to scale the learning rate in later calculation. 
**Unlike SGD, the learning rate of AdaGrad is different for each of the parameters.** The parameter 
value will be larger if the historical gradients were smaller and vice versa.

Notice that in AdaGrade, the learning rates keep decreasing and will finally approach 
zero, which is problematic. This issue is resolved in AdaDelta and RMSprop.

#### RMSprop

RMSprop uses a decay on the accumulated historical gradients. The update rule is shown as the following steps:
- Compute gradient $$g_t$$ at iteration $t$

- Accumulate gradients (AdaGrad-like step)

$$ E[g^2]_{t} = \rho E[g^2]_{t-1}  + (1-\rho) g_t^2$$

- Compute update

$$\Delta \theta_{t}=-\frac{\eta}{\sqrt{E[g^{2}]_{t} + \epsilon}}g_{t}$$

<!--- Accumulate updates (momentum-like step)-->

<!--$$E[\Delta x^{2}]_{t}=\rho E[\Delta x^{2}]_{t-1} + (1-\rho)\Delta x_{t}^{2}$$-->

- Apply the update

$$\theta_{t+1} = \theta_{t} + \Delta \theta_t$$

$$\rho$$ is a decay constant and $$\epsilon$$ is for numerical stability (usually very small number).

#### AdaDelta ([paper](https://arxiv.org/abs/1212.5701))

Adadelta is similar to RMSprop in both formulation and performance. It takes the following form:
<!--combines two ideas, first one is to scale learning rate based on historical gradient while -->
<!--taking into account only recent time window - not the whole history, unlike AdaGrad. The second one is to -->
<!--use component that serves as acceleration term, that accumulates historical updates, similar to momentum.-->

Let $$RMS[\Delta \theta]_t = \sqrt{E[\Delta \theta^2]_t + \epsilon}$$, 
define $$\Delta \theta_t = -\frac{RMS[\Delta \theta]_{t-1}}{RMS[\Delta \theta]_t}g_t$$. Then the update is 
$$\theta_{t+1}= \theta_{t} + \Delta \theta_{t} $$.

### **Adam and beyond <a name="adam"></a>**

#### Adam ([paper](https://arxiv.org/abs/1412.6980))

Adam is another optimization algorithm that has be widely used in neural network community. 
It is similar to AdaGrad, but with adaptive parameters choice. The updating rule 
for Adam is determined based on estimation of first (mean) and second-order moments of the historical gradients. 
Thus Adam combines the benefits of AdaDelta/RMSprop and Momentum methods.

Adam update rule consists of the following steps:

- Compute gradient $$g_t$$ at current time t

- Update biased first moment estimation

$$m_t=\beta_1 m_{t-1} + (1-\beta_1)g_t$$

- Update biased second-order moment estimation

$$v_t=\beta_2 v_{t-1} + (1-\beta_2)g_{t}^{2}$$

- Compute bias-corrected first-order moment estimation

$$\hat{m}_t = \frac{m_t}{1-\beta^{t}_{1}}$$

- Compute bias-corrected second-order moment estimation

$$\hat{v}_t=\frac{v_t}{1-\beta^{t}_2}$$

- Update parameters

$$\theta_t = \theta_{t-1}-\alpha \frac{\hat{m}_t}{\sqrt{\hat{v}_t}+\epsilon}$$

#### Other algorithms

There are more advanced algorithms appearing from time to time, ex. AdaMax, 
replacing the second order moment $$v_0$$ with an infinite-order moment to make the 
process more stable; [Nadam](https://www.openreview.net/pdf?id=OM0jvwB8jIp57ZJjtNEZ), 
combining Adam and NAG together.

