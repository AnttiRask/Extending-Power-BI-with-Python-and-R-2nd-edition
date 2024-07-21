# Source the secret.py file
exec(open("secret.py").read())

import pyodbc
import pandas as pd 

# Connect to your SQLExpress instance using the Windows Authentication
conn = pyodbc.connect(
    'Driver={ODBC Driver 17 for SQL Server};'
    r'Server=.;'
    'Database=master;'
    f'Uid={UID_EXPRESS};'
    f'Pwd={PWD}'
    )

# Connect to your Azure SQL Database
conn = pyodbc.connect(
    'Driver={ODBC Driver 17 for SQL Server};'
    f'Server={SERVER_AZURE}.database.windows.net;'
    'Database=SystemsLogging;'
    f'Uid={UID_AZURE};'
    f'Pwd={PWD}'
    )

# Read and show some information about databases on the Azure SQL server using a system view
data = pd.read_sql("SELECT database_id, name FROM sys.databases", conn)
data

# Disconnect from your SQLExpress instance
conn.close()

# Get data from sample SalesLT.Customers (Azure SQL Database)
data = pd.read_sql('SELECT TOP 10 CustomerID, EmailAddress FROM SalesLT.Customer', conn)
data

# Close the connection
conn.close()
