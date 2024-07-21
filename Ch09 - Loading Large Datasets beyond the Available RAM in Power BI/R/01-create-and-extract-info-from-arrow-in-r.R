library(arrow)
library(dplyr)
library(tictoc)

main_path <- "D:/R/AirOnTimeCSV"
ds        <- open_dataset(main_path, format = "csv")

tic()
mean_dep_delay_df <- ds %>%
    select(YEAR, MONTH, DAY_OF_MONTH, ORIGIN, DEP_DELAY) %>%
    summarize(
        DEP_DELAY = mean(DEP_DELAY, na.rm = TRUE),
        .by       = c(YEAR, MONTH, DAY_OF_MONTH, ORIGIN)
    ) %>%
    collect()
toc()

dim(mean_dep_delay_df)

(create_dkf_exec_time <- end_time - start_time)

head(mean_dep_delay_df, 10)
