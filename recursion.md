[Click here to return to the main README file.](./README.md)

Introduction
------------

Nobody tried to solve the challenge using a recursive methodology. A
recursive function is a function which calls itself. Thus, it iterates
over the data like a `for` loop. This methodology is slightly more
complext, but it is better if the import process is complicated.

One big advantage is that it is easier to test a function than it is a
loop.

    ## Init ------------------------------------------------------------------------
    library(readr)   ## Replaces read.csv with read_csv (faster).
    ## It is best practive to delete an abject before trying to aned to it.
    if (exists("foo_data")) rm(foo_data)

    ## Vector of CSV files from data/ ----------------------------------------------
    ## NOTE: full.names is your friend! Makes life easier.
    csv_files <- dir("data/", pattern="csv", full.names = TRUE)

    ## Note: It is not necessary to create a blank data.frame with this method.

    ## Imports the CSV data --------------------------------------------------------

    ## This is the recursive function which imports the CSV data.
    ## Lines that start with #' are function documentation.

    #' concatenate
    #'
    #' A simple function which imports all of the CSV files in "data/" and
    #' concatenates them together.
    #'
    #' @param csv_files A vector with all of the CSV files in "data".
    #' @param i Our iterator parameter.
    #' @return A concatenated data.frame.
    #' 
    concatenate <- function(csv_files, i) {
        ## Creates a temporary place to put the imported data from file i.
        temp <- read_csv(csv_files[i])
        if (i < length(csv_files)) {
            ## If i < the number of CSV files, we recursively call the function
            ## again, and brind it to the file we just imported above.
            foo_data <- rbind(concatenate(csv_files, i+1), temp)
            return(foo_data)
        } else {
            ## This only happens for the last file.
            return(temp)
        }
    } ## End concatenate()

    ## Uses the function -----------------------------------------
    ## This function iterates of each file in each son drenched beauty.
    foo_data <- concatenate(csv_files, 1)

This is a good technique to master. Although this example is a little
arbitrary, there are situations where the complexity introduced by this
approach *are* well worth the additional time and effort.

The Results
-----------

    print(paste("We imported", nrow(foo_data), "rows of data.", sep=" "))

    ## [1] "We imported 2000 rows of data."

    str(foo_data)

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    2000 obs. of  5 variables:
    ##  $ first_col : int  62 36 92 51 19 21 27 47 47 31 ...
    ##  $ second_col: int  427 212 326 361 381 277 460 110 257 280 ...
    ##  $ third_col : int  586 10 956 680 913 23 108 284 600 942 ...
    ##  $ fourth_col: chr  "Alpaca" "Guinea Pig" "Goat" "Sheep" ...
    ##  $ fifth_col : chr  "j" "f" "o" "m" ...
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
