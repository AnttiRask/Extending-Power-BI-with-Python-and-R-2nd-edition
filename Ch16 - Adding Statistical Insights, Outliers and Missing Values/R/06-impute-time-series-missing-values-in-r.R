library(dplyr)
library(forecast)
library(ggpubr)
library(imputeTS)
library(lubridate)
library(missForest)
library(purrr)
library(vctrs)

air_df <- read.csv('https://bit.ly/airpassengers')

# Create 10% of missing values in the vector
set.seed(57934)
value_missing <- prodNA(air_df['value'], noNA = 0.1)

# Force a larger gap in the vector
value_missing[67:68,] <- NA

# Add the vector with missing values to the dataframe
air_missing_df <- air_df %>% 
    mutate(date = ymd(date)) %>% 
    rename(complete = value) %>% 
    bind_cols(value = value_missing)

air_missing_df

# Highlight missing regions
ggplot_na_distribution(air_missing_df$value)

# Get more complete details about missing values
statsNA(air_missing_df$value)

#-- LOCF imputation ----
air_missing_df$locf <- na_locf(air_missing_df$value)
ggplot_na_imputations( air_missing_df$value, air_missing_df$locf)

#-- NOCB imputation ----
air_missing_df$nocb <- na_locf(air_missing_df$value, option = 'nocb')
ggplot_na_imputations( air_missing_df$value, air_missing_df$nocb)

#-- EWMA imputation ----

# Define the values of k that you want to iterate over
k_values <- c(1, 2, 3, 6, 9)

# Use purrr::map() to apply na_ma() for each k value
results <- map(k_values, ~ na_ma(air_missing_df$value, k = .x, maxgap = 3))

# Assign the results back to air_missing_df with appropriate column names
names(results) <- paste0("ewma_", k_values)
ewma_df        <- as_tibble(results)

# Combine the original dataframe with the ewma columns
air_missing_df <- bind_cols(air_missing_df, ewma_df)
air_missing_df

ggplot_na_imputations(air_missing_df$value, air_missing_df$ewma_3)
ggplot_na_imputations(air_missing_df$value, air_missing_df$ewma_9)

#-- LINEAR imputation ----
air_missing_df$linear <- na_interpolation(air_missing_df$value, option = 'linear', maxgap = 3)
ggplot_na_imputations(air_missing_df$value, air_missing_df$linear)

#-- SPLINE imputation ----
air_missing_df$spline <- na_interpolation(air_missing_df$value, option = 'spline', maxgap = 3)
ggplot_na_imputations(air_missing_df$value, air_missing_df$spline)

#-- Seasonally Decomposed imputation ----
air_missing_df$seadec <- na_seadec(air_missing_df$value, find_frequency = TRUE, maxgap = 3)
ggplot_na_imputations(air_missing_df$value, air_missing_df$seadec)

#-- Accuracy ----

# Create a list of column names to iterate over
strategy <- c("locf", "nocb", "ewma_1", "ewma_2", "ewma_3", "ewma_6", "ewma_9", "linear", "spline", "seadec")

# Use map() to iterate over the strategy vector and create a list of tibbles with accuracy results
accuracy_list <- map(
    strategy, ~ {
        # Calculate accuracy for the given strategy
        accuracy(air_missing_df[[.x]], x = air_missing_df$complete) %>%
            # Convert to a tibble
            as_tibble() %>% 
            # Add the strategy column
            mutate(strategy = .x)
    }
)

# Combine all the individual tibbles into one dataframe using list_rbind()
acc_tbl <- list_rbind(accuracy_list) %>% 
    # Reorder columns so that 'strategy' appears first
    select(strategy, everything())

# The minimum error is given by the seadec strategy
acc_tbl

# Best imputed values vs ground truth
p_spline <- ggplot_na_imputations(
    x_with_na          = air_missing_df$value,
    x_with_imputations = air_missing_df$spline,
    x_with_truth       = air_missing_df$complete,
    title              = 'Imputed Values with Spline',
    subtitle           = ''
)

p_seadec <- ggplot_na_imputations(
    x_with_na          = air_missing_df$value,
    x_with_imputations = air_missing_df$seadec,
    x_with_truth       = air_missing_df$complete,
    title              = 'Imputed Values with Seadec',
    subtitle           = ''
)

figure <- ggarrange(
    p_spline,
    p_seadec,
    #labels = c("Spline", "Seadec"),
    ncol = 1,
    nrow = 2
)

figure


