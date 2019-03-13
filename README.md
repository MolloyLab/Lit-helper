# Lit-helper
Lit-helper is a new tool that aims to help researchers reduce time spend on literature research post analysis and streamline the decision about which proteins or genes are the most interesting and most promising for follow-up experiments.

# Getting started
Download the Lit-helper_function.R, pubmed_Miner.R and the Query.R from the respository. Make sure R as well as RTools is installed on your PC. It might also be helpful to have a development invironment (i.e RStudio) installed for easier use of R. Install the following packages in R:
1.	rentrez
2.	RISmed
3.	wordcloud
4.	openxlsx
5.	cluster
6.	httr
7.	tm

The tool uses Excel's 2007 (or later) .xlsx file format as input and output. A software that can read and write these formats is therefore necessary.

# Using the Lit-Helper
An example input file is provied (Example.xlsx). Download the example file and save it in the same folder as the three .R files. Open the Query.R file using RStudio. Set the working directory to where you saved all .R files as well as the Example.xlsx file. In R change the fourth line (input.file) to 'Example.xlsx' and the output.file to 'Example_results.xlsx'. Run all 4 lines of code in the Query.R script. The script should now generate several plots in your working directory and the Example_result.xlsx file when it is done. At this point you can delete the plots in the folder (they are automatically inported into the result file). The result file containes a summary page as well as a detailed page for each protein/gene entry of your input file.

# Citing
When using Lit-helper please cite: 
