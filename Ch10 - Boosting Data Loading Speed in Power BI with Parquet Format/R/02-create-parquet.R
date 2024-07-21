library(arrow)
library(dplyr)
library(tictoc)

getFilePathsFromFolder <- function(directory_path) {
    # Get a list of file paths in the directory with the .csv extension
    files      <- list.files(directory_path, full.names = TRUE)
    file_paths <- files[grep("\\.csv$", files, ignore.case = TRUE)]
    
    return(file_paths)
}

main_path      <- "D:/R/AirOnTimeCSV"
to_append_path <- "D:/R/AirOnTimeCSVtoAppend"

file_paths           = getFilePathsFromFolder(main_path)
to_append_file_paths = getFilePathsFromFolder(to_append_path)

ds          <- open_dataset(c(file_paths, to_append_file_paths), format = "csv")
output_path <- "D:/R/AirOnTimeParquetArrowR"

tic()
ds %>% 
    select(YEAR, MONTH, DAY_OF_MONTH, ORIGIN, DEP_DELAY) %>% 
    write_dataset(path = output_path, format = 'parquet')
toc()

output_partitioned_path <- "D:/R/AirOnTimeParquetPartitionedArrowR"

tic()
ds %>% 
    select(YEAR, MONTH, DAY_OF_MONTH, ORIGIN, DEP_DELAY) %>% 
    write_dataset(
        path         = output_partitioned_path,
        format       = 'parquet',
        partitioning = 'YEAR'
    )
toc()