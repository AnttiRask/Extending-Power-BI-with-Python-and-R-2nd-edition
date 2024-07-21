source("secret.R")

library(DBI)
library(dplyr)
library(odbc)
library(stringr)

# Connect to your Azure SQL Database
conn <- dbConnect(
    odbc(),
    server   = str_glue("{.SERVER_AZURE}.database.windows.net"),
    database = 'SystemsLogging',
    uid      = .UID_AZURE,
    pwd      = .PWD,
    driver   = '{ODBC Driver 17 for SQL Server}'
)

# Let's empty the WrongEmails table
dbSendQuery(conn, "TRUNCATE TABLE WrongEmails")

# Get wrong emails from the data loaded from the Excel
wrong_emails_df <- dataset %>%
    filter(isEmailValidFromRegex == 0) %>%
    select(UserId, Email)

# Write wrong_emails_df data into the existing WrongEmails table
dbAppendTable(conn, name = 'WrongEmails', value = wrong_emails_df)

# Close the connection
dbDisconnect(conn)

# Keep only rows having valid email and ban date
df <- dataset %>%
    filter(isEmailValidFromRegex == 1)