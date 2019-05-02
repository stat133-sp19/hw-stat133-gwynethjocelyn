#' @title Binomial Cumulative
#' @description calculates the binomial cumulative distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return returns a dataframe with two classes, bincum and dataframe, with both the probability distribution and the cumulative probabilities (successes in the first column, porbability in the second column, cumulative in the third column)
#' @export
#' @examples bin_cumulative(trials = 5, prob = 0.5)

bin_cumulative <- function(trials, prob) {
  df <- bin_distribution(trials, prob)
  cumulative <- cumsum(df$probability)
  df$cumulative <- cumulative
  class(df) <- c("bincum", "data.frame")
  return(df)
}

#' @export

plot.bincum <- function(df){
  plot(df$cumulative, xlab = 'successes', ylab = 'probability', main = 'Binomial Cumulative Distribution', type = "o")
}

