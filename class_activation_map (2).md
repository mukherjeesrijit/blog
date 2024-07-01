# Motivation

In CNN, there are two steps. The first step is feature learning, and the second step is the neural network head. Feature learning creates filters, which are then sent
through the neural network head to get the prediction. Each of the filters $F_i$ learns some of the features. How to use these features to get an activation map for the model.

# Occlusion Sensitivity

Occlusion Sensitivity essentially removes a patch of an image / replaces it with a gray image with no information, and sees the change in prediction. This is done for every part
of the image by a patch. Essentially it captures the change in the prediction $y$ with the change in the input image $x$. Mathematically, it is measuring $\frac{\Delta y}{\Delta x}$
for $(x,y)$ pixel. In other words, we are trying to mathematically estimate $\frac{\delta y}{\delta x}$.

# Linear Regression

Coming to Linear Regression, we see that for $y = w_0 + w_1 x_1 + w_2 x_2$, the $w_i$ captures the importance of the feature $x_i$. Observe that $\frac{\delta y}{\delta x_i} = w_i$

# Class Activation Map

* http://cnnlocalization.csail.mit.edu/
* https://sh-tsang.medium.com/cam-learning-deep-features-for-discriminative-localization-weakly-supervised-object-7cab7b31f972

# Grad CAM

* https://arxiv.org/pdf/1610.02391.pdf
* https://sh-tsang.medium.com/review-grad-cam-visual-explanations-from-deep-networks-via-gradient-based-localization-wsol-edab5fd4fd0a

I would add one mathematical idea not explained in the papers, that helps us generalize Grad CAM from CAM is the following:

* In CAM, we find $$w_k^c =  \frac{\partial y^c}{ \partial \frac{1}{Z} \sum_{i} \sum_{j} A_{ij}^k}$$

* in Grad CAM, we $$w_k^c = \frac{1}{Z} \sum_{i} \sum_{j} \frac{\partial y^c}{\partial A_{ij}^k}$$

# Grad CAM ++

* https://arxiv.org/abs/1710.11063
* https://medium.com/swlh/review-grad-cam-improved-visual-explanations-for-deep-convolutional-networks-weakly-760264e66bc6

# General

* https://arxiv.org/abs/2205.10838 (Grad-CAM++ is Equivalent to Grad-CAM With Positive Gradients): Clear Cut Mathematics and beautifully explained.
* https://christophm.github.io/interpretable-ml-book/pixel-attribution.html (An excellent resource to learn explainable machine learning models)
* https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8321083/ (Explainable Deep Learning Models in Medical Image Analysis): This gives a table of different approaches, with the basic methodology involved.
* a perfect paper with a theoretical approach to visualization: https://arxiv.org/abs/2008.02312 (Axiom-based Grad-CAM: Towards Accurate Visualization and Explanation of CNNs)
* Axiomatic Attribution for Deep Networks: The hypotheses for attribution/importance of a pixel are given in this paper with interesting counterexamples. https://arxiv.org/pdf/1703.01365.pdf

