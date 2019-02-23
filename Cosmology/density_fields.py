#Imports
import numpy as np
from math import *
import matplotlib.pyplot as plt
from scipy.integrate import quad
from scipy import optimize
from random import *
import sys, os

#-------------------Q5-------------------#
#--------A--------#
#Initial Variables
filename = 'delta_model3.txt'
x = np.loadtxt(filename, usecols = [0])
y = np.loadtxt(filename, usecols = [1])
delta = np.loadtxt(filename, usecols = [2])

#Plot
plt.scatter(x, y, c = delta)
plt.xlabel('x')
plt.ylabel('y')
plt.title('Density Field')
plt.gray()
plt.show()

#--------B--------#
#Initial Variables
seed()
iters = 100
R_arr = np.array([])
rms_arr = np.array([])

## Create super grid such that if circle is on border
## it effectively "loops" back to the other side
#top right
new_x = np.append(x, x + max(x))
new_y = np.append(y, y + max(y))
new_delta = np.append(delta, delta)

#mid right
new_x = np.append(new_x, x + max(x))
new_y = np.append(new_y, y)
new_delta = np.append(new_delta, delta)

#bot right
new_x = np.append(new_x, x + max(x))
new_y = np.append(new_y, -y)
new_delta = np.append(new_delta, delta)

#bot center
new_x = np.append(new_x, x)
new_y = np.append(new_y, -y)
new_delta = np.append(new_delta, delta)

#bot left
new_x = np.append(new_x, -x)
new_y = np.append(new_y, -y)
new_delta = np.append(new_delta, delta)

#mid left
new_x = np.append(new_x, -x)
new_y = np.append(new_y, y)
new_delta = np.append(new_delta, delta)

#top left
new_x = np.append(new_x, -x)
new_y = np.append(new_y, y + max(y))
new_delta = np.append(new_delta, delta)

#top center
new_x = np.append(new_x, x)
new_y = np.append(new_y, y + max(y))
new_delta = np.append(new_delta, delta)

#Loop over different radius circles
for R in range(1, 17): 
    delta_rms = np.array([])
    for i in range(iters):
        #Choose random point for circle
        x_cent = randrange(0, max(x) + 1)
        y_cent = randrange(0, max(y) + 1)

        #Get deltas of points inside circle
        mask = (new_x - x_cent)**2 + (new_y - y_cent)**2 <= R**2
        delta_rms = np.append(delta_rms, sum(new_delta[mask]))
        
    #Calculate delta_rms and sigma_r
    mu1 = np.mean(delta_rms**2)
    rms_arr = np.append(rms_arr, np.sqrt(mu1) / (pi * R**2))
    R_arr = np.append(R_arr, R)

#Plot
plt.plot(R_arr, rms_arr)
plt.xlabel('R($h^{-1}$ Mpc)')
plt.ylabel('$\sigma_{R}$')
plt.show()

#--------C--------#
#Initial Variables
N = 1000
kmax = int(N / 20)
pk = np.zeros(kmax - 1)
kval = np.arange(kmax - 1) + 1

#Iterate Over All k Values
for k in range(kmax):
    #Calculate Delta_K
    sink = np.sin(k * x * 2 * pi / N)
    cosk = np.cos(k * x * 2 * pi / N)
    ak = sum(sink * delta) / N
    bk = sum(cosk * delta) / N

    if k > 0:
        ak = 2 * ak
        bk = 2 * bk

    #Calculate Power Spectrum
    if k > 0:
        pk[k - 1] = ak * ak + bk * bk

#Plot
plt.loglog(kval, pk)
plt.xlabel('k')
plt.ylabel('P(k)')
plt.show()

