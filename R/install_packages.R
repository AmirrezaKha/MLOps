packages <- c("tidyverse", "ggplot2", "rmarkdown")

install_if_missing <- function(p) {
  if (!requireNamespace(p, quietly = TRUE)) {
    install.packages(p, repos = "https://cran.rstudio.com/", dependencies = TRUE)
  }
}

invisible(lapply(packages, install_if_missing))
