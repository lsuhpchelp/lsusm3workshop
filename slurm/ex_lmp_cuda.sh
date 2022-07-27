#!/bin/bash
#SBATCH --job-name=lmp_gpu           # Job name
#SBATCH --partition=gpu              # Need to submit workq for multiple node jobs
#SBATCH --nodes=1                    # Maximum number of nodes to be allocated
#SBATCH --ntasks=64                  # Number of MPI tasks (i.e. processes)
#SBATCH --cpus-per-task=1            # Number of cores per MPI task 
#SBATCH --time=00:05:00              # Wall time limit (hh:mm:ss)
#SBATCH --output=%x_%j.log           # Standard output and error file 

echo "Date              = $(date)"
echo "Hostname          = $(hostname -s)"
echo "Working Directory = $(pwd)"
echo ""
echo "Number of Nodes Allocated      = $SLURM_JOB_NUM_NODES"
echo "Slurm Nodes Allocated          = $SLURM_JOB_NODELIST"
echo "Number of Tasks Allocated      = $SLURM_NTASKS"
echo "Number of Cores/Task Allocated = $SLURM_CPUS_PER_TASK"

module load lammps/23Jun2022/intel-2021.5.0-cuda-11.6.0-intel-mpi-2021.5.1

srun -n 32 $(which lmp_cuda) -sf gpu -pk gpu 2 -in in.lmp.lj

