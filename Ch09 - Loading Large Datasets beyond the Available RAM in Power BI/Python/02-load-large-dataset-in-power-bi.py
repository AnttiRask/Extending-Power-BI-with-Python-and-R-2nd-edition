import os
import pandas as pd
import dask.dataframe as dd

main_path = 'D:\R\AirOnTimeCSV'

ddf = dd.read_csv(
    os.path.join(main_path, 'airOT*.csv'),                 
    encoding = 'latin-1',
    usecols  = ['YEAR', 'MONTH', 'DAY_OF_MONTH', 'ORIGIN', 'DEP_DELAY']
)

mean_dep_delay_ddf = ddf.groupby(['YEAR', 'MONTH', 'DAY_OF_MONTH','ORIGIN'])[['DEP_DELAY']].mean().reset_index()

mean_dep_delay_df = mean_dep_delay_ddf.compute()

mean_dep_delay_df.to_csv(r'C:\R\Extending-Power-BI-with-Python-and-R-2nd-edition\Ch09 - Loading Large Datasets beyond the Available RAM in Power BI\Python\mean_dep_delay_df.csv', index=False)
