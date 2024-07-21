import os
import dask.dataframe as dd
from dask.diagnostics import ProgressBar

# Get the path to the folder containing all the CSV files
# (update it according to your folders structure)
main_path = os.path.join('D:\\', 'R', 'AirOnTimeCSV')

ddf = dd.read_csv(
    os.path.join(main_path, 'airOT*.csv'),
    encoding = 'latin-1',
    usecols  = ['YEAR', 'MONTH', 'DAY_OF_MONTH', 'ORIGIN', 'DEP_DELAY']
)

with ProgressBar():
    ddf.to_parquet(
        path      = 'D:\\R\\AirOnTimeParquetDask',
        overwrite = True
    )

to_append_main_path = os.path.join('D:\\', 'R', 'AirOnTimeCSVtoAppend')

to_append_ddf = dd.read_csv(
    os.path.join(to_append_main_path, 'airOT*.csv'),
    encoding = 'latin-1',
    usecols  = ['YEAR', 'MONTH', 'DAY_OF_MONTH', 'ORIGIN', 'DEP_DELAY']
)

with ProgressBar():
    to_append_ddf.to_parquet(
        path   = 'D:\\R\\AirOnTimeParquetDask',
        append = True
    )

with ProgressBar():
    ddf.to_parquet(
        path         = 'D:\\R\\AirOnTimeParquetPartitionedDask',
        partition_on = ['YEAR'],
        overwrite    = True
    )

with ProgressBar():
    to_append_ddf.to_parquet(
        path         = 'D:\\R\\AirOnTimeParquetPartitionedDask',
        partition_on = ['YEAR'],
        append       = True
    )
