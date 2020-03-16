# fftw_example

- copied from: https://gist.github.com/appleparan/c048c44668ede7ef28ba63c660b6dcf3; with slight modification to work on IBM XL compiler

- Currently, the code hangs at around line 54 to 57; similar as the behavior in XGC `search.F90` subroutine, around line 2071. That is the code hangs, when creating the `FFT plan`.

- With a new build of `FFTW` without any `openmp` or `mpi` flag, the code seems to execute normally.
