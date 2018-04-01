
# Solving ODE's

MATLAB's `ode45()` solver makes solving ODE's numerically fairly simple (this function uses the [Runge-Kutta (4,5)](https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods) algorithm).  Required inputs is the ODE in question, the time-span vector to solve it for, and an initial condition (more option are available in the MATLAB documentation).  Outputs are the time vector and solution matrix.

For an n-other ODE, MATLAB requires an explicit function definition.  For linear ODE's, assume the form:

`x_dot = Ax`

This function for a n-state p-input model can be described in MATLAB as:

```matlab
function [x_dot] = myfunc(x)

A =  % put your nxn matrix here

x_dot = A*x;

end
```

After your function is declared, choose a time-span and an initial condition and call the function as follows:

```matlab
tspan = [tstart tend];
x0 = % put your nx1 matrix here

[tout,xout] = ode45(@myfunc,tspan,x0);
```

By default, ```ode45``` will give the solved states of x.  If your output function is `y = Cx` consisting of p outputs, you will have to manually find an output using the following code:

```
C = % put your nxp matrix here
y = C*xout;
