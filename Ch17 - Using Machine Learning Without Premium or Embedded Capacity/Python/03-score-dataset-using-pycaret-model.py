import pandas as pd
from pycaret.classification import *
import os

main_path = "C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch17 - Using Machine Learning Without Premium or Embedded Capacity/"

# Uncomment this code if you're not using it in Power BI
# in order to load the imputed test dataset
# dataset = pd.read_csv(os.path.join(main_path, 'titanic-test.csv'), index_col=False)
# dataset

# Unserialize the PyCaret model previously trained
model = load_model("C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch17 - Using Machine Learning Without Premium or Embedded Capacity/titanic-model")

# Get model predictions for the input dataframe
predictions = predict_model(model,data = dataset,verbose=True)
predictions
