library(arrow)
library(dplyr)
library(tictoc)

main_path  <- "D:/R/AirOnTimeCSV"
ds         <- open_dataset(main_path, format = "csv")

tic()
mean_dep_delay_df <- ds %>% 
  select(YEAR, MONTH, DAY_OF_MONTH, ORIGIN, DEP_DELAY) %>% 
  filter(YEAR %in% c(1999, 2000)) %>% 
  summarise(
      DEP_DELAY = max(DEP_DELAY, na.rm = TRUE),
      .by       = c(YEAR, MONTH, DAY_OF_MONTH, ORIGIN)
  ) %>% 
  collect()
toc()

head(mean_dep_delay_df, 10)
