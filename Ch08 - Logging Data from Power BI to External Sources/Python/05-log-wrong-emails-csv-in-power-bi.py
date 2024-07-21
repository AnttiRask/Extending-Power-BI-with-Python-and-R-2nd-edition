import pandas as pd

filter = (dataset['isEmailValidFromRegex'] == 0)

dataset[filter].to_csv(r'C:\R\Extending-Power-BI-with-Python-and-R-2nd-edition\Ch08 - Logging Data from Power BI to External Sources\Python\wrong-emails.csv', index=False)

df = dataset[~filter]
