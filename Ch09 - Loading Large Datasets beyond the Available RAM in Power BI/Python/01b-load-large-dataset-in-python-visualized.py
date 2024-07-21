import os
import dask.dataframe as dd

main_path = 'D:\R\AirOnTimeCSV\AirOnTimeCSVPlot'

ddf_1_month = dd.read_csv(
    os.path.join(main_path, 'airOT*.csv'),
    encoding = 'latin-1',
    usecols  = ['YEAR', 'MONTH', 'DAY_OF_MONTH', 'ORIGIN', 'DEP_DELAY']
)

mean_dep_delay_1_month_ddf = ddf_1_month.groupby(['YEAR', 'MONTH', 'DAY_OF_MONTH', 'ORIGIN'])[['DEP_DELAY']].mean().reset_index()

file_path = 'C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch09 - Loading Large Datasets beyond the Available RAM in Power BI/Python'
mean_dep_delay_1_month_ddf.visualize(filename = os.path.join(file_path, 'mean_dep_delay_1_month_dask.pdf'))
