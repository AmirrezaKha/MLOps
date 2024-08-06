# Function to check if a package is installed, and install it if not
install_if_missing <- function(p) {
  if (!require(p, character.only = TRUE)) {
    install.packages(p, dependencies = TRUE, repos="http://cran.rstudio.com/")
    library(p, character.only = TRUE)
  }
}

# List of required packages
required_packages <- c("ggplot2", "rmarkdown", "testthat", "leaps", "olsrr")

# Install and load required packages
lapply(required_packages, install_if_missing)

# Function to run tests
run_tests <- function() {
  # Test 1: Data loads correctly for census_2021_2001.csv
  dataset1 <- read.csv("data/census_2021_2001.csv", TRUE, sep = ",")
  if (nrow(dataset1) <= 0) {
    stop("Test failed: Data did not load correctly. Dataset has zero rows.")
  } else {
    message("Test passed: census_2021_2001.csv data loads correctly.")
  }

  # Test 2: Data loads correctly for immo_data_ruhr.csv
  immo_data_ruhr <- read.csv("data/immo_data_ruhr.csv", sep = ",")
  if (nrow(immo_data_ruhr) <= 0) {
    stop("Test failed: Data did not load correctly. Dataset has zero rows.")
  } else {
    message("Test passed: immo_data_ruhr.csv data loads correctly.")
  }

  # Test 3: Data loads correctly for vwcars.csv
  vwcars <- read.csv("data/vwcars.csv", sep = ",")
  if (nrow(vwcars) <= 0) {
    stop("Test failed: Data did not load correctly. Dataset has zero rows.")
  } else {
    message("Test passed: vwcars.csv data loads correctly.")
  }
}

# Run the tests
run_tests()

# Additional tests for statistical analysis
library(testthat)

# Load the statistical test Rmd script to ensure it runs without errors
rmarkdown::render("R/statistical_test.Rmd")

# Load the regression Rmd script to create the models
rmarkdown::render("R/regression.Rmd")

# Test if the data is loaded correctly for statistical tests
test_that("Data is loaded for statistical tests", {
  immo_data_ruhr <- read.csv("data/immo_data_ruhr.csv", sep = ",")
  expect_true(nrow(immo_data_ruhr) > 0)
  expect_true("region" %in% colnames(immo_data_ruhr))
  expect_true("sqmPrice" %in% colnames(immo_data_ruhr))
})

# Test the summary statistics calculation
test_that("Summary statistics are calculated", {
  immo_data_ruhr <- read.csv("data/immo_data_ruhr.csv", sep = ",")
  summary_stats <- aggregate(sqmPrice ~ region, data = immo_data_ruhr, function(x) {
    c(
      count = length(x),
      mean = mean(x, na.rm = TRUE),
      sd = sd(x, na.rm = TRUE),
      min = quantile(x, probs = 0),
      quant25 = quantile(x, probs = 0.25),
      quant50 = quantile(x, probs = 0.5),
      quant75 = quantile(x, probs = 0.75),
      max = quantile(x, probs = 1)
    )
  })
  expect_true(ncol(summary_stats) > 1)
  expect_true("region" %in% colnames(summary_stats))
})

# Test the linear models from the regression analysis
test_that("Linear models are created", {
  expect_true(exists("lm_price"))
  expect_true(exists("lm_logprice"))
  expect_true(exists("lm_bic"))
  expect_true(is.list(lm_price))
  expect_true(is.list(lm_logprice))
  expect_true(is.list(lm_bic))
})

# Test if the best subset selection is performed correctly
test_that("Best subset selection is performed", {
  expect_true(exists("z"))
  expect_equal(nrow(z), 255)
  expect_true(is.numeric(AIC))
  expect_true(is.numeric(BIC))
})
