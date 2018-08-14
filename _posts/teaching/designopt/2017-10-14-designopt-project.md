---
categories: designopt_tutorial
layout: opt_default
title:  Potential Project Topics
published: true
---

## Potential Project Topics

The following are potential topics that you can pick or develop from.
The percentage in the bracket indicates the highest score you can
get by picking the topic.
I will keep adding ideas and references to this list depending on
your interests.

### Autonomous driving

1. Share ride (100%): Consider a city as a graph with finite number of nodes and edges. Each request is represented by
two different nodes for which a path between the two exists, one for pickup and the other for destination. 
Let a finite number of cars be at a subset of nodes. What is the best routing strategy to minimize the overall 
 distance to cover by these cars while meeting all requests?

* Related papers: [Alonso-Mora et al. "On-demand high-capacity ride-sharing via dynamic trip-vehicle assignment"](http://www.pnas.org/content/early/2017/01/01/1611675114.full).

2. Intent decoding and vehicle control (100%): Consider the problem of understanding
the intent of an agent (e.g., a vehicle) through observations of its trajectory,
and react accordingly.
How would the problem change if you (another agent) are interacting with that agent?

* Related papers: [Englert et al. "Inverse KKT: Learning cost functions
of manipulation tasks from demonstrations"](http://journals.sagepub.com.ezproxy1.lib.asu.edu/doi/pdf/10.1177/0278364917745980)

[Sadigh et al. "Planning for Autonomous Cars that Leverage Effects on Human Actions"](https://pdfs.semanticscholar.org/baef/0a1859fc0216c89289c69da88d6dc8399fc7.pdf)

3. Race track optimization (100%): Please see this previous
[project report](http://designinformaticslab.github.io/_teaching//designopt/projects/2015/desopt_2015_03.pdf), and
propose to improve (1) the modeling, (2) the problem formulation, (3) or the optimization algorithm based on 
the report.

### Machine learning related

1. Policy search (100%): Propose a different control problem than the pole balancing demo and solve it by designing a model-based or
model-free optimal control algorithm. You score will be based on the number of system states and 
the size of action space.

2. Adversarial attacks on sensors (100%): Based on the pole balancing controller we developed in the class,
design an attacking mechanism, that deteriorates the performance of the controller by disturbing 
the observation of the system states. Then design a defence mechanism for the attack.

* Related papers: [Athalye et al. "Synthesizing Robust Adversarial Examples"](https://arxiv.org/pdf/1707.07397.pdf)

<!--3. Desert on Mars (100%): Consider that you need to build a road on Mars from point A to B. At the moment, -->
<!--you only have a base at A with an energy recharge station. To build the road, you will need to run a vehicle from-->
 <!--A to B, and back to A. The destination B will take T days to reach from A, while the vehicle has a range of T/2. -->
 <!--Therefore, it will be necessary to set up intermediate recharging stations along the road. For example, the -->
 <!--vehicle can run for a distance of T/3 (we are equating time to distance by assuming constant speed), store T/3 -->
 <!--at that location, and return back to A for a full recharge. Question: What is the minimal total energy expense?-->
 <!---->
 
### Mechanical design

1. Bridge design (100%): Design a bridge (in 2D or 3D) that holds a certain load, and meets certain constraints on
its overall length and weight.

2. Energy-efficient powertrain control through traffic jams (100%):
Design a hybrid powertrain and its control strategy to improve the energy efficiency for heavy trucks
in traffic jams. See previous project reports for models of hybrid powertrain.


 