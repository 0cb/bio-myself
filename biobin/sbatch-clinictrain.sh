#!/bin/bash -l
## all purpose batch job submission .sh
##srun --x11 --mem=64gb --cpus-per-task 4 --ntasks 1 --time 05:00:00 --pty bash -l

##--------------------------------------------
##--------------- batch params ---------------#
#SBATCH --nodes=1
##SBATCH --ntasks=1
#SBATCH --ntasks=16
##SBATCH --mem=32G
#SBATCH --mem-per-cpu=2G
##SBATCH --cpus-per-task=8
#SBATCH --time=0-30:15:00
#SBATCH --output=./logs/cli-train.stdout
#SBATCH --error=my.stdoutA
#SBATCH --mail-user=cbowm002@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="GEMMA_clinicData"
#SBATCH -p intel
##--------------------------------------------

#--------------- intro ---------------#
date
module load R

DATADIR=$HOME/bigdata/train
BIN=$HOME/bigdata/bin
GEMMA=$BIN/gemma-0.98.1
OUT=$HOME/bigdata/train/output

#--------------- code ---------------#
cd $DATADIR
#Rscript $BIN/clinicTrain.R

#run bslmm
echo 'Running BSLMM'
$GEMMA -g XX.BIMBAM.txt -p YY.BIMBAM.txt -bslmm 1 -n 1 -notsnp -o clinic.TRAIN
#run pheno prediction
echo 'Running phenotype prediction'
$GEMMA -g XX.BIMBAM.txt -p YY.BIMBAM.txt -epm ${OUT}/clinc.TRAIN.param.txt -emu ${OUT}/clinic.TRAIN.log.txt -predict 1 -n 1 -notsnp -o 0.TRAIN

#--------------- logging ---------------#
#mv my.stdoutA ./logs
#mv ./logs/my.stdoutA ./logs/my.stdout_$(date +"%T")_$RANDOM.txt
mv ./logs/cli-train.stdout ./logs/cli-train_$(date +"%T")_$RANDOM.stdout

