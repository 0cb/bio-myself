#!/usr/bin/Rscript
#===========================================================================#
#=									   =#
#   Filename:	    clinicTrain.R
#   Version:	    1.0
#=									   =#
#   Description:    analyze training data set with GEMMA
#                   - for use with Jia lab data
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-12-09 17:59
#   Updated:	    
#=									   =#
#===========================================================================#

#--------------- intro ---------------#

GEMMA=/bigdata/bin/gemma-0.98.1
DDIR=/bigdata/train

#--------------- data ---------------#

cli     <-  readRDS("clinicalDa.rds")               #raws; all types of measured variables 
trY     <-  readRDS("trainY_SNP_vs_Phenotype.rds")  #Phenotypes (Y); patient x pheno score [0-n]
trX     <-  readRDS("trainX_SNP.rds")               #Independent var (X); patient x SNP [0-2]

#--------------- pseudocode ---------------#
#commentblock
# S-v > :s/^/#/
# S-v > :s/^#// to remove

# workflow (PLINK):
#   plink > prune SNPs > merge to full gen > kinship > eigendecomp
#   PhenotypeSimulator > covariates
#   >> save c(pheno,kinship,cov) as GEMMA-spec outputs > run as chr models

# workflow (BIMBAM):
# rds > BIMBAM > SNP filtering params > BSLMM

#--------------- meat ---------------#
# this will generate the BIMBAM format required for GEMMA inputs

write.table(trY, file='YY.BIMBAM.txt', sep='', quote=FALSE, col.names=FALSE, row.names=FALSE)
write.table(trX, file='XX.BIMBAM.txt', sep='', quote=FALSE, col.names=FALSE, row.names=FALSE)





