
#### `Dockerfile`

FROM rocker/verse:4.0.0

RUN Rscript -e 'install.packages("tidyverse")'
RUN Rscript -e 'install.packages("ggplot2")'
RUN Rscript -e 'install.packages("testthat")'
RUN Rscript -e 'install.packages("rmarkdown")'

COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts

CMD ["Rscript", "-e", "rmarkdown::render('R/analysis.Rmd')"]
