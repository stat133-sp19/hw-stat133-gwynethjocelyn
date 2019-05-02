library(testthat)

context("tests for checker functions")

#Test check_prob
test_that("check_prob works as expected",{
  expect_error(check_prob(prob = -0.2))
  expect_length(check_prob(prob = 0.2),1)
  expect_true(check_prob(prob = 0.2))
} )

#Test check_trials
test_that("check_trials works as expected",{
  expect_error(check_trials(trials = -10))
  expect_length(check_trials(trials = 10),1)
  expect_true(check_trials(trials = 10))
})

#Test check_success
test_that("check_success works as expected", {
  expect_error(check_success(success = 10, trials = 5))
  expect_error(check_success(success = -2,trials = 10))
  expect_true(check_success(success = 5,trials = 10))
})

