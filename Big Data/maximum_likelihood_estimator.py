import numpy as np
from matplotlib import pyplot as plt
from scipy.stats import norm
np.random.seed(42)

'''
Plots the maximum likelihood estimator for a gaussian distribution
for N = 3 and N = 10. Then plots another MLE for N = 10; however,
the range of valid solutions is constrained to mu > 1.1
'''

#Initial Variables
n = [3, 10, 10]
mu = 1.0
sigma = 0.2 
muGrid = np.linspace(0, 2, 1000)
splot = 311
f = plt.figure(figsize = (10, 6))

for j, N in enumerate(n):
    #Setup for each n
    if j < 2:
        sample = norm(mu, sigma).rvs(N)
    L = 1
    List_L = []
    temp = []

    #Multiply all L's
    for i in range(N):
        temp = norm.pdf(muGrid, loc = sample[i], scale = sigma)
        
        #Mask on the last one
        if j == 2:
            mask = muGrid <= 1.1
            temp[mask] = 0
        
        List_L.append(temp)
        L *= temp

    #Print solution
    indices = np.argsort(L)
    index_max = indices[-1]
    print("Likelihood is maximized at %.3f for N={}".format(N) % muGrid[index_max])    
    
    #Plot
    f.add_subplot(splot)
    for i in range(N):
        plt.plot(muGrid, List_L[i], ls='-', label=r'$L(x_{})$'.format(i + 1))
    plt.plot(muGrid, L / (N - 2), ls='-', label=r'$L({x})$')
    _ = plt.xlim([0.6, 1.6])
    _ = plt.ylim([0, 8])
    _ = plt.xlabel('$\mu$')
    _ = plt.ylabel(r'$p(x_i|\mu,\sigma)$')
    _ = plt.title('MLE for Gaussian Distribution')
    _ = plt.legend(ncol = 2, bbox_to_anchor=(1.05, 0.1))
    
    #Next subplot
    splot += 1

plt.tight_layout(rect = [0, 0, 1, 1])
f.subplots_adjust(hspace = 0.5)
plt.show()
