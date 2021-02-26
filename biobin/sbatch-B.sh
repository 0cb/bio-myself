#!/bin/bash -l
## all purpose batch job submission .sh
##srun --x11 -mem=64gb --cpus-per-task 4 --ntasks 1 -time 05:00:00 --pty bash -l

#SBATCH --ntasks=1
#SBATCH --mem=24G
#SBATCH --cpus-per-task=8
#SBATCH --time=0-07:15:00
#SBATCH --output=my.stdoutB
#SBATCH --error=my.stdoutB
#SBATCH --mail-user=cbowm002@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="ChIP_peakcall-mt"
#SBATCH -p intel

date

module load R

cd ~/bigdata/chipseq

Rscript chip-peakcall-mt.R

mv my.stdout* ./logs/log-$(date +"%T")_$RANDOM.txt

