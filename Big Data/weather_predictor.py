from astroML.plotting import hist as fancyhist
from matplotlib import pyplot as plt
import numpy as np

'''
Given an initial day that's either clear or cloudy and a
probability matrix, plots the probabilities of being
clear and cloudy of N days.
'''

#Initial Variables
states = ["Cloudy", "Clear"]
transition_matrix = [[0.5, 0.5], [0.9, 0.1]]
transition_name = [["CdCd","CdCr"],["CrCr", "CrCd"]]
N = 10000
f = plt.figure(figsize = (10, 15), dpi = 75)
splot = 411

#Forecast
def forecast(N, today):
    #Setup
    cd = 0
    cr = 0
    
    #Iterate over number of days
    for i in range(N):
        #Append current values
        days.append(i)
        if i != 0:
            pclear.append(cr / (cd + cr))
        elif i == 0 and today == "Clear":
            pclear.append(1)
        elif i == 0 and today == "Cloudy":
            pclear.append(0)
            
        #Move to next day and add to count
        if today == "Cloudy":
            new = np.random.choice(transition_name[0], replace = True, p = transition_matrix[0])
            cd += 1
            
            if new == "CdCr":
                today = "Clear"
            elif new == "CdCd":
                today = "Cloudy"
        elif today == "Clear":
            new = np.random.choice(transition_name[1], replace = True, p = transition_matrix[1])
            cr += 1
            
            if new == "CrCr":
                today = "Clear"
            elif new == "CrCd":
                today = "Cloudy"
                
#Start with cloudy and clear days
for start in states:
    #Reset lists
    days = []
    pclear = []

    #Get probabilities for range of days
    forecast(N, start)
    
    #At steady state, N and N + 1 days have the same value
    print("Difference of Day N and N+1: ", abs(pclear[-2] - pclear[-1]))
    
    #Plot trace
    f.add_subplot(splot)
    _ = plt.plot(days, pclear)
    _ = plt.ylim([0.75, 0.95])
    _ = plt.title('Initial Day: {}'.format(start))
    _ = plt.xlabel('Days')
    _ = plt.ylabel('P(Clear)')

    #Plot histogram
    pclear_abi = pclear[4000:]
    f.add_subplot(splot + 1)
    _ = fancyhist(pclear, bins = "freedman", histtype = "step")
    _ = fancyhist(pclear_abi, bins = "freedman", histtype = "step")
    _ = plt.legend(['all', 'after burn in'])
    _ = plt.xlim([0.8, 0.86])
    _ = plt.xlabel('P(Clear)')
    _ = plt.ylabel('Pdf')
    
    #Go to next subplot
    splot += 2

plt.tight_layout()
f.subplots_adjust(hspace = 0.4)
plt.show()
