---
layout: post
title:  Report on the computational material design project
date:   2017-08-20 00:00:00
published: false
categories: news
---
**This report is incomplete**

Authors: Ruijin Cang, Hechao Li, [Yi Ren][yiren], [Yang Jiao][yangjiao], [Yongming Liu][yongming]

## The Goals
The goals of this project is to address two computational barriers in material design: 
(1) Material microstructures are usually represented as high-resolution images and 
are limited in quantity due to high acquisition costs through experiments. We develop 
generative models that learn the latent dimensions of microstructures, and create 
new microstructure samples that are statistically similar to the limited samples.
(2) The physics-based structure-property mapping often involves high cost computation, 
due to the highly-nonlinear constitutive models of material systems. We investigate
deep learning architectures to learn such nonlinear mappings.

## Results and Findings
The results and findings are summarized below.

### Generative Model for Microstrutures and Topologies
While state-of-the-art generative models has achieved photo-realistic image generation 
based on often enormous amount of training samples, it is well understood that these models 
will fail to learn meaningful local patterns (poor distribution matching) when only a small 
amount of data (in the scale of ten to a hundred) is available. The latter is usually the 
case in material design due to the high acquisition cost of microstructure samples. 
Therefore applying existing generative models to microstructures yielded generations with 
morphological difference from the samples, making these models inapplicable to material 
systems where properties are sensitive to morphological details. The PIs have partially 
addressed this challenge using a layer-by-layer learning mechanism through Restricted 
Boltzmann Machines (see **Fig 1a**), yet this model requires extensive calibration of 
the learning parameters by the designer, as it only preserves morphologies within 
the layers, and has limited control over the output morphology through the network 
(see **Fig 1b** and [the paper][jmdcang]).

To this end, we investigate solutions inspired by *style transfer* (ST), a method 
that quantifies the style of an image as the variance-covariance matrices of the 
hidden-layer activations (denoted as the *style vector*) of a convolutional neural 
network (CNN) when the image passes through it, and optimizes new images to match their 
style vectors to the target (see **Fig 2a** for ST on material images). Nonetheless, 
ST is not generative, since the generation of each new image requires an optimization 
directly in the image space, and thus does not offer spatial compression. 
The proposed model combines ST with a generative model: In each iteration of the 
training, we pass both the generated images and the samples through a pre-trained CNN 
(e.g., [VGG][vgg]) to calculate the discrepancy between their style vectors. 
This additional loss to be minimized regularizes the resultant generator to only generate 
images with styles consistent with the samples. We also found that ST has better 
performance and less memory requirement than similar losses defined on correlation 
functions. **Fig 2b** compares the performance of generative models applied to 
several material systems with and without incorporating ST, with less than 100 samples in 
each case.

The findings are summarized as follows:

* The layer-by-layer model is effective at recovering microstructure details. 
Its parameters, however, require material-dependent tuning. 
* The preliminary success with style transfer suggests that leveraging additional 
information in network training leads to better generations. This inspires the 
current investigation: Extending the idea of style transfer, we propose to 
regularize the generation through a physically meaningful loss. The loss will be calculated
by measuring how well the generated microstructure matches the equilibrium state governed
by the processing parameters.

### Structure-Property Prediction
We investigated the utility of deep neural networks when applied to predict structure-property
mappings. Two specific mappings are studied: The fracture strength of Ti64, and the 
Young's modulus of sandstone. The fracture strength is computed by an explicit solver
on a particle model of the Ti64 microstructure (see [the development of the model][Ti64model]).
The Young's modulus is computed by **Yang?**. Our findings are as follows.

In the sandstone case, we initially used 40 images for training a residual network. 
The prediction performance is shown in **Fig. 3a**. We then use the 
developed generative model to create an additional **???** sandstone samples. The enriched dataset
then leads to an improved predictive model as shown in **Fig. 3b**. It should also be 
noted that the model (a deep residual network with **???** layers) has better performance than
benchmark models (**???** and **???**) on the enriched data. To understand whether the network
learns critical structural patterns, we scan a material sample and evaluate the changes in 
Young's modulus by switching pixel values of each small patch to **white???**. We compare the
true changes and those derived from the prediction. Result shows significant matching between 
the two (**Fig. 3c**).

In the Ti64 case, we encountered difficulty in reaching plausible predictive performance 
for fracture strength, with extensive testing of network architectures. We should, however,
note that the residual network still outperforms benchmarks with 1000 microstructure samples.
See **Fig. 4a**. 

The findings are summarized as follows:

* The generative model developed through this project can be used to enrich a small material dataset
to improve the prediction performance of a resulting surrogate model.
* Deep networks achieve better performance in capturing structure-property mappings
than shallow models (e.g., **???** and **???**).
* Nonetheless, deep networks fail to predict highly-nonlinear mappings. 
This suggests that the incorporation of physics-based knowledge into the surrogate model
is necessary.

### Publications
* Cang, R., Xu, Y., Chen, S., Liu, Y., Jiao, Y., and Ren, Y. (2017). Microstructure Representation and Reconstruction of Heterogeneous Materials via Deep Belief Network for Computational Material Design. ASME Journal of Mechanical Design, 139(7), 071404.
* Cang, R., Vipradas, A., and Ren, Y. (2017). Scalable Microstructure Reconstruction with Multi-scale Pattern Preservation. In ASME 2017 International Design Engineering Technical Conferences and Computers and Information in Engineering Conference. American Society of Mechanical Engineers.
* Cang, R., and Ren, Y. (2016). Deep Network-based Feature Extraction and Reconstruction of Complex Material Microstructures. In ASME 2016 International Design Engineering Technical Conferences and Computers and Information in Engineering Conference. American Society of Mechanical Engineers.
* Chen, H., and Liu, Y. (2017). Micro/meso Scale Fracture Modeling Using A Novel Discrete Model. International Conference of Fracture, Greece, 2017.
* Xu, Y., and Jiao Y. (2017). Micro-structure and Superior Mechanical Properties of Hyperuniform Materials, 2017 TMS Annual Meeting, San Diego.

### Videos
<iframe width="420" height="315"
                src="http://www.youtube.com/embed/PQm2wSdKC2w">
</iframe>


[yiren]:
[yangjiao]:
[yongming]: 
