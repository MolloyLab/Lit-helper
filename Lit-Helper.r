rm(list=ls())
source('Lit-Helper_functions.R')
source('PubMedMiner.R')
res <- pubmedMiner_entry(query.file="Example.xlsx", 
                         output.file = "Example_result.xlsx")

