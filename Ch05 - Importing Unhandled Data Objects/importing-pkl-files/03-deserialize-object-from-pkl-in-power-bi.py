import pandas as pd
import pickle
import os


project_folder = "C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch05 - Importing Unhandled Data Objects/importing-pkl-files"

deserialized_dict = pickle.load( open(os.path.join(project_folder, "nested_population_dict.pkl"), "rb") )

sweden_population_df = deserialized_dict['Sweden']
