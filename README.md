# My MLOps Project

This project performs analysis on census data using R and R Markdown, with CI/CD pipelines set up using GitHub Actions.

## Directory Structure

- `.github/workflows/ci.yml`: GitHub Actions workflow file.
- `R/analysis.Rmd`: R Markdown file containing the main analysis.
- `R/statistical_test.Rmd`: R Markdown file containing statistical tests.
- `R/regression.Rmd`: R Markdown file containing regression analysis.
- `tests/test_analysis.R`: Test script for the analysis.
- `data/census_2021_2001.csv`: Census data file.
- `data/immo_data_ruhr.csv`: Real estate data file.
- `data/vwcars.csv`: Vehicle data file.
- `.gitignore`: Git ignore file.
- `README.md`: This README file.
- `Dockerfile`: Dockerfile for containerizing the application.
- `requirements.R`: R script for installing required packages.

## Getting Started

1. Clone the repository.
2. Place your data files in the `data` directory.
3. Run the analysis using RStudio or the command line:
   ```sh
   Rscript -e "rmarkdown::render('R/analysis.Rmd')"


## CI/CD with GitHub Actions

This project uses GitHub Actions for continuous integration and continuous deployment. The workflow is defined in the `.github/workflows/ci.yml` file.

### Workflow Overview

The workflow performs the following steps:

1. **Triggers** on push and pull request events to the `master` branch, and can be manually triggered.
2. **Runs** on the latest Ubuntu environment.
3. **Sets up R** with the specified version.
4. **Installs** system dependencies and R packages.
5. **Verifies** the installation of key R packages.
6. **Lists** the contents of relevant directories.
7. **Runs** tests to ensure data loads correctly and the scripts execute as expected.
8. **Renders** the R Markdown files (`analysis.Rmd`, `statistical_test.Rmd`, `regression.Rmd`).
9. **Prints** session information to help with debugging and ensuring reproducibility.
