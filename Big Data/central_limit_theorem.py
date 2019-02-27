import numpy as np
from matplotlib import pyplot as plt
from scipy import optimize
from scipy.special import gamma
from scipy.stats import cauchy, norm, chi2
from astroML.plotting import setup_text_plots
from astroML.stats import sigmaG
from astroML.plotting import hist as fancyhist
import scipy

'''
Simulates 1,000,000 N(0, 1) draws of chi^2 for N = 2 and N = 5
and overplots the theoretical pdf.
'''

#Setup initial variables
N = [2, 5]
mu = 0
sigma = 1
x_true = np.linspace(0, 20, 1000)
splot = 211

for n in N:
    #Average over 1,000,000 draws
    yy = []
    for i in np.arange(1000000):
        xx = norm.rvs(mu, sigma, n)
        yy.append(sum(xx**2))
        
    #Plot distribution and sample range
    plt.subplot(splot)
    plt.xlim([0, 20])
    plt.ylim([0, 0.5])
    _ = plt.plot(x_true, chi2.pdf(x_true, n))
    _ = plt.hist(yy, bins = 100, histtype = 'stepfilled', alpha = 0.5, density = True)
    plt.title("N = {}".format(n))
    
    #Go to next subplot
    splot += 1

plt.tight_layout()
plt.show()
