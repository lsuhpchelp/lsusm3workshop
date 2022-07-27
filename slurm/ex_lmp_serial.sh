#!/bin/bash
#SBATCH --job-name=lmp_serial      # Job name
#SBATCH -p single                  # For jobs using more than 1 node, submit to workq
#SBATCH --nodes=1                  # Number of nodes to be allocated
#SBATCH --ntasks=32                 # Number of MPI tasks (i.e. processes/cores)
#SBATCH --time=00:30:00            # Wall time limit (hh:mm:ss)
#SBATCH --output=%x-%j.log         # Standard output and error 

echo "Date              = $(date)"
echo "Hostname          = $(hostname -s)"
echo "Working Directory = $(pwd)"
echo ""
echo "Slurm Nodes Allocated          = $SLURM_JOB_NODELIST"
echo "Number of Nodes Allocated      = $SLURM_JOB_NUM_NODES"
echo "Number of Tasks Allocated      = $SLURM_NTASKS"

module load lammps/23Jun2022/intel-2021.5.0-intel-mpi-2021.5.1

/usr/bin/time $(which lmp_serial) -in in.lmp.lj 

