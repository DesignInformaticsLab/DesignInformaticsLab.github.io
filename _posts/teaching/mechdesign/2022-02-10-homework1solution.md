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
<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>

### Problem 1-4

See [solutions](/_teaching/mechdesign/Homework/Homework 1 Solutions.pdf).

### Problem 5

Following the discussion in class, we first get the bending moment function

$$M(x) = -Fl+Fx$$

Consider changing cross-sections

$$M/I = -\frac{Fl}{I_1} + \frac{Fx}{I_1} + (\frac{F}{I_2}-\frac{F}{I_1})<x-l/2>^1 
+ (-\frac{Fl}{2I_2}+\frac{Fl}{2I_1})<x-l/2>^0$$

With two integrations and using the conditions $$\theta(0) = 0$$ and $$y(0)=0$$, we get

$$y(l) = -\frac{Fl^3}{24}(1/I_2 + 7/I_1)$$ or $$y(l) \propto 1/I_2 + 7/I_1 $$

Notice that $$I \propto r^4 $$ where $$r$$ is the radius of the circular cross-section, and that
$$r_1^2 + r_2^2 = C$$ where $$C$$ is a constant, we get

$$y(l) \propto (C-a)^{-2} + 7a^{-2}$$, where $$a = r_1^2$$. Thus $$y(l)$$ reaches the minimal deflection when
$$a = \frac{C (7^{1/3})}{1+(7^{1/3})}$$.






        





