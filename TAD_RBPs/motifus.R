#
#
#

args        <- commandArgs(TRUE)
data.arg    <- read.table(args[1], header=F, sep=" ")
#data.arg    <- data.frame(data.arg)

for (i in 1:nrow(data.arg)){
    
    D   <- data.arg[i,1]
    E   <- data.arg[i,2]
    sAc <- D+E

    F   <- data.arg[i,3]
    M   <- data.arg[i,4]
    I   <- data.arg[i,5]
    L   <- data.arg[i,6]
    V   <- data.arg[i,7]
    C   <- data.arg[i,8]
    W   <- data.arg[i,9]
    sHy <- F+M+I+L+V+C+W 

    K   <- data.arg[i,10]
    R   <- data.arg[i,11]
    sPo <- K+R 

    aa  <- data.arg[i,1:11]

    if (sAc > 3){
        if (sHy > 3){
            if (sPo < 1){
                print(paste(c(i,aa,"true"), collapse=" "))
            } else {
                print(paste(c(i,aa,"false"), collapse=" "))
            }
        }
    }

}
