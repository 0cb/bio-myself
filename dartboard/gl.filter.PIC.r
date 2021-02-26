gl.filter.PIC <- function (x, threshold = 0.4, verbose = NULL) 
{
  funname <- match.call()[[1]]
  build <- "Jacob"
  hold <- x
  if (is.null(verbose)) {
    if (!is.null(x@other$verbose)) {
      verbose <- x@other$verbose
    }
    else {
      verbose <- 2
    }
  }
  if (verbose < 0 | verbose > 5) {
    cat(paste("  Warning: Parameter 'verbose' must be an integer between 0 [silent] and 5 [full report], set to 2\n"))
    verbose <- 2
  }
  if (verbose >= 1) {
    if (verbose == 5) {
      cat("Starting", funname, "[ Build =", build, "]\n")
    }
    else {
      cat("Starting", funname, "\n")
    }
  }
  if (class(x) != "genlight") {
    cat("  Fatal Error: genlight object required!\n")
    stop("Execution terminated\n")
  }
  if (verbose >= 2) {
    if (all(x@ploidy == 1)) {
      cat("  Processing Presence/Absence (SilicoDArT) data\n")
    }
    else if (all(x@ploidy == 2)) {
      cat("  Processing a SNP dataset\n")
    }
    else {
      stop("Fatal Error: Ploidy must be universally 1 (fragment P/A data) or 2 (SNP data)")
    }
  }
  if (threshold < 0 | threshold > 0.5) {
    cat("Warning: Threshold value for polymorphic information content must be between 0 and 0.5, set to 0.4\n")
    threshold <- 0.4
  }
  if (all(x@ploidy == 1)) {
    if (is.null(x@other$loc.metrics$Reproducibility)) {
      stop("Fatal Error: Dataset does not include Reproducibility among the locus metrics, cannot be calculated!")
    }
  }
  if (all(x@ploidy == 2)) {
    if (is.null(x@other$loc.metrics$RepAvg)) {
      stop("Fatal Error: Dataset does not include RepAvg among the locus metrics, cannot be calculated!")
    }
  }
  hold <- x
  na.counter <- 0
  loc.list <- array(NA, nLoc(x))
  if (verbose >= 2) {
    cat("  Identifying loci with PIC below :", 
        threshold, "\n")
  }
  if (all(x@ploidy == 1)) {
    repeatability <- x@other$loc.metrics$PIC
    for (i in 1:nLoc(x)) {
      if (repeatability[i] < threshold) {
        loc.list[i] <- locNames(x)[i]
      }
    }
  }
  if (all(x@ploidy == 2)) {
    repeatability <- x@other$loc.metrics$PIC
    for (i in 1:nLoc(x)) {
      if (repeatability[i] < threshold) {
        loc.list[i] <- locNames(x)[i]
      }
    }
  }
  loc.list <- loc.list[!is.na(loc.list)]
  if (length(loc.list) > 0) {
    if (verbose >= 2) {
      cat("  Removing loci with PIC less than", 
          threshold, "\n")
    }
    x <- gl.drop.loc(x, loc.list = loc.list, verbose = 0)
  }
  else {
    if (verbose >= 2) {
      cat("  No loci with PIC less than", threshold, 
          "\n")
    }
  }
  if (verbose >= 3) {
    cat("\n  Summary of filtered dataset\n")
    cat(paste("  Retaining loci with polymorphic information content >=", 
              threshold, "\n"))
    cat(paste("  Original no. of loci:", nLoc(hold), "\n"))
    cat(paste("  No. of loci discarded:", nLoc(hold) - nLoc(x), 
              "\n"))
    cat(paste("  No. of loci retained:", nLoc(x), "\n"))
    cat(paste("  No. of individuals:", nInd(x), "\n"))
    cat(paste("  No. of populations: ", nPop(x), "\n\n"))
  }
  nh <- length(x@other$history)
  x@other$history[[nh + 1]] <- match.call()
  if (verbose >= 1) {
    cat("Completed:", funname, "\n")
  }
  return(x)
}
