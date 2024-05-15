## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(refseqR)

## -----------------------------------------------------------------------------
gene_symbol <- c("LOC101512347")
transcript <- refseq_fromGene(gene_symbol, sequence = "XM", retries = 3)
protein <- refseq_fromGene(gene_symbol, sequence = "XP", retries = 3)

## -----------------------------------------------------------------------------
gene_symbol <- c("LOC105852298")
transcript <- refseq_fromGene(gene_symbol, sequence = "XM", retries = 3)
protein <- refseq_fromGene(gene_symbol, sequence = "XP", retries = 3)

## -----------------------------------------------------------------------------
id <- c("LOC101512347")
refseq_description(id)

## -----------------------------------------------------------------------------
mrna_gb <- rentrez::entrez_fetch(db= 'nuccore', id = "XM_004487701", rettype = 'gp') 
strsplit(mrna_gb, "\n")[[1]][1:30]

## ---- eval = F----------------------------------------------------------------
#  xm = c("XM_004487701", "XM_004488493", "XM_004501904")
#  feat = c("caption", "moltype", "sourcedb", "slen", "title")
#  refseq_fromXM(xm ,feat)

## -----------------------------------------------------------------------------
xm <- "XM_004487701"
refseq_XPfromXM(xm)

## -----------------------------------------------------------------------------
refseq_CDScoords(xm)
refseq_CDSseq(xm)

## -----------------------------------------------------------------------------
mrna_fasta = rentrez::entrez_fetch(db="nuccore", id=xm, rettype="fasta")
# take a look at the first 500 chars. 
cat(strwrap(substr(mrna_fasta, 1, 500)), sep="\n")

## -----------------------------------------------------------------------------
substr(toString(refseq_CDSseq(xm)), 1, 60)

## -----------------------------------------------------------------------------
id <- "XM_004487701"
refseq_description(id)

## -----------------------------------------------------------------------------
xp <- "XP_020244413"
refseq_XMfromXP(xp)

## -----------------------------------------------------------------------------
refseq_XPlength(xp, retries = 3)
refseq_mol_wt(xp)

## -----------------------------------------------------------------------------
refseq_AAseq(xp)

## -----------------------------------------------------------------------------
id <- "XP_020244413"
refseq_description(id)

