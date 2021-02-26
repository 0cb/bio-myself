#!/bin/bash -l
## all purpose batch job submission .sh
##srun --x11 -mem=64gb --cpus-per-task 4 --ntasks 1 -time 05:00:00 --pty bash -l

#SBATCH --ntasks=1
#SBATCH --mem=32G
#SBATCH --cpus-per-task=8
#SBATCH --time=0-07:15:00
#SBATCH --output=my.stdoutA
#SBATCH --error=my.stdoutA
#SBATCH --mail-user=cbowm002@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="ChIP_TEST-countbat"
#SBATCH -p intel

date

module load R

cd ~/bigdata/chipseq

Rscript chip-countbat.R

mv my.stdout* ~/bigdata/chipseq/logs/log-$(date +"%T")_$RANDOM.txt

