library(shiny)
library(leaflet)
library(dplyr)

source('setup.R')


shinyServer(function(input, output, session) {
  
  # Build reactive expression that takes values from the input to fetch the data
  new_pit <- reactive({filter_rest(input$price, input$environment, input$parking, input$cuisine)})
  # Attempt to draw the map 
  
  output$pit_map <- renderLeaflet({
    
    stamen_tiles <- "http://{s}.tile.stamen.com/toner-lite/{z}/{x}/{y}.png"
    
    stamen_attribution <- 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, under <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>, under <a href="http://www.openstreetmap.org/copyright">ODbL</a>.'
    
    map <- leaflet() %>%
      addTiles(urlTemplate = stamen_tiles,
               attribution = stamen_attribution) %>%
      setView(-80.0079238, 40.4403418, zoom = 12) 
    map
  })
  
  observe({
    
    pal = colorFactor("Set1", domain = new_pit()$class)
    
    color_rest <- pal(new_pit()$class)
    
    content <- paste("<strong>Ratings from yelp: </strong>", new_pit()$stars)
    
    map <- leafletProxy("pit_map", session) %>%
      clearMarkers() %>%
      clearMarkerClusters() %>%
      clearControls() %>%
      addCircleMarkers(data = new_pit(), color = color_rest, popup = content,
                       clusterOptions = markerClusterOptions()) %>%
      addLegend("bottomleft", 
                pal = colorFactor("Set1", domain = new_pit()$class), 
                values = new_pit()$class,
                title = "Recommendation Level", opacity = 1)
  })
})
  
 