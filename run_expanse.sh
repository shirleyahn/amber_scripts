#!/bin/bash
#SBATCH --job-name="run"
#SBATCH --output="run.%j.%N.out"
#SBATCH --partition=gpu-shared
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=50G
#SBATCH --account=csd743
#SBATCH --no-requeue
#SBATCH --mail-user=sahn@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -t 48:00:00

module purge
module load shared
module load gpu/0.15.4
module load slurm
module load openmpi/4.0.4
module load cuda/11.0.2
module load amber/20

export PATH=$PATH:$HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
source $AMBERHOME/amber.sh
pmemd.cuda -O -i prod.in -o prod.out -p protein.prmtop -c equil.rst -r prod.rst -x prod.nc -inf prod.mdinfo
