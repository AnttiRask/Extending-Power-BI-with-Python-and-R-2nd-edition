import pandas as pd

data = {
    'Col1' : ['A', 'B', 'C,D', 'E"F', 'G\r\nH'],
    'Col2' : [23, 27, 18, 19, 21],
    'Col3' : [3.5, 4.8, 2.1, 2.5, 3.1]
}

data_df = pd.DataFrame(data)

data_df.to_excel(r'C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch08 - Logging Data from Power BI to External Sources/Python/example-write.xlsx', index = False, engine='openpyxl')
