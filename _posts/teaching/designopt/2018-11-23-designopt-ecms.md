---
categories: designopt_tutorial
layout: opt_default
title:  Hybrid Vehicle Optimal Control
published: true
---

This is a brief description of the
Equivalent Consumption Minimization Strategy (ECMS) code provided by
Dr. [Emrah Bayrak](http://www.aebayrak.com/). The code can be downloaded [here](/_teaching/designopt/ECMS.zip). The entrance
file is ```fMPG.m```.

## Description of files
Below are descriptions of all files. For instructions on the modification,
see the next section.

### Files that need modification

* ```fMPG.m```: This file takes in a ```gear_ratio``` (scalar) and a
drive ```cycle``` name (string). To run the code, please prepare a
drive cycle as a .mat file. This file should contain a matrix
with variable name ```cyc_mph```. The matrix has two columns: the
first column has time steps (starting with 0), the second has
the corresponding velocity values. The outputs are the optimal fuel consumption
(gram) and MPG. The final state of charge (SOC) can be found from the variable ```SOC_fin```.
Desired SOC is set by ```SOC_des```.

* ```hybrid_ECMS_ATC.m```: Main file for the ECMS algorithm.
The function outputs ```MPG```, final SOC (```SOC_fin```),
fuel consumption along time (```FC_plot```), SOC along time (```SOC_plot```),
Mode shifting along time (```Mode_plot```, obsolete for single mode powertrain),
time array (```t_array```), and whether
the powertrain mode is feasible for the given drive cycle (```ISfeas```).

* ```hev_vehicle.m```: Defines all vehicle parameters. **You will need to
modify this file for your vehicle.**

### Files that do not need modification

* ```hev_finaldrive.m```: Defines the transmission torque and speed
based on vehicle torque and speed.

* ```hev_transmission.m```: Defines motor speed and torques based on
transmission and engine speed and torques. **This file is for power-split
powertrain only.**


* ```paretoset.m```: Auxiliary file for finding the pareto optimal
data points from a data set.

* ```PoP_battery.m```: Defines battery power consumption based on battery
voltage and current.

* ```PoP_engine.m```: Defines engine fuel consumption and max torque.

* ```PoP_motor42.m```: Defines motor power consumption and max torque.

### Instruction on modifications

On line 63-64, 126-128 of ```fMPG.m```, and line 70-72 of ```hybrid_ECMS_ATC.m```,
you need to complete the code for computing the motor torque and speed from
engine and transmission torque and speed.

For a parallel hybrid powertrain, the engine, motor, and the transmission share
the same angular speed. The torque from the transmission is split between the engine
and the motor.

For power-split powertrain, the relationship is more involving. You can find
a discussion from this [paper](http://designinformaticslab.github.io/_papers/jmd2016topology.pdf).


