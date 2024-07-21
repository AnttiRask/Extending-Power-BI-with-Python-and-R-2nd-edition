source("secret.R")

library(DBI)
library(odbc)
library(stringr)

# Connect to your SQLExpress instance using the Windows Authentication
conn <- dbConnect(
  odbc(), 
  server             = r'{.}',
  database           = 'SystemsLogging', 
  trusted_connection = 'yes',
  driver             = '{ODBC Driver 17 for SQL Server}'
)

# You can also connect to it using the SQL Authentication for the 'sa' user if you prefer
# conn <- dbConnect(
#   odbc(),
#   server   = r'{.}',
#   database = 'SystemsLogging',
#   uid      = .UID_EXPRESS,
#   pwd      = .PWD,
#   driver   = '{ODBC Driver 17 for SQL Server}'
# )

# Read and show some information about databases using a system view
data <- dbGetQuery(conn, "SELECT database_id, name FROM sys.databases")
head(data)

# Disconnect from your SQLExpress instance
dbDisconnect(conn)

# Connect to your Azure SQL Database
conn <- dbConnect(
  odbc(),
  server   = str_glue("{.SERVER_AZURE}.database.windows.net"),
  database = 'SystemsLogging',
  uid      = .UID_AZURE,
  pwd      = .PWD,
  driver   = '{ODBC Driver 17 for SQL Server}'
)

# Read and show some information about databases on the Azure SQL server using a system view
data <- dbGetQuery(conn, "SELECT database_id, name FROM sys.databases")
head(data)

# Get data from sample SalesLT.Customers
customers_df <- dbGetQuery(conn, "SELECT TOP 10 CustomerID AS UserId, EmailAddress AS Email FROM SalesLT.Customer")

# Write customers_df data into the existing WrongEmails table
dbAppendTable(conn, name = 'WrongEmails', value = customers_df)

# Get the data from the WrongEmails table and show it
df <- dbGetQuery(conn, "SELECT TOP 10 UserId, Email FROM WrongEmails")
head(df)

# Now let's empty the WrongEmails table
dbSendQuery(conn, "TRUNCATE TABLE WrongEmails")

# Close the connection
dbDisconnect(conn)
