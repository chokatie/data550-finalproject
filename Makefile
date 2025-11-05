Part2.pdf: code/03_render.R Part2.Rmd output
	Rscript code/03_render.R


cleandata/00_cd.rds: code/00_cleandata.R rawdata/NSDUH_2022.Rdata
	Rscript code/00_cleandata.R


output/table_one.rds: code/01_analysis_tbl.R cleandata/00_cd.rds
	Rscript code/01_analysis_tbl.R

output/figure_one.rds: code/02_analysis_fig.R cleandata/00_cd.rds
	Rscript code/02_analysis_fig.R
	
	
.PHONY: output
output: cleandata/00_cd.rds output/table_one.rds output/figure_one.rds

# Phony rule for cleaning both output folders + rendered document
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f cleandata/*rds && rm -f *.html && rm -f *.pdf