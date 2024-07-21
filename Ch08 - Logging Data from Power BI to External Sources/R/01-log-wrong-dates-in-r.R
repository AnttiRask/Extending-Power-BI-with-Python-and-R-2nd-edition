library(dplyr)
library(readr)

dataset %>%
    filter(isDateValidFromRegex == 0) %>%
    write_csv(
        "C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch08 - Logging Data from Power BI to External Sources/R/wrong-dates.csv",
        eol = '\r\n'
    )

df <- dataset %>%
    filter(isDateValidFromRegex == 1)