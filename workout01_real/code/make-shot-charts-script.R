#Title: Code for making charts
#Description: Making charts
#Input: Data for players
#Outputs: Charts 

library(ggplot2)
library(grid)
library(jpeg)
library(readr)

court_file <- "images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

klay_scatterplot <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Klay Thompson (2016) ') +
  theme_minimal()

pdf(file = "images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
klay_scatterplot
dev.off()


andre_scatterplot <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Andre Iguodala (2016) ') +
  theme_minimal()

pdf(file = "images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
andre_scatterplot
dev.off()


draymond_scatterplot <- ggplot(data = draymond) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Draymond Green (2016) ') +
  theme_minimal()

pdf(file = "images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
draymond_scatterplot
dev.off()


kevin_scatterplot <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Kevin Durant (2016) ') +
  theme_minimal()

pdf(file = "images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
kevin_scatterplot
dev.off()


steph_scatterplot <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: Steph Curry (2016) ') +
  theme_minimal()

pdf(file = "images/steph-curry-shot-chart.pdf", width = 6.5, height = 5)
steph_scatterplot
dev.off()

# Faceting

shots_data <- read_csv("~/Berkeley/Spring 2019/Stat 133/workout01_real/data/shots-data.csv")
all_players <- ggplot(data = shot_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420) +
  ggtitle('Shot Chart: GSW (2016 season) ') +
  facet_wrap(~ name) +
  theme_minimal()

pdf(file = "images/gsw-shot-charts.pdf", width = 8, height = 7)
all_players
dev.off()

png(file = "images/gsw-shot-charts.png", width = 8, height = 7)
all_players
dev.off()



