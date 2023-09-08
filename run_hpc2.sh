#!/bin/bash
#SBATCH --job-name="run"
#SBATCH --output="run.%j.%N.out"
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=50G
#SBATCH --account=ahnlab
#SBATCH --partition=gpu-ahn
#SBATCH --no-requeue
#SBATCH --exclusive
#SBATCH --mail-user=youruserid@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -t 360:00:00

module load cuda/11.8.0
module load amber/22

export PATH=$PATH:$HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
pmemd.cuda -O -i prod.in -o prod.out -p wt_801.prmtop -c equil_02.ncrst -r prod.ncrst -x prod.nc -inf prod.inf
