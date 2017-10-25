library(readxl)
library(shiny)
library(leaflet)
library(WDI)
library(tidyr)
library(dplyr)
library(xts)
library(dygraphs)
library(RColorBrewer)

# Turn off scientific notation
options(scipen=999)

pit <- readRDS("new_pit")

#names(lookup) <- c("a", "b", "c", "d", "e", "f")

# Lookup variable names / descriptions
lookup_list_price <- as.list(c("$", "$$", "$$$", "$$$$"))
lookup_list_environment <- as.list(unique(pit$noise))
lookup_list_parking <- as.list(unique(pit$parking))
lookup_list_cuisine <- as.list(unique(pit$cuisine))

## Get map data and merge to WDI data
# Set up the data
#pit_shape <- readOGR(dsn = "map/Pittsburgh_Neighborhoods.geojson", layer = "OGRGeoJSON")

# get required restaurants
filter_rest <- function(r_price, r_environment, r_parking, r_cuisine) {
  r_price_num <- nchar(r_price)
  new_pit <- filter(pit, price == r_price_num & noise == r_environment & parking == r_parking & cuisine == r_cuisine)
  levels(new_pit$class) <- c("Disappointed :(", "Not Bad", "Recommend", "More than Expected :)")
  new_pit
}