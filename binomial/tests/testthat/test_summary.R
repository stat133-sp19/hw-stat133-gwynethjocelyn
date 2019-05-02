library(testthat)

context("tests for summary functions")

#Test aux_mean
test_that("aux_mean works as expected", {
  expect_equal(aux_mean(10, 0.2), 2)
  expect_length(aux_mean(10, 0.2), 1)
  expect_type(aux_mean(10, 0.2), 'double')
})

#Test aux_variance
test_that("aux_variance works as expected", {
  expect_equal(aux_variance(10, 0.2), 1.6)
  expect_length(aux_variance(10, 0.2), 1)
  expect_type(aux_variance(10, 0.2), 'double')
})

#Test aux_mode
test_that("aux_mode works as expected", {
  expect_equal(aux_mode(10, 0.2), 2)
  expect_length(aux_mode(10, 0.2), 1)
  expect_type(aux_mode(10, 0.2), 'double')
})

#Test aux_skewness
test_that("aux_skewness works as expected", {
  expect_equal(round(aux_skewness(10, 0.2), 3), 0.474)
  expect_length(aux_skewness(10, 0.2), 1)
  expect_type(aux_skewness(10, 0.2), 'double')
})

#Test aux_kurtosis
test_that("aux_kurtosis works as expected", {
  expect_equal(aux_kurtosis(10, 0.2), 0.025)
  expect_length(aux_skewness(10, 0.2), 1)
  expect_type(aux_skewness(10, 0.2), 'double')
})




