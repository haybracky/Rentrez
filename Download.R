# BIOL432 Assingment 3
## Hayley Brackenridge
### Jan. 23, 2019

# This script includes part one of assingment 3 which involves using the package rentrez 

# install package rentrez
install.packages("rentrez")
# load rentrez
library(rentrez)

# make a vector containing NCBI accession numbers for the 16S gene of Borrelia
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
# download NCBI fasta file containing gene sequences of the above accession numbers
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
paste(Bburg)

# create a vector of 3 components, one for each seq
splitB<- strsplit(Bburg, "\n\n")[[1]] # split sequences
print(splitB)
Sequence<- gsub(".*sequence|\n", "", splitB) # remove jargon
print(Sequence)

# set vector into data frame
SeqDat<- as.data.frame(Sequence, row.names=ncbi_ids) 

# output data frame as csv
write.csv(SeqDat, file="Sequences.csv")
