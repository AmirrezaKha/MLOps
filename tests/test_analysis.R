# Load required libraries
library(tidyverse)

# Function to run tests
run_tests <- function() {
  # Test 1: Data loads correctly
  dataset1 <- read.csv("data/census_2021_2001.csv", TRUE, sep = ",")
  if (nrow(dataset1) <= 0) {
    stop("Test failed: Data did not load correctly. Dataset has zero rows.")
  } else {
    message("Test passed: Data loads correctly.")
  }

  # Test 2: No missing values in the dataset
  finaldata <- na.omit(dataset1)
  if (nrow(dataset1) != nrow(finaldata)) {
    stop("Test failed: There are missing values in the dataset.")
  } else {
    message("Test passed: No missing values in the dataset.")
  }
}

# Run the tests
run_tests()
