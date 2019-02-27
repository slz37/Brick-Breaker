import numpy as np
from matplotlib import pyplot as plt
from scipy import optimize
from scipy.special import gamma
from scipy.stats import cauchy, norm, chi2
from astroML.plotting import setup_text_plots
from astroML.stats import sigmaG
from astroML.plotting import hist as fancyhist

'''
Generates a random sample of 10,000 values from N(mu = 1, sigma = 0.2)
and concatenates them with 10,000 values from Cauchy(mu = 2, gamma = 0.5)
and plots two histograms using Freedman-Diaconis and Scott's rule.
'''

#Setup initial variables from Gaussian
np.random.seed(0)
N = 10000
mu_g = 1
sigma_g = 0.2
x_gauss = norm(mu_g, sigma_g).rvs(N)

#Setup initial variables from Cauchy
mu = 2
gamma = 0.5
x_cauchy = cauchy(mu, gamma).rvs(N)

#Combine with Gaussian from Q2
x_tot = np.concatenate([x_gauss, x_cauchy])

#True Distribution
x_true = np.arange(x_tot.min(), x_tot.max(), 0.01)
y_gauss = norm.pdf(x_true, mu_g, sigma_g)
y_cauchy = cauchy.pdf(x_true, mu, gamma)
y_true = (y_gauss + y_cauchy) / 2

#Create histograms
plt.subplot(211)
plt.xlim([-1, 5])
plt.title("Freedman-Diaconis")
_ = fancyhist(x_tot, bins = "freedman", density = True, histtype = "step")
plt.plot(x_true, y_true)
plt.legend(('Random samples', 'True Distribution'), loc = 'best')
plt.subplot(212)
plt.xlim([-10, 10])
plt.title("Scott's Rule")
_ = fancyhist(x_tot, bins = "scott", density = True, histtype = "step")
plt.plot(x_true, y_true)
plt.legend(('Random samples', 'True Distribution'), loc = 'best')
plt.tight_layout()
plt.show()
