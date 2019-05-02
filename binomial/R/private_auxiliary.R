#Private Auxiliary Functions

#Title: Auxiliary Mean
#Description: Calculates the expected number of successes in n trials
#Parameters: n (number of trials) and p (probability of success)
#Return: a number, the mean of a binomial random variable
aux_mean <- function(trials, prob){
  return(trials*prob)
}

#Title: Auxiliary Variance
#Description: Calculates the variance of a binomial distribution
#Parameters: n (number of trials) and p (probability of success)
#Return: a number, the variance of a binomial random variable
aux_variance <- function(trials, prob){
  return(trials*prob*(1-prob))
}

#Title: Auxiliary Mode
#Description: Calculates the mode (the most likely number of successes)
#Parameters: n (number of trials) and p (probability of success)
#Return: a number, the calculated mode

aux_mode <- function(trials, prob){
  m <- trials*prob + prob
  m2 <- floor(m)
  if (m%%1 == 0){
    return(c(m2, m2-1))
  } else{
    return(m2)
  }
}

#Title: Auxiliary Skewness
#Description: Calculates the sknewness of the graph (the assymetry of the probability distribution about its mean)
#Parameters: n (number of trials) and p (probability of success)
#Return: a number, the calculated skewness of a binomial random variable
aux_skewness <- function(trials, prob){
  skewness <- (1-2*prob)/sqrt(trials*prob*(1-prob))
  return(skewness)
}

#Title: Auxiliary Kurtosis
#Description: Calculates the kurtosis ("expected number of successes in n trials"tailedness" of the probability distribution)
#Parameters: n (number of trials) and p (probability of success)
#Return: a number, the calculated kurtosis of a binomial random variable
aux_kurtosis <- function(trials, prob){
  kurtosis <- (1-6*prob*(1-prob))/(trials*prob*(1-prob))
  return(kurtosis)
}




