library(shiny)
library(leaflet)
library(RColorBrewer)
library(dplyr)
library(dygraphs)

source('setup.R')

brewer_df <- brewer.pal.info

brewer_df$colors <- row.names(brewer_df)

sub <- dplyr::filter(brewer_df, category == "div" | category == "seq")

color_picker <- sub$colors

shinyUI(
  fluidPage(
    tags$head(includeCSS("styles.css")),
    fixedPanel(
      id = "fullscreen", 
      top = 0, left = 0, width = "100%", height = "100%", 
      leafletOutput("pit_map", width = "100%", height = "100%")
    ), 
    absolutePanel(id = "controls", draggable = FALSE, 
               top = 10, right = 10, width = 500, height = "auto", 
               h4("Pittsburgh Restaurants Recommendation System"), 
    tabsetPanel(
      tabPanel("Controls", 
               selectInput('price', 'Price Level', lookup_list_price, 
                           selected = '$$'), 
               selectInput('environment', 'Environment', lookup_list_environment, 
                           selected = 'average'), 
               selectInput('parking', 'Parking Service', lookup_list_parking, 
                           selected = 'lot'), 
               selectInput('cuisine', 'Style', lookup_list_cuisine, 
                           selected = 'American'))
  ))
)
)