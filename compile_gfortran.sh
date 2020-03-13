# FFTW root
FFTW_ROOT=/space/xgc_scorec/fftw-3.3.8/install

# lib/inc
export FFTW_INC=-I$FFTW_ROOT/include
export FFTW_LIB="-L$FFTW_ROOT/lib -lfftw3"

echo $FFTW_INC
echo $FFTW_LIB

# compile
gfortran fftw_ex.f90 -O0 -g -Wall $FFTW_INC $FFTW_LIB -o fftw_test
