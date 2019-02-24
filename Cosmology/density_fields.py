#Imports
import numpy as np
from math import *
import matplotlib.pyplot as plt
from scipy.integrate import quad
from scipy import optimize
from random import *
import sys, os
import shutil
import imageio
import glob

#Save images - WARNING: TAKES A LONG TIME
def save_img(R, i, x_cent, y_cent):
    #Create tmp dir
    if os.path.exists('./tmp'):
        pass
    else:
        os.mkdir('./tmp')

    #Plot
    fig, ax = plt.subplots()
    circle = plt.Circle((x_cent, y_cent), R, color = 'b', label = 'Sample Area')
    square = plt.Rectangle((0, 0), 255, 255, color = 'r', fill = False, label = 'Universe Edges')
    plt.scatter(new_x, new_y, c = new_delta, label = '_nolegend_')
    plt.set_cmap('pink')
    ax.add_artist(circle)
    ax.add_artist(square)
    plt.xlabel('x')
    plt.ylabel('y')
    plt.legend(handles = [circle, square], bbox_to_anchor = (1.12, 1.15))
    plt.title('Density Field')
    plt.savefig('./tmp/{}_{}.png'.format(R, i))
    plt.close()

#Create gif of circles
def save_gif(R, delmodel):
    #Get array of images
    filenames = []
    for file in glob.glob('./tmp/*'):
        filenames.append(file)

    #Load images
    images = []
    for file in filenames:
        images.append(imageio.imread(file))

    #Create gif
    imageio.mimsave('R_{}_delta_{}.gif'.format(R, delmodel), images, duration = 1)

    #Remove tmp directory
    shutil.rmtree('./tmp')

#-------------------Q5-------------------#
#--------A--------#
#Initial Variables
filename = 'delta1.txt'
x = np.loadtxt(filename, usecols = [0])
y = np.loadtxt(filename, usecols = [1])
delta = np.loadtxt(filename, usecols = [2])
save = True
delmodel = filename[-5]

#Plot
plt.scatter(x, y, c = delta)
plt.set_cmap('pink')
plt.xlabel('x')
plt.ylabel('y')
plt.title('Density Field')
plt.show()

#--------B--------#
#Initial Variables
seed()
iters = 100
R_arr = np.array([])
rms_arr = np.array([])

## Create super grid such that if circle is on border
## it effectively "loops" back to the other side
## Probably a better way to do this, but I'm leaving
## this as it is for now.
#mid right
arr_x = np.array(x + max(x) + 1)
mask = (arr_x <= 275)

new_x = np.append(x, (x + max(x) + 1)[mask])
new_y = np.append(y, y[mask])
new_delta = np.append(delta, delta[mask])

#bot center
arr_y = np.array(y - max(y) - 1)
mask = (arr_y >= -20)

new_x = np.append(new_x, x[mask])
new_y = np.append(new_y, (y - max(y) - 1)[mask])
new_delta = np.append(new_delta, delta[mask])

#mid left
arr_x = np.array(x - max(x) - 1)
mask = (arr_x >= -20)

new_x = np.append(new_x, (x - max(x) - 1)[mask])
new_y = np.append(new_y, y[mask])
new_delta = np.append(new_delta, delta[mask])

#top center
arr_y = np.array(y + max(y) + 1)
mask = (arr_y <= 275)

new_x = np.append(new_x, x[mask])
new_y = np.append(new_y, (y + max(y) + 1)[mask])
new_delta = np.append(new_delta, delta[mask])

#top right
arr_x = np.array(x + max(x) + 1)
arr_y = np.array(y + max(y) + 1)
mask = (arr_x <= 275) & (arr_y <= 275)

new_x = np.append(new_x, (x + max(x) + 1)[mask])
new_y = np.append(new_y, (y + max(y) + 1)[mask])
new_delta = np.append(new_delta, delta[mask])

#bot right
arr_x = np.array(x + max(x) + 1)
arr_y = np.array(y - max(y) - 1)
mask = (arr_x <= 275) & (arr_y >= -20)

new_x = np.append(new_x, (x + max(x) + 1)[mask])
new_y = np.append(new_y, (y - max(y) - 1)[mask])
new_delta = np.append(new_delta, delta[mask])

#top left
arr_x = np.array(x - max(x) - 1)
arr_y = np.array(y + max(y) + 1)
mask = (arr_x >= -20) & (arr_y <= 275)

new_x = np.append(new_x, (x - max(x) - 1)[mask])
new_y = np.append(new_y, (y + max(y) + 1)[mask])
new_delta = np.append(new_delta, delta[mask])

#bot left
arr_x = np.array(x - max(x) -1)
arr_y = np.array(y - max(y) - 1)
mask = (arr_x >= -20) & (arr_y >= -20)

new_x = np.append(new_x, (x - max(x) - 1)[mask])
new_y = np.append(new_y, (y - max(y) - 1)[mask])
new_delta = np.append(new_delta, delta[mask])

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

        #Create images
        if save:
            save_img(R, i, x_cent, y_cent)
        
    #Calculate delta_rms and sigma_r
    mu1 = np.mean(delta_rms**2)
    rms_arr = np.append(rms_arr, np.sqrt(mu1) / (pi * R**2))
    R_arr = np.append(R_arr, R)

    #Save gif
    if save:
        save_gif(R, delmodel)

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
