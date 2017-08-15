---
categories: designopt_tutorial
layout: opt_default
title:  Math Review
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

This course will need you to be fluent in basic linear algebra and calculus. 
Please check if you can answer the following questions:

### Linear algebra
* How do you do **matrix multiplication**?
* How do you calculate the **eigenvalues** and **eigenvectors** of a square matrix?
* What is the definition of a **positive definite/positive semidefinite/negative definite/
negative semidefinite/indefinite matrix**?
* What is the **rank** of a square matrix?
* What is the property of a **singular matrix**?
* What is a **symmetric matrix**?
* Let $${\bf X}$$ be a $$n$$-by-$$p$$ matrix, what can you tell about $${\bf X}^T{\bf X}$$?

### Calculus
* What is the definition of a **gradient**?
* What is the **geometric meaning** of a gradient?
* What is a **contour** line?
* What is the relationship between a contour line and a gradient on that line?
* Let a function be $$f(x_1,x_2,...,x_p) = a_1x_1+a_2x_2+...+a_px_p$$. Write the matrix form of this function.
* Let $$f({\bf x}) = {\bf A}{\bf x}$$ where $${\bf A}$$ is $$n$$-by-$$p$$ and $${\bf x}$$ is $$p$$-by-$$1$$. 
Calculate the gradient $$\frac{\partial f}{\partial {\bf x}}$$.
* Let $$f({\bf x}) = {\bf x}^T{\bf A}{\bf x}$$ where $${\bf A}$$ is $$p$$-by-$$p$$ and $${\bf x}$$ is $$p$$-by-$$1$$. 
Calculate the gradient $$\frac{\partial f}{\partial {\bf x}}$$.
* What is the definition of a **Hessian matrix**?
* What is the property of a Hessian?
* Perform 2nd order Taylor's expansion on this function with respect to $$x=0$$: $$f(x) = \exp(ax)$$ where $$a$$ is a scalar.
* Perform 2nd order Taylor's expansion on this function with respect to $${\bf x}={\bf 0}$$: $$f({\bf x}) = \exp({\bf a}^T{\bf x})$$ 
where $${\bf a}$$ and $${\bf x}$$ are $$p$$-by-$$1$$ vectors.
* What is a convex set?
* What is a convex function?

### Tutorials
If you have difficulty answering these questions, please check out the following tutorial:

* [Review 1: Vector and Matrix][1]
* [Review 2: Eigenvalues, Eigenvectors, Matrix Calculus, and Convexity][2]

**Password** is: ME555
  
These tutorials are prepared by [Emrah Bayrak][3] and others at the Optimal Design Lab, the University of Michigan, 
and only shared with this class. Please **DO NOT** share the videos outside of the class.

[1]: https://vimeo.com/149907223
[2]: https://vimeo.com/149966720
[3]: http://www.aebayrak.com/