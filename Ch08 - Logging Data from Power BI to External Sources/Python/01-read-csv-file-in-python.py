# %%
import csv

with open(r'C:\R\Extending-Power-BI-with-Python-and-R-2nd-edition\Ch08 - Logging Data from Power BI to External Sources\example.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    row_index = 0
    for row in csv_reader:
        if row_index == 0:
            print(f'Column names: {", ".join(row)}')
            row_index += 1
        else:
            print(f'\tRow {row_index+1}: {", ".join(row)}')
            row_index += 1
    print(f'\r\nProcessed {row_index} lines.')
