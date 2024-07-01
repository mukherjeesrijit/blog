# Concepts in Maximum Likelihood Estimation (MLE)

Maximum Likelihood Estimation (MLE) is a method used for estimating the parameters of a statistical model. It finds the parameter values that maximize the likelihood function, which measures how likely the observed data are given the model and its parameters.

## Likelihood Function

The likelihood function, denoted as $\mathcal{L}(\theta \,|\, \mathbf{x})$, represents the probability of observing the given data $\mathbf{x}$ given the parameter $\theta$ of the model. In mathematical terms, it is defined as the probability density function (PDF) or probability mass function (PMF) of the observed data, regarded as a function of the parameter $\theta$.

## Log-Likelihood Function

To simplify calculations and for numerical stability, the log-likelihood function, denoted as $\ell(\theta \,|\, \mathbf{x})$, is often used instead of the likelihood function. It is defined as the natural logarithm of the likelihood function:

$$
\ell(\theta \,|\, \mathbf{x}) = \log \mathcal{L}(\theta \,|\, \mathbf{x})
$$

## Maximum Likelihood Estimation

The goal of Maximum Likelihood Estimation is to find the parameter values $\hat{\theta}$ that maximize the likelihood function $\mathcal{L}(\theta \,|\, \mathbf{x})$ or, equivalently, the log-likelihood function $\ell(\theta \,|\, \mathbf{x})$. Mathematically, it is expressed as:

$$
\hat{\theta} = \arg\max_{\theta} \mathcal{L}(\theta \,|\, \mathbf{x}) \quad \text{or} \quad \hat{\theta} = \arg\max_{\theta} \ell(\theta \,|\, \mathbf{x})
$$

In practice, this is often done by taking derivatives of the log-likelihood function with respect to the parameters, setting them equal to zero, and solving for the parameter values.

## Example: Gaussian Distribution

Consider a simple example where we have a set of independent and identically distributed (i.i.d.) observations $\mathbf{x} = \{x_1, x_2, \ldots, x_n\}$ assumed to be drawn from a Gaussian distribution with unknown mean $\mu$ and variance $\sigma^2$. The likelihood function for this scenario is given by:

$$
\mathcal{L}(\mu, \sigma^2 \,|\, \mathbf{x}) = \prod_{i=1}^{n} \frac{1}{\sqrt{2\pi\sigma^2}} e^{-\frac{(x_i - \mu)^2}{2\sigma^2}}
$$

To find the Maximum Likelihood Estimates for $\mu$ and $\sigma^2$, we would maximize this likelihood function with respect to $\mu$ and $\sigma^2$.

## Conclusion

Maximum Likelihood Estimation is a powerful technique used in various fields such as statistics, machine learning, and econometrics for estimating parameters of statistical models. By maximizing the likelihood function, MLE provides parameter estimates that are most consistent with the observed data.
