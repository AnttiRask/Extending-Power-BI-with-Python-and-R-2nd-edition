library(dplyr)
library(writexl)

wrong_emails_df <- dataset %>%
    filter(isEmailValidFromRegex == 0) %>%
    select(UserId, Email)

wrong_dates_df <- dataset %>%
    filter(isDateValidFromRegex == 0) %>%
    select(UserId, BannedDate)

df_named_lst <- list("Wrong emails" = wrong_emails_df, "Wrong dates" = wrong_dates_df)

# write.xlsx(df_named_lst, file = "C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch08 - Logging Data from Power BI to External Sources/R/wrong-data.xlsx")
write_xlsx(df_named_lst, path = "C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch08 - Logging Data from Power BI to External Sources/R/wrong-data.xlsx")

# Keep only rows having valid email and ban date
df <- dataset %>%
    filter(isEmailValidFromRegex == 1 & isDateValidFromRegex == 1)
