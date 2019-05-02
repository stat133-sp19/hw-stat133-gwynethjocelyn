library(testthat)

context('tests for binomial function')

#Test for bin_choose
test_that("bin_choose works as expected", {
  expect_error(bin_choose(2, 10), "k cannot be greater than n")
  expect_equal(bin_choose(10, 2), 45)
  expect_equal(bin_choose(10, 1:3), c(10, 45, 120))
  expect_length(bin_choose(10, 1:3), 3)
})

#Test for bin_probability
test_that("bin_probability works as expected", {
  expect_error(bin_probability(10, -1, 0.2))
  expect_error(bin_probability(10, 2, -0.2))
  expect_error(bin_probability(2, 10, 1.5))
  expect_equal(round(bin_probability(success = 2, trials = 10, prob = 0.2), 3), 0.302)
})

#Test for bin_distribution
test_that("bin_distribution works as expected", {
  expect_error(bin_distribution(10, -0.2))
  expect_length(bin_distribution(10, 0.2)[[2]], 11)
  expect_equal(round(bin_distribution(10, 0.2)[[2]][1], 3), 0.107)
  expect_is(bin_distribution(10, 0.2), c("bindis", "data.frame"))
})

#Test for bin_cumulative
test_that("bin_cumulative works as expected", {
  expect_error(bin_cumulative(10, -0.2))
  expect_error(bin_cumulative(-1, 0.2))
  expect_is(bin_cumulative(trials = 10, prob = 0.2), c('bincum', 'data.frame'))
})

