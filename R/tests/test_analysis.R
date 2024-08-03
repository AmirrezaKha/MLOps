library(testthat)
library(tidyverse)

test_that("Data loads correctly", {
  dataset1 <- read.csv("data/census_2021_2001.csv", TRUE, sep = ",")
  expect_true(nrow(dataset1) > 0)
})

test_that("No missing values in the dataset", {
  dataset1 <- read.csv("data/census_2021_2001.csv", TRUE, sep = ",")
  finaldata <- na.omit(dataset1)
  expect_equal(nrow(dataset1), nrow(finaldata))
})
