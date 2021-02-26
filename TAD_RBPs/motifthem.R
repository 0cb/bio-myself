#
#
#

args        = commandArgs(TRUE)
data.arg    = read.table(args[1], header=F, sep=" ")
data.arg    = as.matrix(data.arg)
 
#pass <- function(x){

    D   = data.arg[,1]
    E   = data.arg[,2]

    F   = data.arg[,3]
    M   = data.arg[,4]
    I   = data.arg[,5]
    L   = data.arg[,6]
    V   = data.arg[,7]
    C   = data.arg[,8]
    W   = data.arg[,9]
    hy  = c(F,M,L,V,C,W)
    
    K   = data.arg[,10]
    R   = data.arg[,11]

    
pass <- function(i){

    if (i[1] > 2 | i[2] > 2){cat("dog")

}

apply(c(D, E), 1, pass)
