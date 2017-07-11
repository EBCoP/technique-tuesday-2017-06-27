[Click here to return to the main README file.](./README.md)

Introduction
------------

I am happy to report that I received ZERO entries written this way. That
is good, since any such approach fails to achieve any level of
abstraction. And although it is possible to do this with 20 files (see
below), it would be ridiculous to implement this approach with 200 files
and only a mad-man would try to apply this approach to 2,000 files or
more. That said, it is straightforward and if you are unfamiliar with
importing CSV files into R, this code and will introduce a few commands
we will use later.

The Code
--------

    ## Init ------------------------------------------------------------------------
    library(dplyr)
    library(readr)

    ## Imports Data ----------------------------------------------------------------
    ## Each of the following lines of code produces the same output, telling you
    ## how readr imported the data. This is the expected behavior, but I have
    ## suppressed it here.
    foo_data_01 <- read_csv("data/file_01.csv")
    foo_data_02 <- read_csv("data/file_02.csv")
    foo_data_03 <- read_csv("data/file_03.csv")
    foo_data_04 <- read_csv("data/file_04.csv")
    foo_data_05 <- read_csv("data/file_05.csv")
    foo_data_06 <- read_csv("data/file_06.csv")
    foo_data_07 <- read_csv("data/file_07.csv")
    foo_data_08 <- read_csv("data/file_08.csv")
    foo_data_09 <- read_csv("data/file_09.csv")
    foo_data_10 <- read_csv("data/file_10.csv")
    foo_data_11 <- read_csv("data/file_11.csv")
    foo_data_12 <- read_csv("data/file_12.csv")
    foo_data_13 <- read_csv("data/file_13.csv")
    foo_data_14 <- read_csv("data/file_14.csv")
    foo_data_15 <- read_csv("data/file_15.csv")
    foo_data_16 <- read_csv("data/file_16.csv")
    foo_data_17 <- read_csv("data/file_17.csv")
    foo_data_18 <- read_csv("data/file_18.csv")
    foo_data_19 <- read_csv("data/file_19.csv")
    foo_data_20 <- read_csv("data/file_20.csv")

    ## Combines Data ---------------------------------------------------------------
    ## Because foo_data is created by combining other objects,
    ## it is a good idea to delete it before creating it,
    ## especially since we are probably using this code in an
    ## interactive session.
    if (exists("foo_data")) rm(foo_data)
    foo_data <- rbind(foo_data_01, foo_data_02, foo_data_03,
                      foo_data_04, foo_data_05, foo_data_06,
                      foo_data_07, foo_data_08, foo_data_09,
                      foo_data_10, foo_data_11, foo_data_12,
                      foo_data_13, foo_data_14, foo_data_15,
                      foo_data_16, foo_data_17, foo_data_18,
                      foo_data_19, foo_data_20)

As you can see, this approach is entirely manual. This technique works well
for a mall number of flies, but becomes unwieldly as the number of files
increases.

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

\*\* Note:\*\* It is possible to combine the `read_csv` and `rbind`
commands in a single composed command. That said, I believe separating
out the stwo steps is helpful to understand how this works and why it is
inefficient.

[Click here to return to the main README file.](./README.md)
