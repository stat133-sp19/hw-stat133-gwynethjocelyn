#' @title Binomial Mean
#' @description calculates the expected number of successes in n trials
#' @param n number of trials
#' @param p probability of success
#' @return a number, the mean of a binomial random variable
#' @export
#' @examples bin_mean(trials = 10, prob = 0.5)

bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}

#' @title Binomial Variance
#' @description Calculates the variance of a binomial distribution
#' @param n number of trials
#' @param p probability of success
#' @return a number, the variance of a binomial random variable
#' @export
#' @examples bin_variance(trials = 10, prob = 0.5)

bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}

#' @title Binomial Mode
#' @description Calculates the mode (the most likely number of successes)
#' @param n number of trials
#' @param p probability of success
#' @return a number, the calculated mode
#' @export
#' @examples bin_mode(trials = 10, prob = 0.5)

bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}

#' @title Binomial Skewness
#' @description Calculates the sknewness of the graph (the assymetry of the probability distribution about its mean)
#' @param n number of trials
#' @param p probability of success
#' @return a number, the calculated skewness of a binomial random variable
#' @export
#' @examples bin_skewness(trials = 10, prob = 0.5)

bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}

#' @title Binomial Kurtosis
#' @description Calculates the kurtosis ("expected number of successes in n trials"tailedness" of the probability distribution)
#' @param n number of trials
#' @param p probability of success
#' @return a number, the calculated kurtosis of a binomial random variable
#' @export
#' @examples bin_kurtosis(trials = 10, prob = 0.5)

bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}









