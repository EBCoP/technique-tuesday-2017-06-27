## #############################################################################
## Files
##
## Creates a series of CSV files for my very first Technique Tuesday.
## #############################################################################

library(dplyr)
library(pander)

pets <- c("Alpaca","Ant Farm","Bird","Cat","Dog","Ferret","Fish","Frog or Toad",
          "Gecko","Gerbil","Goat","Guinea Pig","Hamster","Hedgehog","Hermit Crab",
          "Horse","Iguana","Mantis","Mouse","Newt","Pig","Rabbit","Rat",
          "Salamander","Sheep","Snake","Spider","Stick-Bugs",
          "Turtle or Tortoise")
r-
first_col <- sample(c(1:50,1:100), 2000, replace=TRUE)
second_col <- sample(1:500, 2000, replace=TRUE)
third_col <- sample(1:1000, 2000, replace=TRUE)
fourth_col <- sample(pets, 2000, replace=TRUE)
fifth_col <- sample(letters, 2000, replace=TRUE)

all_data <- data.frame(first_col, second_col, third_col, fourth_col, fifth_col)

## Creates a skew in the third column in the third file.
## Rule of threes?
all_data$third_col[325:375] <- sample(250:750, 51, replace=TRUE)

begs <- seq(  1, 2000, 100)
ends <- seq(100, 2000, 100)
i <- 1

for(i in seq_along(begs)) {
    message(i)
    file_name <- paste("file_",
                       gsub(" ", "0", format(i, width=2)),
                       ".csv",
                       sep="")
    write.csv(all_data[begs[i]:ends[i],], file_name, row.names=FALSE)
}
    

pander(dir())
