FROM rocker/tidyverse

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /project
WORKDIR /project

RUN mkdir rawdata
RUN mkdir cleandata
RUN mkdir code
RUN mkdir output

COPY Part2.Rmd .
COPY Makefile .
COPY rawdata rawdata
COPY cleandata cleandata
COPY code code

COPY misc/.Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt = FALSE)"

RUN Rscript -e "tinytex::install_tinytex()"
ENV PATH="${PATH}:finalproject/bin"

RUN mkdir finalreport

CMD make && mv Part2.pdf finalreport