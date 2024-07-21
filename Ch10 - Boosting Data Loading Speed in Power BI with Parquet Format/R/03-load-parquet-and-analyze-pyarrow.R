library(arrow)
library(dplyr)
library(tictoc)

main_path <- "D:/R/AirOnTimeParquetArrowR"
ds        <- open_dataset(main_path, format = "parquet")

tic()
mean_dep_delay_df <- ds %>% 
    select(YEAR, MONTH, DAY_OF_MONTH, ORIGIN, DEP_DELAY) %>%
    summarise(
        DEP_DELAY = max(DEP_DELAY, na.rm = TRUE),
        .by       = c(YEAR, MONTH, DAY_OF_MONTH, ORIGIN)
    ) %>%
    collect()
toc()

head(mean_dep_delay_df, 10)

tic()
mean_dep_delay_1999_2000_df <- ds %>% 
    select(YEAR, MONTH, DAY_OF_MONTH, ORIGIN, DEP_DELAY) %>% 
    filter(YEAR %in% c(1999, 2000)) %>%
    summarise(
        DEP_DELAY = max(DEP_DELAY, na.rm = TRUE),
        .by       = c(YEAR, MONTH, DAY_OF_MONTH, ORIGIN)
    ) %>% 
    collect()
toc()

head(mean_dep_delay_1999_2000_df, 10)

main_partitioned_path <- "D:/R/AirOnTimeParquetPartitionedArrowR"
partitioned_ds        <- open_dataset(main_partitioned_path, format = "parquet", partitioning = hive_partition())

tic()
mean_dep_delay_1999_2000_partitioned_df <- partitioned_ds %>%
    select(YEAR, MONTH, DAY_OF_MONTH, ORIGIN, DEP_DELAY) %>%
    filter(YEAR %in% c(1999, 2000)) %>%
    summarise(
        DEP_DELAY = max(DEP_DELAY, na.rm = TRUE),
        .by       = c(YEAR, MONTH, DAY_OF_MONTH, ORIGIN)
    ) %>% 
    collect()
toc()

head(mean_dep_delay_1999_2000_partitioned_df, 10)
