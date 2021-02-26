# R function
# library(ecolitk); wstringapply()
#
# use with wstringapply(x,size,slide,fun,param)
# 
# > x = string
# > size = len(window)
# > slide = increment increase
# > fun = function to use
# > param = additional param for fun
#
# window size 12; acidic- 3(min); hydrophob- 4(min); positive- 0

library(ecolitk)
library(stringr)

args <- commandArgs(TRUE)
#FILES <- list.files("~/Lab_Murn/TAD_RBPs/RBPs", pattern="*.txt", full.names=TRUE, recursive=FALSE)

acid <- c("D", "E")
hydr <- c("F", "M", "I", "L", "V", "C", "W")
posi <- c("K", "R")

acidi <- str_count(args[1], acid)
hydro <- str_count(args[1], hydr)
posit <- str_count(args[1], posi)

candiA <- function(t) {
    acidic <- str_count(t, acid)}
candiH <- function(t) {
    hydrop <- str_count(t, hydr)}
candiP <- function(t) {
    positi <- str_count(t, posi)}


#sink("holdme.txt")
#args[1]

#cat("\nAcidic residues, D & E:"); acidi
#cat("\nHydrophobic residues, F M I L V C W:"); hydro
#cat("\nPositive residues, K & R:"); posit

colA <- wstringapply(args[1], 12, 1, candiA)
colH <- wstringapply(args[1], 12, 1, candiH)
colP <- wstringapply(args[1], 12, 1, candiP)

#sink()

sink("A.txt"); colA; sink()
sink("H.txt"); colH; sink()
sink("P.txt"); colP; sink()


#    if ((candiA >= 3) && (candiH >= 4) && (candiP = 0))
#    {print("lolwhat")}
