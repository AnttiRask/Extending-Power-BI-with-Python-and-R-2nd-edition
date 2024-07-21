library(arrow)
library(dplyr)
library(readr)

main_path <- "D:/R/AirOnTimeCSV"
ds        <- open_dataset(main_path, format = "csv")

mean_dep_delay_df <- ds %>%
    select(YEAR, MONTH, DAY_OF_MONTH, ORIGIN, DEP_DELAY) %>%
    summarize(
        DEP_DELAY = mean(DEP_DELAY, na.rm = TRUE),
        .by       = c(YEAR, MONTH, DAY_OF_MONTH, ORIGIN)
    ) %>%
    collect()

write_csv(
    mean_dep_delay_df,
    file = "C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch09 - Loading Large Datasets beyond the Available RAM in Power BI/R/mean_dep_delay_df.csv",
    eol  = "\r\n"
)