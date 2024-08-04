# Use the Rockerverse image with R 4.0.0
FROM rocker/verse:4.0.0

# Install R packages
RUN Rscript -e "install.packages(c('tidyverse', 'ggplot2', 'testthat', 'rmarkdown'))"

# Copy the local directory contents into the container
COPY . /usr/local/src/myscripts

# Set the working directory
WORKDIR /usr/local/src/myscripts

# Default command to run when the container starts
CMD ["Rscript", "-e", "rmarkdown::render('R/analysis.Rmd')"]
