import pandas as pd
import pickle
import os


project_folder          = "Ch05 - Importing Unhandled Data Objects/importing-pkl-files/"

deserialized_plots_dict = pickle.load( open(os.path.join(project_folder, "nested_population_plots_dict.pkl"), "rb") )

selected_country        = "Italy"

fig_handle = deserialized_plots_dict[selected_country]
fig_handle.show()
