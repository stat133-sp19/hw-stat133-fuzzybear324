# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


#checks if prob is between 0 and 1
check_prob <- function(prob) {
  if(abs(prob) <= 1) {
    return(TRUE)
  } else{
    stop("invalid prob value")
  }
}

#checks if trials is a non-negative integer
check_trials <- function(trials) {
  if(trials > 0){
    return(TRUE)
  } else{
    stop("invalid trials value")
  }
}

#checks if number of successes is less than trials
#scuess is a vector of all possible number of number of success ex) (0,1,2,3,...,n)
check_success <- function(success, trials){
  if(length(success) <= trials) {
    return(TRUE)
  } else {
    stop("invalid success value")
  }
}
