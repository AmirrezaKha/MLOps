# My MLOps Project

This project performs analysis on census data using R and R Markdown, with CI/CD pipelines set up using GitHub Actions.

## Directory Structure

- `.github/workflows/ci.yml`: GitHub Actions workflow file.
- `R/analysis.Rmd`: R Markdown file containing the analysis.
- `tests/test_analysis.R`: Test script for the analysis.
- `data/census_2021_2001.csv`: Data file.
- `.gitignore`: Git ignore file.
- `README.md`: This README file.
- `Dockerfile`: Dockerfile for containerizing the application.
- `requirements.R`: R script for installing required packages.

## Getting Started

1. Clone the repository.
2. Place your data file in the `data` directory.
3. Run the analysis using RStudio or the command line:
   ```sh
   Rscript -e "rmarkdown::render('R/analysis.Rmd')"
