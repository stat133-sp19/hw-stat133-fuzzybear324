
#gets the mean of the binomial
aux_mean <- function(trials, prob){
  mean<- trials*prob
  return(mean)
}

#gets the variance of the binomial
aux_variance <- function(trials, prob){
  variance <- trials*prob*(1-prob)
  return(variance)
}

#gets the mode of the binomial
aux_mode <- function(trials, prob){
  mode <- floor(trials*prob+prob)
  return(mode)
}

#gets the skewness
aux_skewness <- function(trials, prob){
  skewness <- (1-2*prob)/sqrt(trials*prob*(1-prob))
  return(skewness)
}

#gets the kurtosis
aux_kurtosis <- function(trials, prob){
  kurtosis <- (1-6*prob*(1-prob))/(trials*prob*(1-prob))
  return(kurtosis)
}

