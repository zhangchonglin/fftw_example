# FFTW root
FFTW_ROOT=/gpfs/u/home/MPFS/MPFScgzg/barn/xgc/fftw-3.3.8/install
#FFTW_ROOT=/gpfs/u/software/dcs-spack-install/v0133/linux-rhel7-power9le/xl-16.1.1/fftw-3.3.8-xtlviu34itrln5qqclhlinyvulecdufo


# lib/inc
export FFTW_INC=-I$FFTW_ROOT/include
export FFTW_LIB="-L$FFTW_ROOT/lib -lfftw3"

echo $FFTW_INC
echo $FFTW_LIB

# compile
xlf_r fftw_ex.f90 -O0 -g $FFTW_INC $FFTW_LIB -o fftw_test
