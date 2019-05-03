library(testthat)

# source("Berkeley/Spring 2019/Stat 133/hw-stat133/binomial/R/auxillary.R")
# source("Berkeley/Spring 2019/Stat 133/hw-stat133/binomial/R/checkers.R")

context("Check the checkers")

test_that("check_prob for valid and invalid prob", {
  expect_length(check_prob(0.5),1)
  expect_lte(check_prob(0.5), 1)
  expect_error(check_prob(2))
})

test_that("check_trials for valid and invalid trials",{
  expect_length(check_trials(5),1)
  expect_lte(check_trials(5), 1)
  expect_error(check_trials(-3))
})

test_that("check_success for valid and invalid success",{
  expect_error(check_success(c(1:10),5))
  expect_length(check_success(5,8),1)
  expect_true(check_success(5,3))
})

context("Check the summaries")

test_that("check aux_mean to see if it works",{
  expect_length(aux_mean(10, 0.5),1)
  expect_type(aux_mean(10, 0.5), "double")
  expect_equal(aux_mean(10, 0.5), 5)
})

test_that("check aux_variance to see if it works",{
  expect_length(aux_variance(10, 0.5),1)
  expect_type(aux_variance(10, 0.5), "double")
  expect_equal(aux_variance(10, 0.5), 2.5)
})

test_that("check aux_mode to see if it works",{
  expect_length(aux_mode(10, 0.5),1)
  expect_type(aux_mode(10, 0.5), "double")
  expect_equal(aux_mode(10, 0.5), 5)
})

test_that("check aux_skewness to see if it works",{
  expect_length(aux_skewness(10, 0.5),1)
  expect_type(aux_skewness(10, 0.5), "double")
  expect_equal(aux_skewness(10, 0.5), 0)
})

test_that("check aux_kurtosis to see if it works",{
  expect_length(aux_kurtosis(10, 0.5),1)
  expect_type(aux_kurtosis(10, 0.5), "double")
  expect_equal(aux_kurtosis(10, 0.5), -0.2)
})