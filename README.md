# Project Directory Contents <br>

1. __`code/00_cleandata.R`__
    - *Description*
        - loads the original/raw data set and extracts only the 18 variables I would like to keep in the clean dataset
        - excludes missing observations for my main variables to be used in analysis
        - re-codes variables from numbers to descriptive words; meant to improve readability and formatting of the tables/figures
  	- cleaned data set (`00_cd.rds`) should be saved to `cleandata/` <br><br>
	   
2. __`code/01_analysis_tbl.R`__
    - *Description*
        - creates a bivariate analysis/descriptive table of all variables in the data set
		- table (`table_one.rds`) should be saved to `output/` <br><br>
		
3.  __`code/02_analysis_fig.R`__
    - *Description*
      	- creates a bar graph of household income and the proportion of individuals who reported drug abuse
		- graph (`figure_one.rds`) should be saved to `output/` <br><br>
		
4.  __`Part2.Rmd`__ reads in the data set from `cleandata/` and output from `output/` to create the report with descriptions and analysis combined <br><br>

5. __`renv.lock`__ and __`renv/`__  captures information on the packages used to create the report
    - Makefile includes phony rule _(listed in the instructions below)_ to restore the package environment <br><br><br>

*Note: __`code/03_render.R`__ is used for rendering the combined report from the command line <br><br><br>


# Generating the Report <br>
 
1. **Make sure you are in the correct project directory** `finalproject/` by typing in "pwd" in your terminal + "getwd()" in your console.
    - if you aren't in the right _terminal directory_, use "cd " to change into it; if not in right _console directory_, use "setwd()"
    - NOTE: you can also just open `finalproject.Rproj` to automatically go to the correct directory <br><br>   
    
2. In the terminal, type **"make finalreport"** and watch as the report generates
    - view the finished report by accessing the `finalreport/` file
    - in this folder there should be a `Part2.pdf` file that you can open


# [OPTIONAL] Dockerfile Image Build Instructions <br>

1. **Make sure you are in the correct project directory** <br><br>  

2. In the terminal, type **"docker build -t fp_image1 ."**
    - this will build the docker image to your local system <br><br>  
    
3. OR access the image on DockerHub here: https://hub.docker.com/layers/chokatie/fp_image1/latest/images/sha256-bd9a8cd4d46cb7cb0a07774c4b09f57a7ef771aeb586a7d4e93da95e4e3a8603
  - to call the image on your local system, type **"docker pull chokatie/fp_image1:latest"** in your terminal
