library(dplyr)

## Removed by Andy.
##setwd("C:/Users/kzl03/Documents/Puzzle/Week1/data")

files <- dir(path="../data/", full.names = TRUE, pattern=".csv")
seq_along(files)
for(i in seq_along(files)) {
  if (i == 1) { 
    prov_data <- read.csv(files[i], as.is=TRUE)
    prov_data$source <- paste("file", i, sep="")
  } else {
    temp <- read.csv(files[i], as.is=TRUE)
    temp$source <- paste("file", i, sep="")
    prov_data <- rbind(prov_data, temp)
    rm(temp)
  }
}

write.table(prov_data, file = "One_big_file.CSV",append = FALSE, row.names=FALSE, na="",col.names=TRUE, sep=",")

# Extra Credit #1
by_source <- group_by(prov_data, source)
summarise(by_source, mymean=mean(prov_data[, c(1)]))
summarise(by_source, mymean=mean(prov_data[, c(2)]))
summarise(by_source, mymean=mean(prov_data[, c(3)]))

# Extra Credit #2
by_source <- group_by(prov_data, source)
summarise(by_source, mysd=sd(prov_data[, c(1)]))
summarise(by_source, mysd=sd(prov_data[, c(2)]))
summarise(by_source, mysd=sd(prov_data[, c(3)]))
