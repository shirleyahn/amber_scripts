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
#SBATCH --mail-user=youremail@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -t 48:00:00

module purge
module load shared
module load gpu/0.15.4
module load slurm
module load openmpi/4.0.4
module load cuda/11.0.2
module load amber/20-patch15

export PATH=$PATH:$HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
source $AMBERHOME/amber.sh

pmemd.cuda -O -i min1.in -o min1.out -p plaat_ppe_solv.prmtop -c plaat_ppe_solv.inpcrd -r min1.rst7 -inf min1.info -x min1.nc -ref plaat_ppe_solv.inpcrd
pmemd.cuda -O -i min2.in -o min2.out -p plaat_ppe_solv.prmtop -c min1.rst7 -r min2.rst7 -inf min2.info -x min2.nc -ref plaat_ppe_solv.inpcrd
pmemd.cuda -O -i heat1.in -o heat1.out -p plaat_ppe_solv.prmtop -c min2.rst7 -r heat1.rst7 -inf heat1.info -x heat1.nc
