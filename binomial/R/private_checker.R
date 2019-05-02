
#Title: Check Probability
#Description:test if an input prob is a valid probability value (between 0 and 1)
#Parameters: p probability
#return: TRUE or an error message

check_prob <- function(prob) {
  if (length(prob) != 1 | !is.numeric(prob)) {
    stop("\ninvalid prob value")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\np has to be a number betwen 0 and 1")
  }
  return(TRUE)
}

#Title: Check Trials
#Description: test if an input trials is a valid value for number of trials (i.e. n is a non-negative integer).
#Parameters: n (number of trials)
#Return: TRUE or an error message

check_trials <- function(trials){
  if (trials >= 0 & trials%%1 == 0){
    return (TRUE)
  } else{
    stop('invalid trials value')
  }
}

#Title: Check Successes
#Description: test if an input success is a valid value for number of successes (0 <= k <= n)
#Parameters: k (number of successes) and n (number of trials)
#return: TRUE or an error message

check_success <- function(success,trials){
  if (sum(success > trials) == 0 & sum(success%%1 != 0) == 0 & any(success >= 0)){
    return(TRUE)
  } else {
    stop('success cannot be greater than trials')
  }
}


