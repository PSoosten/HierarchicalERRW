# Hierarchical ERRW
This script samples trajectories of a reinforced hierarchical random walk. The (unnormalized) initial transition matrix can be written as

<p align="center">
<img src="https://render.githubusercontent.com/render/math?math=\large \displaystyle P = \sum_r p_r L_r,">
</p>

where <img src="https://render.githubusercontent.com/render/math?math=L_r"> is block diagonal with <img src="https://render.githubusercontent.com/render/math?math=2^r \cdot 2^r"> blocks of ones on the diagonal. To set an effective (spectral) dimension of <img src="https://render.githubusercontent.com/render/math?math=D">, one sets

<p align="center">
<img src="https://render.githubusercontent.com/render/math?math=\large \displaystyle p_r = 2^{-(1 %2B C)r}, \qquad C = 2/D.">
</p>

As the walk transitions from <img src="https://render.githubusercontent.com/render/math?math=x"> to <img src="https://render.githubusercontent.com/render/math?math=y">, we find the smallest <img src="https://render.githubusercontent.com/render/math?math=r"> such that <img src="https://render.githubusercontent.com/render/math?math=L_r"> has block containing <img src="https://render.githubusercontent.com/render/math?math=x"> and <img src="https://render.githubusercontent.com/render/math?math=y">. We then change the entries in this block from <img src="https://render.githubusercontent.com/render/math?math=1"> to <img src="https://render.githubusercontent.com/render/math?math=2^{(C- C_2)r}">. This effectively changes the "dimension of the block" to <img src="https://render.githubusercontent.com/render/math?math=D_2 = 2/C_2">.

The model should have a recurrence-transience transition when <img src="https://render.githubusercontent.com/render/math?math=C \le 1">, which corresponds to effective dimension greater than 2, but <img src="https://render.githubusercontent.com/render/math?math=C_2 \geq 1">.

As output, the script shows the random walk's trajectory, the local time spent at each site, and the running maximum of the trajectory (the "furthest" point reached by the walk).

Here are the figures produced by the default settings (in the recurrent regime):

<img src="Trajectory.png" alt="Trajectory" width="500">

<img src="LocalTimes.png" alt="Local Times" width="500">

<img src="RunningMax.png" alt="Running Maximum" width="500">
