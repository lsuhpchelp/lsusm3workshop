#!/bin/bash
#SBATCH --job-name=lmp_hybrid        # Job name
#SBATCH --partition=workq            # Need to submit workq for multiple node jobs
#SBATCH --nodes=2                    # Maximum number of nodes to be allocated
#SBATCH --ntasks=4                   # Number of MPI tasks (i.e. processes)
#SBATCH --cpus-per-task=32           # Number of cores per MPI task 
#SBATCH --time=00:05:00              # Wall time limit (hh:mm:ss)
#SBATCH --output=%x_%j.log  # Standard output and error file 

echo "Date              = $(date)"
echo "Hostname          = $(hostname -s)"
echo "Working Directory = $(pwd)"
echo ""
echo "Number of Nodes Allocated      = $SLURM_JOB_NUM_NODES"
echo "Slurm Nodes Allocated          = $SLURM_JOB_NODELIST"
echo "Number of Tasks Allocated      = $SLURM_NTASKS"
echo "Number of Cores/Task Allocated = $SLURM_CPUS_PER_TASK"

module load lammps/23Jun2022/intel-2021.5.0-intel-mpi-2021.5.1

srun -n $SLURM_NTASKS -c $SLURM_CPUS_PER_TASK $(which lmp) -in in.lmp.lj -pk omp $SLURM_CPUS_PER_TASK -sf omp

