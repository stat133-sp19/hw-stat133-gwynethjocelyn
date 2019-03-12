#title: GSW shot chart
#description: prepare the data and make shot charts for GSW players
#inputs:
#outputs: 
#in workout01/data: andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv, shots-data.csv, stephen-curry.csv
#in workout01/images: andre-iguodala-short-chart.pdf, draymond-green-short-chart.pdf, kevin-durant-short-chart.pdf, klay-thompson-short-chart.pdf, nba-counrt.jpg, stephen-curry-short-chart.pdf
#in workout01/output: andre-iguodala-summary.txt, draymond-green-summary.txt, kevin-durant-summary.txt, klay-thompson-summary.txt, shots-data-summary.txt, stephen-curry-summary.txt

#importing packages
library("readr")
library("ggplot2")
library("grid")
library("jpeg")
  
#downloading player files
download.file('https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/andre-iguodala.csv', destfile = '~/Documents/hw-stat133/workout01/data/andre-iguodala.csv')
download.file('https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/draymond-green.csv', destfile = '~/Documents/hw-stat133/workout01/data/draymond-green.csv')
download.file('https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/kevin-durant.csv', destfile = '~/Documents/hw-stat133/workout01/data/kevin-durant.csv')
download.file('https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/klay-thompson.csv', destfile = '~/Documents/hw-stat133/workout01/data/klay-thompson.csv')
download.file('https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/stephen-curry.csv', destfile = '~/Documents/hw-stat133/workout01/data/stephen-curry.csv')

#read files into dataframes
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

#add name columns to each dataframe
iguodala$name <- 'Andre Iguodala'
green$name <- 'Draymond Green'
durant$name <- 'Kevin Durant'
thompson$name <- 'Klay Thompson'
curry$name <- 'Stephen Curry'

#change values of shot_made_flags
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- "shot_no"

green$shot_made_flag[green$shot_made_flag == 'y'] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == 'n'] <- "shot_no"

durant$shot_made_flag[durant$shot_made_flag == 'y'] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- "shot_no"

thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- "shot_no"

curry$shot_made_flag[curry$shot_made_flag == 'y'] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- "shot_no"

#add column minute
iguodala$minute <- (iguodala$period * 12 - iguodala$minutes_remaining)
green$minute <- (green$period * 12 - green$minutes_remaining)
durant$minute <- (durant$period * 12 - durant$minutes_remaining)
thompson$minute <- (thompson$period * 12 - thompson$minutes_remaining)
curry$minute <- (curry$period * 12 - curry$minutes_remaining)

#send summary output into individual text-files
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

#stack the tables into one single data frame
GSW <- rbind(iguodala, green, durant, thompson, curry)
GSW

#export table as a CSV file
write.csv(GSW, file = '../data/shots-data.csv')

#send the summary output of the assembled table
sink(file = '../output/shots-data-summary.txt')
summary(GSW)
sink()

#download court image
download.file('https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/images/nba-court.jpg', '../images/nba-court.jpg')
court_file <- "../images/nba-court.jpg"

#create raste object
court_image <- rasterGrob(
  readJPEG(court_file), 
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

#shot chart with court background
iguodala_scatter <- ggplot(data = iguodala) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color = shot_made_flag), size = 0.5) + ylim(-50, 420) + ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()
green_scatter <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color = shot_made_flag), size = 0.5) + ylim(-50, 420) + ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()
durant_scatter <- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color = shot_made_flag), size = 0.5) + ylim(-50, 420) + ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()
thompson_scatter <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color = shot_made_flag), size = 0.5) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
curry_scatter <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color = shot_made_flag), size = 0.5) + ylim(-50, 420) + ggtitle('Shot Chart: Stephen Curry (2016 season)') + theme_minimal()

#save the plots in pdf
pdf(file = '../images/andre-iguodala-shot-chart.pdf', width = 6.5, height = 5)
iguodala_scatter
dev.off()

pdf(file = '../images/draymond-green-shot-chart.pdf', width = 6.5, height = 5)
green_scatter
dev.off()

pdf(file = '../images/kevin-durant-shot-chart.pdf', width = 6.5, height = 5)
durant_scatter
dev.off()

pdf(file = '../images/klay-thompson-shot-chart.pdf', width = 6.5, height = 5)
thompson_scatter
dev.off()

pdf(file = '../images/stephen-curry-shot-chart.pdf', width = 6.5, height = 5)
curry_scatter
dev.off()

#create a faceted graphic
GSW_scatter <- ggplot(data = GSW) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color = shot_made_flag), size = 0.2) + ylim(-50, 420) + ggtitle('Shot Charts: (2016 season)') + facet_wrap(~ name) + theme_minimal()

#save the image in pdf format
pdf(file = '../images/gsw-shot-charts.pdf', width = 8, height = 7)
GSW_scatter
dev.off()

png(file = '../images/gsw-shot-charts.png', width = 768, height = 672)
GSW_scatter
dev.off()



