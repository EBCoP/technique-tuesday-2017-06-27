#' import_data
#'
#' Imports the data held in a CSV file and creates a new column called file_name.
#'
#' @param csv_file The name of the CSV file to import.
#' @return A data.frame
import_data <- function(csv_file) {
    ## I can use the read_csv from readr without using library if I just first
    ## specify the package name, followed by ::. This is commonly used in
    ## R functions and is required in R packages. This just imports a single
    ## file of data.
    data <- readr::read_csv(csv_file)

    simple_file_name <- gsub(pattern="data//", replacement="", csv_file)
    ## This adds a new column, called file_name.
    data <- dplyr::mutate(data, file_name = simple_file_name)
    return(data)
}
