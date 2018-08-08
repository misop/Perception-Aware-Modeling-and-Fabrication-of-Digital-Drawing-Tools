# Welcome

This a repository containing supplementary files for our project Perception Aware Modeling and Fabrication of Digital Drawing Tools published on Siggraph 2018. More information on the project, as well as, the full paper are available on our [project webpage](http://pdf.mmci.uni-saarland.de/projects/DigitalStylus/). Detailed assembly instructions of our measurement device are available on [github page](https://misop.github.io/Perception-Aware-Modeling-and-Fabrication-of-Digital-Drawing-Tools/).

## Perceptual Model

Our correlated likelihood based optimization function is available in the perceptual model folder. The function takes as input a matrix of triplets in the format of Sample A, Reference, Sample B, Picked A, Picked B; the number of stimuli in the user study; the dimensionality of the final space; physical descriptor to correlate: should have at least D dimensions; weighting factor to enforce correlation; number of evaluations of objective function; option to provide live feedback on optimization.

## Exponential Euler Integrator

Simulates an elastic system using Exponential Euler integrator. The input is mass matrix; stiffness matrix; degrees of freedom; boundary conditions; and options for the simulation.

The simulator can use 3 kinds of forcing terms: constant, linear, and sinusoidal. Each requires a function specifying which vertices are affected. It is also possible to use an iterative computation (expmv good for soft systems), one shot version (really slow), or precomputed version (fastest for stiff systems). The precomputed version runs on GPU to accelerate the matrix multiplication.

## Friction Measurement Data

The friction measurement data of common drawing tools, commercial styli, and 3D printed tools are available in the friction measurements folder. The data were recovered using an OptoForce sensor. The file name contains the name of the tool, drawing substrate, force that was exerted by the drawing tool on the surface, and amplification factor of our measurement arm. The packaged Matlab script will process all files from a folder and extract Coulomb friction coefficients.

## Vibration Measurement Data

The vibration measurement data are available in the vibration spectrogram folder. The data are stored as raw accelerometer signals. To load them into Matlab use PreprocessData script. To generate the final spectrogram of vibratory feedback use the ProcessVibrations script.

## Average Drawing Habits of Artists

The drawing pictures folder contains pictures drawn by various artists on our measurement setup. Our setup captured the position of the tool, the orientation of the tool, and applied pressure. The position is captured in millimeters, force in newtons. For convenience, we include numerical derivatives of position: velocity and acceleration. To get true velocity in mm/s one needs to consider the refresh rate of our capturing device ~120 Hz.

## Citation
If you use any of these materials, please, reference our original paper:
```
Perception-Aware Modeling and Fabrication of Digital Drawing Tools
Michal Piovarči, David I.W. Levin, Danny Kaufman, Piotr Didyk
ACM Transactions on Graphics 37(4) (Proc. SIGGRAPH 2018, Vancouver, Canada) 
```
bibtex:
```
@article{Piovarci2018,
  author = { Michal Piovar\v{c}i and David I.W. Levin and Danny Kaufman and Piotr Didyk},
  title = {Perception-Aware Modeling and Fabrication of Digital Drawing Tools},
  journal = {ACM Transactions on Graphics (Proc. SIGGRAPH)},
  year = {2018},
  volume = {37},
  number = {4}
}
```
