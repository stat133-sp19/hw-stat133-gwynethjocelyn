### Overview
`binomial` allows users to calculate the probability for a random variable with a binomial distribution. It also displays and visualizes the binomial probability distribution and the binomial cumulative distribution given certain the number of trials done and the probability of success for a given trial.  

- `bin_variable()` lists the parameters of the binomial random variable.
- `summary()` gives the summary of `bin_variable()`. It will list the random variable's mean, variance, mode, skewness and kurtosis.
- `bin_mean()` calculates the mean of the binomial random variable
- `bin_variance()` calculates the variance of the binomial random variable
- `bin_mode()` calculates the mode of the binomial random variable
- `bin_skewness()` calculates the skewness of the binomial random variable
- `bin_kurtosis()` calculates the kurtosis of the binomial random variable
– `bin_choose()` gives the number of possible combinations in which the desired number of successes can occur in the specified number of trials.
– `bin_probability()` gives the probability of getting the desired number of successes in the specified number of trials trials given the probability of success in each trial.
– `bin_distribution()` gives a table of probabilities of each number of successes in a fixed number of random trials given the probability of success in each trial.
– `bin_cumulative()` gives a table of both the probabilities and the cumulative probabilities of each number of successes.
- `plot()` can be applied to objects created by `bin_distribution()`  to plot the binomial probability distribution histogram or applied to `bin_cumulative()` to plot binomial cumulative distribution graph.


## Motivation
This package is developed to make calculations and visualization associated with the binomial distribution simpler and faster.

## Usage
#####creating binomial random variable
```{r}
library(binomial)

bin1 <- bin_variable(trials = 10, prob = 0.3)
bin1

#output:
#"Binomial variable"
#
#Parameters
#- number of trials:  10 
#- prob of success :  0.3 
```
#####summary of bin1
```{r}
summary(bin1)

#output:
#"Summary Binomial"
#
#Parameters
#- number of trials: 10 
#- prob of success: 0.3 
#
#Measures
#- mean	  : 3 
#- variance: 2.1 
#- mode	  : 3 
#- skewness: 0.2760262 
#- kurtosis: -0.1238095 
```

#####the number of combinations where 2 successes can occur in 10 trials
```{r}
bin_choose(n = 10, k = 2)

#output:
#45
```

#####the binomial probability distribution
```{r}
dis1 <- bin_distribution(trials = 10, prob = 0.3)
dis1
```

#####plotting the binomial probability distribution
```{r}
plot(dis1)
```

#####calculate the mean of the random variable
```{r}
bin_mean(trials = 10, prob = 0.3)

#output:
#3
```

