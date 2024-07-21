library(dplyr)
library(geosphere)
library(purrr)
library(readr)
library(readxl)
library(tidyr)

airportLongLatVec <- function(df, iata) {
    ret_vec <- df %>% 
        filter(iata_code == iata) %>% 
        select(longitude, latitude) %>% 
        unlist()
    
    return(ret_vec)
}

hotels_tbl <- read_xlsx("C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch12 - Calculating Columns Using Complex Algorithms, Distances/hotels-ny.xlsx")
hotels_tbl

airports_tbl <- read_csv("C:/R/Extending-Power-BI-with-Python-and-R-2nd-edition/Ch12 - Calculating Columns Using Complex Algorithms, Distances/airport-codes.csv")
airports_tbl

# Coordinates are saved as a string, so we have to split them into two new columns
airports_tbl_separated <- airports_tbl %>% 
    separate_wider_delim(
        cols        = coordinates,
        delim       = ", ",
        names       = c("longitude", "latitude"),
        cols_remove = TRUE
    ) %>% 
    mutate(
        longitude = as.numeric(longitude),
        latitude  = as.numeric(latitude)
    )

jfk_coordinates <- airportLongLatVec(airports_tbl_separated, "JFK")
lga_coordinates <- airportLongLatVec(airports_tbl_separated, "LGA")

# Using the Mean (spherical) earth radius R1 (in meters) as the default in the PyGeodesy Python package
# (reference: https://en.wikipedia.org/wiki/Earth_radius#Published_values)
hotels_tbl_mutated <- hotels_tbl %>%
    mutate(
        p1                       = map2(longitude, latitude, ~ c(.x, .y)),
        haversineDistanceFromJFK = map_dbl(p1, ~ distHaversine(p1 = .x, p2 = jfk_coordinates, r = 6371008.771415)),
        karneyDistanceFromJFK    = map_dbl(p1, ~ distGeo(p1 = .x, p2 = jfk_coordinates)),
        haversineDistanceFromLGA = map_dbl(p1, ~ distHaversine(p1 = .x, p2 = lga_coordinates, r = 6371008.771415)),
        karneyDistanceFromLGA    = map_dbl(p1, ~ distGeo(p1 = .x, p2 = lga_coordinates))
    ) %>%
    select(-p1)

hotels_tbl_mutated
