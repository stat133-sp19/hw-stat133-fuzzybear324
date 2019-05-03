#' @title bin choose
#' @description Calculates the number of combinations in which k success can occur in n trials
#' @param n number of trials
#' @param k number of successes
#' @return number of combinations
#' @example bin_choose(5, 1:3)

bin_choose <- function(n, k) {
  if(max(k) > n){
    stop("k cannot be greater than n")
  }
  combinations <- factorial(n)/(factorial(k)*factorial(n-k))
  return(combinations)
}

#source("Berkeley/Spring 2019/Stat 133/hw-stat133/binomial/R/auxillary.R")
#source("Berkeley/Spring 2019/Stat 133/hw-stat133/binomial/R/checkers.R")

#' @title bin probability
#' @description Calculates the probability in which successes can occur in a given number trials given probability of a single success
#' @param trials number of trials
#' @param success number of successes
#' @param prob probability of each success
#' @return probability of that number of successes occurs
#' @example bin_probability(success = 2, trials = 5, prob = 0.5)

bin_probability <- function(success, trials, prob){
  
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  
  probability <- bin_choose(trials, success)*((prob)^success)*(1-prob)^(trials - success)
  return(probability)
}

#' @title bin distribution
#' @description creates a probability distribution for the number of trials given
#' @param trials number of trials
#' @param prob probability of each success
#' @return distrbtion of the success chances
#' @example bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob){
  succ <- c(0:trials)
  prob_list <- c()
  for(i in 0:trials){
    prob_list <- c(prob_list, bin_probability(success = i, trials = trials, prob = prob))
  }
  dist_df <- data.frame("success" = succ, "probability" = prob_list)
  class(dist_df) <- c("bindis", "data.frame")
  return(dist_df)
}

#' @export Creates a histogram of the probability distrubtion
plot.bindis <- function(dist){
  barplot(dist$probability, main = "histogram of distribution", xlab = "successes", ylab = "probability", names.arg = dist$success)
}


#' @title bin culimitive
#' @description creates a table for the cumulative probability of successes
#' @param trials number of trials
#' @param prob probability of each success
#' @return culumitive probability of the success chances
#' @example bin_cumulative(trials = 5, prob = 0.5)

bin_cumulative <- function(trials, prob){
  succ <- c(0:trials)
  prob_list <- c()
  cumul <- c()
  for(i in 0:trials){
    temp_prob <- bin_probability(success = i, trials = trials, prob = prob)
    prob_list <- c(prob_list, temp_prob)
    if(i == 0){
      cumul <- c(cumul, temp_prob)
    }
    if( i != 0){
      cumul <- c(cumul, cumul[i] + temp_prob)
    }
  }
  cumul_df <- data.frame("success" = succ, "probability" = prob_list, "cumulative" = cumul)
  class(cumul_df) <- c("bincum", "data.frame")
  return(cumul_df)
}

#' @export Creates a line plot of the cumulative proability
plot.bincum <- function(dist){
  plot(dist$cumulative, xlab = "success", ylab = "probability", main = "plot of cumulative probability", type = "o")
}

#' @title bin variable
#' @description creates an object showing the number of trials and probability of success
#' @param trials number of trials
#' @param prob probability of each success
#' @return object containing number of trials and probability
#' @example bin_variable(trials = 5, prob = 0.5)

bin_variable <- function(trials = 5, prob = 0.5){
  check_trials(trials)
  check_prob(prob)
  
  var_object <- c(trials, prob)
  class(var_object) <- "binvar"
  return(var_object)
}

#' @export prints the content of the object in a nice manner

print.binvar <- function(object){
  cat("\"Binomial Variable\" \n\nParameters \n- number of trials: ", object[1], "\n- prob of success :", object[2])
}

#' @export prints a list of the important stats of the trial/prob object
summary.binvar <- function(object){
  summary_list <- c(object[1], 
                    object[2], 
                    aux_mean(object[1], object[2]), 
                    aux_variance(object[1], object[2]),
                    aux_mode(object[1], object[2]), 
                    aux_skewness(object[1], object[2]),
                    aux_kurtosis(object[1], object[2]) 
                    )
  class(summary_list) <- "summary.binvar"
  return(summary_list)
}

print.summary.binvar <- function(object){
  cat("\"Summary Binomial\" \n\nParameters \n- number of trials: ", object[1], "\n- prob of success :", object[2],
      "\n\nMeasures \n- mean    : ", object[3],
      "\n- variance: ", object[4],
      "\n- mode    : ", object[5],
      "\n- skewness: ", object[6],
      "\n- kurtosis: ", object[7])
}

bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}

