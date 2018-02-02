---
categories: mechdesign_homework
layout: mechdesign_default
title:  Homework 1 Solution
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


### Problem 1-4

See [solutions](/_teaching/mechdesign/Homework/Homework 1 Solutions.pdf).

### Problem 5

Following the discussion in class, we first get the bending moment function

$$M(x) = -Fl+Fx$$

Consider changing cross-sections

$$M/I = -\frac{Fl}{I_1} + \frac{Fx}{I_1} + (\frac{F}{I_2}-\frac{F}{I_1})<x-l/2>^1 
+ (\frac{Fl}{2I_2}-\frac{Fl}{2I_1})<x-l/2>^0$$

With two integrations and using the conditions $$\theta(0) = 0$$ and $$y(0)=0$$, we get

$$y(l) = -\frac{Fl^3}{24}(1/I_2 + 7/I_1)$$ or $$y(l) \propto 1/I_2 + 7/I_1 $$

Notice that $$I \propto r^4 $$ where $$r$$ is the radius of the circular cross-section, and that
$$r_1^2 + r_2^2 = C$$ where $$C$$ is a constant, we get

$$y(l) \propto (C-a)^{-2} + 7a^{-2}$$, where $$a = r_1^2$$. Thus $$y(l)$$ reaches the minimal deflection when
$$a = \frac{C (7^{1/3})}{1+(7^{1/3})}$$.

Now let's extend this finding to where the beam has $$n$$ sections, each of length $$l/n$$. 
With the same (and really careful) derivation, we get

$$y(l) = \sum_{i=1}^n w_i a^{-2}_i$$, where 

$$w_i = \frac{1}{3n^3}(-(n-i+1)^3+(n-i)^3)$$, 
        
and $$a_i = r_i^2$$. Since $$y(l)$$ is a function of $$a=[a_1,a_2,\cdots,a_n]$$, we will rewrite it as
$$y(a)$$ to make the relation explicit.

We also have a constraint $$g(a) = \sum_{i=1}^n a_i - C = 0 $$ for the overall constant volume.

Finding the minimal deflection requires defining a Lagrangian function:

$$L(a) = y(a) + \lambda g(a)$$,

and setting $$\frac{dL}{da}=0$$ and $$g(a)=0$$. This leads to the following analytical 
solution $$a_i = \frac{C w_i^{1/3}}{\sum_{i=1}^n w_i^{1/3}}$$. The following figure shows $$a_i$$ for 
$$i=1,\cdots,100$$. One can see that $$w_i$$ decreases as $$i$$ increase, therefore the cross-section decreases along 
the beam towards its free tip (I did make a wrong guess of the shape in the class though...).

<img src="/_images/mechdesign/hw1sln1.png" alt="Drawing" style="height: 200px;"/> 






        





