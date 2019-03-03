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
and plots them on a histogram using the Freedman-Diaconis rule.
Overplotted is the true distribution.
'''

#Setup initial variables from Gaussian
np.random.seed(0)
N = 10000
mu = 1
sigma = 0.2
x_gauss = norm(mu, sigma).rvs(N)

#True Gaussian distribution
xtrue_gauss = np.arange(x_gauss.min(), x_gauss.max(), 0.01)
ytrue_gauss = norm.pdf(xtrue_gauss, mu, sigma)

#Create histogram
_ = fancyhist(x_gauss, bins = "freedman", density = True, histtype = "step")
_ = plt.plot(xtrue_gauss, ytrue_gauss)
plt.legend(('True Distribution', 'Random samples'), loc = 'best')
plt.title('Histogram with Freedman-Diaconis')
plt.show()
