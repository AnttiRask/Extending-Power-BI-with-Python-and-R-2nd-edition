
library(dplyr)
library(ggplot2)
library(mice)
library(miceadds)

# Function to calculate the matrix correlation of a numeric dataframe
# also imputing missing values with MICE in a dataframe
corr_impute_missing_values <- function(df, m = 5, variables, method = c('pearson', 'spearman')) {
  
  method <- method[1]
  
  df_imp_lst <- mice(df, m = m, printFlag = FALSE)
  
  corr_tbl <- micombine.cor(df_imp_lst, variables = variables,
                            method = method) %>% 
    as_tibble() %>% 
    arrange( variable1, variable2 )
  
  return( corr_tbl )
}

# # Used for debugging purposes
# dataset <- readr::read_csv('http://bit.ly/titanic-dataset-csv')

# Loading data
tbl <- dataset %>% as_tibble()

# As the 77% of Cabin column's values is null, the Cabin column will be removed
# Let's remove also the Name and Ticket columns, as they have too much distinct values
# Let's also keep only numeric variables
tbl_cleaned <- tbl %>% 
  select( -Cabin, -Name, -Ticket ) %>% 
  mutate(
    Survived = as.factor(Survived),
    Sex = as.factor(Sex),
    Embarked = as.factor(Embarked)
  )

# Get the indexes of numeric columns
numeric_col_idxs <- which(sapply(tbl_cleaned, is.numeric))

# Calculate the correlation tibble for numeric variables using the Pearson method
# Also the Spearman method is implemented
corr_tbl <- corr_impute_missing_values(tbl_cleaned, variables = numeric_col_idxs,
                                       method = 'pearson')
