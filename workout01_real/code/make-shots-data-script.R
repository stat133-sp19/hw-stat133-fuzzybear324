#title: Shot Charts for Some GSW Players
#Description: Preparing data for analaysis by makng summary files
#inputs: data for players
#outputs: summary text files for individual players and all players

#reading in data from local reposistory

#setwd("..")
#getwd()

curry <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)
klay <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
durant <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
draymond <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)

#adding name column
curry$name <- c("Steph Curry")
klay$name <- c("Klay Thompson")
durant$name <- c("Kevin Durant")
draymond$name <- c("Draymond Green")
iguodala$name <- c("Andre Iguodala")

#changing shot made values to be more descriptive
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"

klay$shot_made_flag[klay$shot_made_flag == "n"] <- "shot_no"
klay$shot_made_flag[klay$shot_made_flag == "y"] <- "shot_yes"

durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"

draymond$shot_made_flag[draymond$shot_made_flag == "n"] <- "shot_no"
draymond$shot_made_flag[draymond$shot_made_flag == "y"] <- "shot_yes"

iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"

#Adding column minutes
curry$minute <- (12*curry$period)-curry$minutes_remaining
klay$minute <- (12*klay$period)-klay$minutes_remaining
durant$minute <- (12*durant$period)-durant$minutes_remaining
draymond$minute <- (12*draymond$period)-draymond$minutes_remaining
iguodala$minute <- (12*iguodala$period)-iguodala$minutes_remaining

#Sinking files to output folder
sink("output/steph-curry-summary.txt")
summary(curry)
sink()

sink("output/klay-thompson-summary.txt")
summary(klay)
sink()

sink("output/kevin-durant-summary.txt")
summary(durant)
sink()

sink("output/draymond-green-summary.txt")
summary(draymond)
sink()

sink("output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

#binding and exporting the tables
shot_data <- rbind(curry, klay, durant, draymond, iguodala)
write.csv(shot_data, file = "data/shots-data.csv")

#sinking the summary of the big table
sink("output/shot_data-summary.txt")
summary(shot_data)
sink()



