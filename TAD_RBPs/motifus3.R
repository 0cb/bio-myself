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
    Y   <- data.arg[i,10]
    sHy <- F+M+I+L+V+C+W 

    K   <- data.arg[i,11]
    R   <- data.arg[i,12]
    H   <- data.arg[i,13]
    sPo <- K+R 

    aa  <- data.arg[i,1:13]

    if (sAc > 5){
        if (F > 0){
            if (W > 0 | Y > 0){
                if (sHy > 3){
                    if (I > 0 | L > 0){
                        if (C < 1){
                            if (H < 2){
                                if (sPo < 1){
                                    print(paste(c(i,aa,"true"), collapse=" "))
                                } else {
                                    print(paste(c(i,aa,"false"), collapse=" "))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
