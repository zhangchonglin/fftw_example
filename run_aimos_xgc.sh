#!/bin/bash 
if [ "x$SLURM_NPROCS" = "x" ] 
then
  if [ "x$SLURM_NTASKS_PER_NODE" = "x" ] 
  then
    SLURM_NTASKS_PER_NODE=1
  fi
  SLURM_NPROCS=`expr $SLURM_JOB_NUM_NODES \* $SLURM_NTASKS_PER_NODE`
else
  if [ "x$SLURM_NTASKS_PER_NODE" = "x" ]
  then
    SLURM_NTASKS_PER_NODE=`expr $SLURM_NPROCS / $SLURM_JOB_NUM_NODES`
  fi
fi

srun hostname -s | sort -u > /tmp/hosts.$SLURM_JOB_ID
awk "{ print \$0 \"-ib slots=$SLURM_NTASKS_PER_NODE\"; }" /tmp/hosts.$SLURM_JOB_ID >/tmp/tmp.$SLURM_JOB_ID
mv /tmp/tmp.$SLURM_JOB_ID /tmp/hosts.$SLURM_JOB_ID

module use /gpfs/u/software/dcs-spack-install/v0133/lmod/linux-rhel7-ppc64le/xl/16.1.1
module load xl_r/16.1.1
module load spectrum-mpi/10.3-i3wnm5t

bin=./fftw_test

#mpirun --bind-to core -hostfile /tmp/hosts.$SLURM_JOB_ID -np $SLURM_NTASKS /bin/bash -c "ulimit -s unlimited -c unlimited; $bin;"
/bin/bash -c "ulimit -s unlimited -c unlimited; $bin;"

rm /tmp/hosts.$SLURM_JOB_ID
