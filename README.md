# Lit-helper
Lit-helper is a new R-script that aims to help researchers reduce time spend on literature research post-analysis and streamline the decision about which proteins or genes are the most interesting and most promising for follow-up experiments.

# Getting started
download the Lit-helper_function.R, pubmed_Miner.R and the Query.R from the respository. Make sure R as well as RTools is installed on your PC. It might also be helpful to have a development invironment (i.e RStudio) installed for easier use of R. Install the following packages in R:
1.	rentrez
2.	RISmed
3.	wordcloud
4.	openxlsx
5.	cluster
6.	RCurl
7.	tm

# Using the Lit-Helper
An example input file is provied (example.xlsx). Download the example file and save it in the same folder as the three .R files. Open the Query.R file using RStudio. Set the working directory to where you saved all .R files as well as the example.xlsx file. In RStudio change the fourth line (input.file) to 'example.xlsx' and the output.file to 'example_results.xlsx'. Highlight all 4 lines of code in the Query.R script and click run. The script should now generate several plots in your working directory and the example_result.xlsx file when it is done. At this point you can delete the plots in the folder (they are automatically inportet into the result file). The result file containes a summary page as well as a detailed page for each protein/gene entry of your input file.
