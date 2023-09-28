import numpy as np
import matplotlib.pyplot as plt

import matplotlib.pylab as pylab
params = {'font.family': 'sans-serif',
          'font.sans-serif': 'Helvetica',
         'legend.fontsize': '36',
         'figure.figsize': (24,12),
         'axes.labelsize': '36',
         'axes.titlesize': '36',
         'xtick.labelsize': '36',
         'ytick.labelsize': '36'}
pylab.rcParams.update(params)
rbd_coma = 'rmsd.dat'

data_a = np.loadtxt(rbd_coma, skiprows=1, usecols=1)

fig = plt.figure(figsize=(24,12))
ax = fig.add_subplot(111)
xvalues = np.arange(1,2001)*0.01 #replace this with your appropriate simulation time

ax.plot(xvalues, data_a, color='mediumpurple')

ax.set_xlabel('Time (ns)', labelpad=20)
ax.set_ylabel('RMSD ($\AA$)',rotation=0, labelpad=180)

fig.savefig('rmsd.png', bbox_inches='tight')
