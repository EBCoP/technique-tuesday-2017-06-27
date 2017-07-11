[Click here to return to the main README file.](./README.md)

Introduction
------------

This was *by far* the most popular solution. An iterative approach is a
form of a loop, which loops over a vector. Examples include `for` loops
and `while` loops. Although old-school R programmers will cluck their
tongues when confronted with iterative solutions, it is a method that is
familiar to anyone with any programming experience.

    ## Init ------------------------------------------------------------------------
    library(readr)   ## Replaces read.csv with read_csv (faster).

    ## Vector of CSV files from data/ ----------------------------------------------
    ## NOTE: full.names is your friend! Makes life easier.
    csv_files <- dir("data/", pattern="csv", full.names = TRUE)

    ## Creates an empty data frame -------------------------------------------------
    ## It is best practice to delete an object before trying to apend to it.
    if (exists("foo_data")) rm(foo_data)
    ## The code below instantiates a data.frame called foo_data. You do not have to
    ## define the column types. They will all be NULL and NA, which can be combined,
    ## logically, with everything.
    foo_data <- data.frame()

    ## Imports the CSV data --------------------------------------------------------
    ## This will return a lot of feedback from R, telling you the column
    ## specifications (format) chosen by R for each file.
    ## The defaults are fine.
    ## Because we already have a null object (foo_data), we can start rbinding
    ## immediately.
    for(i in seq_along(csv_files)) {
                foo_data <- rbind(foo_data, read_csv(csv_files[i]))
    }

The Results
-----------

    print(paste("We imported", nrow(foo_data), "rows of data.", sep=" "))

    ## [1] "We imported 2000 rows of data."

    str(foo_data)

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    2000 obs. of  5 variables:
    ##  $ first_col : int  20 24 96 50 44 26 43 31 42 44 ...
    ##  $ second_col: int  275 24 189 194 21 180 7 482 65 315 ...
    ##  $ third_col : int  607 182 452 667 947 841 157 238 277 888 ...
    ##  $ fourth_col: chr  "Cat" "Gecko" "Hamster" "Iguana" ...
    ##  $ fifth_col : chr  "a" "q" "d" "c" ...
    ##  - attr(*, "spec")=List of 2
    ##   ..$ cols   :List of 5
    ##   .. ..$ first_col : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ second_col: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ third_col : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ fourth_col: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ fifth_col : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   ..$ default: list()
    ##   .. ..- attr(*, "class")= chr  "collector_guess" "collector"
    ##   ..- attr(*, "class")= chr "col_spec"

[Click here to return to the main README file.](./README.md)
