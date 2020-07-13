# Hierarchical ERRW
This script samples trajectories of a reinforced hierarchical random walk. The (unnormalized) initial transition matrix can be written as

P = sum_r p_r L_r

where L_r is block diagonal with 2^r * 2^r blocks of 1s on the diagonal. To set an effective (spectral) dimension of D, one sets
p_r = 2^(-(1+C)),  C = 2/D.

As the walk transitions from x to y, we find the smallest r such that L_r has block containing x and y. We then change the entries in this block from 1 to 2^(C- C_2). This effectively changes the "dimension of the block" to D_2 = 2/C_2.

The model should have a recurrence-transience transition when C < 1, which corresponds to effective dimension > 2, but C_2 > 1.

As output, the script shows the random walk's trajectory, the local time spent at each site, and the running maximum of the trajectory (the "furthest" point reached by the walk).

Here are the figures produced by the default settings (in the recurrent regime):

<img src="Trajectory.png" alt="Trajectory" width="500">

<img src="LocalTimes.png" alt="Local Times" width="500">

<img src="RunningMax.png" alt="Running Maximum" width="500">
