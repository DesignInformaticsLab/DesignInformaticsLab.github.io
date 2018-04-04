---
categories: mechdesign_lecture
layout: mechdesign_default
title:  Solving ODEs in Matlab
published: true
---

# Solving ODEs in Matlab

MATLAB's `ode45()` solver makes solving ODEs numerically fairly simple. 
This function uses the [Runge-Kutta (4,5)](https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods) algorithm.  
Required inputs are the ODE in question, the time-span vector to solve it for, 
and an initial condition (more option are available in the MATLAB documentation).  
Outputs are the time vector and solution matrix.

To start, define an explicit first-order ODE in the form:  

`x_dot = f(x)`

This function can be described in MATLAB as:

```matlab
function [x_dot] = myfunc(t,x)

x_dot = f(x); % write out your function f here

end
```

Note that the first argument of `myfunc` is time. If your function does not take time explicitly, you
will still need to put a placeholder there.

After your function is declared, choose a time-span and an initial condition and call 
the function as follows:

```matlab
tspan = [tstart tend];
x0 = % put your nx1 matrix here

[tout,xout] = ode45(@myfunc,tspan,x0);
```

By default, ```ode45``` will give the solved states of x.  If your output function 
is `y = Cx` consisting of p outputs, you will have to manually find an output using the 
following code:

```
C = % put your nxp matrix here
y = C*xout;
```