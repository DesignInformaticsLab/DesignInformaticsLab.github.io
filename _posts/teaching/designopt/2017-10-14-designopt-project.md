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

### Research topics
1. Soft gripper defect design (100%): Switchable adhesive materials have been developed as
   soft grippers for lifting flat surfaces (such as microchips, glasses, solar panels, and
   other products) of significantly larger dimensions with high energy efficiency, and have
   potential in lowering manufacturing costs.

   Importantly, the magnitude of the adhesive
   force (i.e., the maximal pulling force) is tunable via external stimuli. For example,
   when a voltage is applied, the percolating conductive propylene-based elastomer (cPBE)
   phase carrying a current becomes softened due to joule heating, which leads to
   re-distribution of stress concentration on the contact surface and thus, a decreased
   maximal pulling force. An ideal gripper should possess a large pulling force without the stimuli
   (to be able to pull up heavy objects) and a small pulling force with the stimuli
   (to be able to drop light objects).

   These pulling forces are influenced by both the material properties and defect patterns on
   the interface. This project investigates the topological design of the interface defects
   that governs the propagation of cracks under pulling, thus achieving high maximal pulling
   force. Please see initial model development
   [here](http://designinformaticslab.github.io/_teaching/designopt/projects/DefectTopology.pdf)
   and the code repo [here](https://github.com/DesignInformaticsLab/fracture_network/tree/master).

   **Requirement**: Students with a background in Python programming is preferred.

   **What do you learn**: TensorFlow, Design sensitivity analysis

2. Social grace in self-driving (100%): Self-driving cars are conservative
   in the way they drive. However, it is not clear whether their conservative behaviors
   are always seen as socially graceful. Let's look at a specific counter-example: When being the leading car waiting for a left turn, the self-driving car may not understand the tacit
   rule that it should move itself forward a bit so that cars behind it can have a better
   chance to get through during their turn. Further, the self-driving car will not understand
   why cars behind it would honk when it does not move forward.

   This project seeks answers to the following questions:

   * What is the formalism of motion planning to reproduce human-like behavior (moving forward
   a little bit in this case) when the self-driving car understands the intent of
   the car behind it?

   * What is the formalism of learning to enable recognition of others' intents when
   the self-driving car receives a honk?

   Related papers:

   * [Englert et al. "Inverse KKT: Learning cost functions
   of manipulation tasks from demonstrations"](http://journals.sagepub.com.ezproxy1.lib.asu.edu/doi/pdf/10.1177/0278364917745980)

   * [Sadigh et al. "Planning for Autonomous Cars that Leverage Effects on Human Actions"](https://pdfs.semanticscholar.org/baef/0a1859fc0216c89289c69da88d6dc8399fc7.pdf)

   **Requirement**: Students with a background in Python programming is preferred.

   **What do you learn**: Game theory, Model predictive control

3. Real-time learning of material constitutive models during experiments (100%): The goal of this project
   is to investigate the use of GPU and convolutional neural networks in accelerating the
   process of parameter estimation for a material sample under loading. More details will be updated.

   **Requirement**: Students with a background in Python programming is preferred.

   **What do you learn**: GPU acceleration, TensorFlow

4. Understanding Power Loss Due to Mechanical Antagonism (100%): Comparatively slow growth
   in power storage and generation makes power-efficient designs desirable for legged robot
   systems. One important cause of power losses in robotic systems is the mechanical
   antagonism phenomenon, i.e. one or more motors being used as brakes while the others
   exert positive energy. This project aims to develop a rigorous understanding of
   mechanical antagonism in multiactuator robotic limbs, and investigate the problem of
   minimizing mechanical antagonism in redundant manipulators.

   This project will be based on a previous paper that my student wrote. The aim is to
   improve the paper and prepare a draft for the ASME Journal of Mechanisms and Robotics.

   **Requirement**: Background in robotics.


### Autonomous driving

1. Share ride (100%): Consider a city as a graph with finite number of nodes and edges. Each request is represented by
two different nodes for which a path between the two exists, one for pickup and the other for destination. 
Let a finite number of cars be at a subset of nodes. What is the best routing strategy to minimize the overall 
 distance to cover by these cars while meeting all requests?

* Related papers: [Alonso-Mora et al. "On-demand high-capacity ride-sharing via dynamic trip-vehicle assignment"](http://www.pnas.org/content/early/2017/01/01/1611675114.full).

2. Race track optimization (100%): Please see this previous
[project report](http://designinformaticslab.github.io/_teaching/designopt/projects/2015/desopt_2015_03.pdf), and
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


 