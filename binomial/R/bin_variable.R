#'@title Binomial Variable
#'@description this function describes the random variable
#'@param trials number of trials
#'@param prob probability of success
#'@return list, a list of the number of trials and probability of success associated with the random variable
#'@export
#'@examples bin_variable(trials = 10, prob = 0.2)

bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  lst <- list(trials = trials, prob = prob)
  class(lst) <- c("binvar")
  return(lst)
}

#' @export
print.binvar <- function(lst){
  cat('"Binomial variable"\n\n')
  cat("Parameters\n")
  cat("- number of trials: ", lst[[1]], "\n")
  cat("- prob of success : ", lst[[2]], "\n")
}

#' @export
summary.binvar <- function(lst){
  summary <- list(trials = lst[["trials"]],
               prob = lst[["prob"]],
               mean = aux_mean(lst[["trials"]], lst[["prob"]]),
               variance = aux_variance(lst[["trials"]], lst[["prob"]]),
               mode = aux_mode(lst[["trials"]], lst[["prob"]]),
               skewness = aux_skewness(lst[["trials"]], lst[["prob"]]),
               kurtosis = aux_kurtosis(lst[["trials"]], lst[["prob"]]))
  class(summary) <- "summary.binvar"
  return(summary)
}

#' @export
print.summary.binvar <- function(summary){
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", summary[['trials']], "\n")
  cat("- prob of success:", summary[['prob']], "\n\n")
  cat("Measures\n")
  cat("- mean\t  :", summary[['mean']], "\n")
  cat("- variance:", summary[['variance']], "\n")
  cat("- mode\t  :", summary[['mode']], "\n")
  cat("- skewness:", summary[['skewness']], "\n")
  cat("- kurtosis:", summary[['kurtosis']], "\n")
}



