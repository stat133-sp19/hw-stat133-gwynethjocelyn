#' @title Binomial Distribution
#' @description calculates the probabilities of all possible number of successes for a binomial distribution
#' @param n number of trials
#' @param p probability of success
#' @return data.frame with two classes, "bindis" and "data.frame" with the probability distribution (successes in the first column, probability in the second column)
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob){
  k <- c(seq(0, trials))
  probability <- bin_probability(k, trials, prob)
  df <- data.frame(success = k, probability = probability)
  class(df) <- c("bindis", "data.frame")
  return(df)
}

#' @export
plot.bindis <- function(df){
  barplot(df$probability, names.arg = df$success, xlab = "successes", ylab = "probability", main = "Binomial Probability Distribution")
}
