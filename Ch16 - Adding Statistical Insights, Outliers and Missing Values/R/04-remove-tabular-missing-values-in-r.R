library(dplyr)
library(readr)

dataset_url <- 'http://bit.ly/titanic-dataset-csv'

tbl <- read_csv(dataset_url)

tbl_num <- tbl %>%
  select(where(is.numeric))

# Listwise deletion
cor(tbl_num, method = 'pearson', use = 'complete.obs')

# Pairwise deletion
cor(tbl_num, method = 'pearson', use = 'pairwise.complete.obs')
