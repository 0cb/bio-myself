# % calculator
# > For use with circme

INPUT1 <- "~/Lab_Murn/circRNA/tickleF.csv"
INPUT2 <- "~/Lab_Murn/circRNA/tickleR.csv"

#data1 <- read.csv(INPUT1, header=F, sep=",")
data1 <- read.csv(INPUT2, header=F, sep=",")

lendata1 <- length(readLines(INPUT1))
lendata2 <- length(readLines(INPUT2))

cat("Number of sequences in INPUT1"); lendata1
cat("Number of sequences in INPUT2"); lendata2

fivepr1 <- data1[,5]
threpr1 <- data1[,6]

fivesub1 <- substring(fivepr1, 1, 1)
fivesub2 <- substring(fivepr1, 2, 2)
fivesub3 <- substring(fivepr1, 3, 3)
fivesub4 <- substring(fivepr1, 4, 4)
fivesub5 <- substring(fivepr1, 5, 5)
fivesub6 <- substring(fivepr1, 6, 6)

thresub1 <- substring(threpr1, 1, 1)
thresub2 <- substring(threpr1, 2, 2)
thresub3 <- substring(threpr1, 3, 3)
thresub4 <- substring(threpr1, 4, 4)
thresub5 <- substring(threpr1, 5, 5)
thresub6 <- substring(threpr1, 6, 6)

fivesub <- c(fivesub1, fivesub2, fivesub3, fivesub4, fivesub5, fivesub6)
thresub <- c(thresub1, thresub2, thresub3, thresub4, thresub5, thresub6)
nt <- c("A", "T", "G", "C")

#sapply(nt, hit, x=fivesub)
# while x is <12 do
# n+1 per loop
# counter = n+1
# increment position w/ loop
# if counter = n do
#for (n in fivesub){
#    for (i in nt){
#    hit <- function(fivesub) {
#
#        hits5 <- sum(fivesub == i)
#        prct5 <- hits5/lendata1
#        cat(i) 
#        print(hits5)
#        print(prct5)
#        cat("\n") 
#    }

#sapply(nt, hit, x=fivesub)


count <- function(x, n) { length((which(x == n))) }
perct <- function(x, n) { 100*length((which(x == n))) / length(x) }

sink("~/Lab_Murn/circRNA/holdme.txt")
cat("5prime fwd")
#cont51 <- 
    sapply(nt, count, x=fivesub1)
#prct51 <- 
    sapply(nt, perct, x=fivesub1)
#cont52 <- 
    sapply(nt, count, x=fivesub2)
#prct52 <- 
    sapply(nt, perct, x=fivesub2)
#cont53 <- 
    sapply(nt, count, x=fivesub3)
#prct53 <- 
    sapply(nt, perct, x=fivesub3)
#cont54 <- 
    sapply(nt, count, x=fivesub4)
#prct54 <- 
    sapply(nt, perct, x=fivesub4)
#cont55 <- 
    sapply(nt, count, x=fivesub5)
#prct55 <- 
    sapply(nt, perct, x=fivesub5)
#cont56 <- 
    sapply(nt, count, x=fivesub6)
#prct56 <- 
    sapply(nt, perct, x=fivesub6)


cat("3prime fwd")
#cont31 <- 
    sapply(nt, count, x=thresub1)
#prct31 <- 
    sapply(nt, perct, x=thresub1)
#cont32 <- 
    sapply(nt, count, x=thresub2)
#prct32 <- 
    sapply(nt, perct, x=thresub2)
#cont33 <- 
    sapply(nt, count, x=thresub3)
#prct33 <- 
    sapply(nt, perct, x=thresub3)
#cont34 <- 
    sapply(nt, count, x=thresub4)
#prct34 <- 
    sapply(nt, perct, x=thresub4)
#cont35 <- 
    sapply(nt, count, x=thresub5)
#prct35 <- 
    sapply(nt, perct, x=thresub5)
#cont36 <- 
    sapply(nt, count, x=thresub6)
#prct36 <- 
    sapply(nt, perct, x=thresub6)
sink()

fivesub12 <- substring(fivepr1, 1, 2)
thresub56 <- substring(threpr1, 5, 6)

holdGT <- grepl("GT", fivesub12, fixed=TRUE)
holdAG <- grepl("AG", thresub56, fixed=TRUE)

#holdGT
#holdAG

