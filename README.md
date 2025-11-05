# Project Directory Contents

1. __`code/00_cleandata.R`__
    - *Description*
        - loads the original/raw data set and extracts only the 18 variables I would like to keep in the clean dataset
        - excludes missing observations for my main variables to be used in analysis
        - re-codes variables from numbers to descriptive words; meant to improve readability and formatting of the tables/figures
  	- cleaned data set (`00_cd.rds`) should be saved to `cleandata/`
	   
2. __`code/01_analysis_tbl.R`__
    - *Description*
        - creates a bivariate analysis/descriptive table of all variables in the data set
		- table (`table_one.rds`) should be saved to `output/`
		
3.  __`code/02_analysis_fig.R`__
    - *Description*
      	- creates a bar graph of household income and the proportion of individuals who reported drug abuse
		- graph (`figure_one.rds`) should be saved to `output/`
		
4.  __`Part2.Rmd`__ reads in the data set from `cleandata/` and output from `output/` to create the report with descriptions and analysis combined

*Note: __`code/03_render.R`__ is used for rendering the combined report from the command line



# Generating the Report

1. Make sure you are in the correct project directory `finalproject/` by typing in "pwd" in your terminal.
    - if you aren't in the right directory, use "cd " to change into it
    
2. In the terminal, type "make clean"
    - check the `output/` and `cleandata/` folders to ensure they are empty
    
3. In the terminal, type "make" and watch as the report generates!

