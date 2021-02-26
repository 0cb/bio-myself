##################################################################
## Convert to STRUCTURE format
# wrapper for gl2structure() function of dartR pkg
##################################################################
gl2structure_localfix <- function(x)
{
  phold <- x
  
  
  #set up pop and name lines, STRUCTURE takes numeric pop-IDs
  pop_lvls <- levels(x@pop)
  Pp <- x@pop
  POP = as.numeric(factor(Pp, levels = pop_lvls))
  ind.names <- x$ind.names
  
  #set parameters to suit you, if unsure run: ?gl2structure
  gl2structure(x, indNames = ind.names, addcolumns = c(POP), ploidy = 2, 
               exportMarkerNames = TRUE, outfile="gl.str",
               outpath=".")
  
  #You'll need to know the # of Individuals and # of loci for input in STRUCTURE          
  nLoc(x);nInd(x);
  
  #when putting STRUCTURE results into CLUMPAK after STRUCTURE is complete
  #(assuming you want to) you will need to know the order of populations and
  #have it in a .txt to upload
  
  write.table(pop_lvls, file = file.path("outpath",paste0("CLUMPAK_pops",phold,".txt")), 
              append = FALSE, quote = FALSE, sep = " ",
              eol = "\n", na = "NA", dec = ".", row.names = TRUE,col.names = FALSE)  
}

