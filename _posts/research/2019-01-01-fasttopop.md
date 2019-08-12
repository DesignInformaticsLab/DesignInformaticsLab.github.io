---
layout: project
shorttitle:  "Responsible Machine Learning"
title:  "Responsible Machine Learning for Engineering Design through Analytical Understanding of Model Competence"
author: Ruijin Cang, Hope Yao, Dr. Houlong Zhuang
authorlink:
categories: project-current
publishdate: 2019
image: _images/machinelearning/icon.png

summaryimg: _images/machinelearning/summary.png
imgcaption: Conventional supervised learning does not derive generalizable physics knowledge to solve new engineering design problems, even when a large dataset is given. Our method is to constrain the learning through domain-specific governing equations. A verification study on topology optimization showed that our method significantly improved model generalizability from conventional learning.

abstract: "With the growing complexity of engineering systems and the emerging success of deep learning, there has been a surge of attempts at ``accelerating'' design decision making through learning techniques. At the core of these attempts is the replacement of expensive procedural models, e.g., iterative algorithms for optimization and simulation, with predictive models that learn from data and perform low-cost predictions. For risk-sensitive decision making problems, however, reliance on predictive models could be irresponsible and costly. For example, false prediction of material properties may suggest wrong directions of material discovery and waste time and resource; misjudgment of driver intent by a machine learning module on a self-driving car can kill passengers. The use of machine learning in engineering design is only responsible when the competence of the resultant predictive model can be analyzed and measured. Existing model competence measures based on the statistical learning theory falls short on engineering design tasks where physical and mathematical theories are known and should be strictly respected. To this end, this project will study novel analytical approaches to understanding the two measures of model competence: (i) the generalization performance of specific predictive models and (ii) the quantification of prediction uncertainty, by fully exploiting existing knowledge about the underlying data generation processes (e.g., topology optimization and simulations based on density functional theory)."

paper: published
paper_detail: Cang, Ruijin and Yao, Hope and Ren, Yi. (2019). One-shot generation of near-optimal topology through theory-driven machine learning. <i>Computer-Aided Design</i>.
paper_arxiv: https://arxiv.org/pdf/1807.10787.pdf
source: https://github.com/DesignInformaticsLab/Theory_Driven_TO
---