#####################################################################################################
# Literature Miner Entry Functions
# Jemma Wu jemma.wu@mq.edu.au
# Last modified 11 July 2018
# Usage: type the following commands in R console
# rm(list=ls())
# setwd("C:\\Pascal_ProteinLiteratureFinder\\GeneLiteratureMinerV.55_uniprotsyn") or 
# setwd("\\\\apaf-hpv-file\\BioInfo_Project\\Projects\\TextMining\\Pascal_ProteinLiteratureFinder\\GeneLiteratureMinerV.55_uniprotsyn")
# source('ProteinLiteratureMiner_functions.R')
# source('pubmedMiner_entry.R')
# res <- system.time(pubmedMiner_entry(query.file="potential_marker.xlsx", output.file = "potential_marker_pubmed_results.xlsx"))
#####################################################################################################

pubmedMiner_entry <- function(query.file, output.file = "pubmed_results.xlsx") {

	#library(rentrez)
	library(RISmed)
	library(wordcloud)
	library(openxlsx)
	library(cluster)
	#library(RCurl)
  library(httr)
	library(tm)
	
	dat.input = readWorkbook(query.file)
	
	list.datquery = list()
	list.datpubmed = list()
	
	for(query.idx in 1:nrow(dat.input)) {

		cat(paste('query.idx', query.idx))
	  UniProtID = dat.input[query.idx, 'UniProtID']
	  IDType = dat.input[query.idx, "IDType"]
		taxid = dat.input[query.idx, 'TaxID']
		keyword =  dat.input[query.idx, 'Keyword']
		ti.only = dat.input[query.idx,5]
		
		pd.res <- try(pubmed_miner(UniProtID, IDType, taxid, keyword, ti.only, query.idx=query.idx))
		
		if(!inherits(pd.res, 'try-error')) {
		
			list.datquery[[query.idx]] = pd.res$dat.query
			list.datpubmed[[query.idx]] = pd.res$dat.pubmed
		
		} else {
			list.datquery[[query.idx]] = data.frame('UniProtID'=UniProtID, 'GeneID' = NA, 'TaxID'=taxid, 'Synonyms' = paste(synonyms, collapse=','),
			'Keywords' = keyword, 'KeywordInTitleOnly'=ti.only, 'TotalResults'=0, 
			'Category' = 3, 'False' = 0, 'PubmedQuery'=NA)		
		
			list.datpubmed[[query.idx]] = 'No result'
			
		}
	}
	
	
	all.datquery = do.call(rbind, list.datquery)
	all.datquery$NQuery = 1:nrow(all.datquery)
	all.datquery = all.datquery[,c(ncol(all.datquery),1:(ncol(all.datquery)-1))]

	all.datquery[is.na(all.datquery)] = ''	
	# output

	wb = createWorkbook()

	addWorksheet(wb, sheetName="query")

	writeData(wb,"query", all.datquery)

	for(ii in 1:length(list.datpubmed) ) {
		
		list.datquery[[ii]][is.na(list.datquery[[ii]])] = ''
		
		addWorksheet(wb, sheetName=paste("pubmed result", ii) )
		writeData(wb, paste("pubmed result", ii), list.datquery[[ii]])
		writeData(wb, paste("pubmed result", ii), list.datpubmed[[ii]], startRow=4)
		
		if(file.exists(paste('barplotNwordcloud', ii, '.png', sep='') ) )
			insertImage(wb, paste("pubmed result", ii), paste('barplotNwordcloud', ii, '.png', sep=''), 
				width=5, height=8, startRow = 3, startCol=12)
		
		if(file.exists(paste('plot_dist_mesh', ii, '.png', sep='') ) )
			insertImage(wb, paste("pubmed result", ii), paste('plot_dist_mesh', ii, '.png', sep=''), 
				width=5, height=5, startRow = 3, startCol=20)
	}

	saveWorkbook(wb, output.file, overwrite=T)

	list(all.datquery=all.datquery, list.datpubmed=list.datpubmed, list.datquery=list.datquery)
}












