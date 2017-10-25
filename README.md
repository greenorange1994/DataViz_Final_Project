# Do Expensive Restaurants Really Provide More Satisfying Food? 
Presentation Dashboard
----------------------
http://rpubs.com/greenorange1996/271894

Pittsburgh Restaurants Recommendation System
----------------------
https://greenorange1994.shinyapps.io/Shiny/

Team members
------------
greenorange1994  

Chuyue Zhang  

Tia Wang  

Abstract
--------
●	Statistical analysis  

  ○	Demonstrate basic information of restaurants and customers in the two cities, and make comparisons in various aspects, including ratings, prices, and the number of restaurants with different types of cuisines.  
  
  ○	Expect to find the pattern of eating-out behaviour, such as whether more expensive restaurants have higher ratings.  
  
  ○	Use ggplot2 package to show conclusions.  
  
●	Spatial analysis  

  ○	Illustrate basic distribution of restaurants, and analyses of the eating-out behavior controlling for location.  
  
  ○	From this analysis, we expect to find the real relationship between restaurant’s price and food taste controlling for the location. For example, we want to see the relationship between restaurant’s price and food taste for restaurants in the area with similar distance to the nearest subway station, or for those restaurants in the same functional area such as business zone or neighbourhood around university.  
  
  ○	Use tmap or ggmap to demonstrate results.  
  
●	Text analysis  

  ○	Implement text mining techniques to find the main context of the review: whether the review focuses on the food or on other things, such as eating environment and services. If the reviews do not focus on food, we would suggest that consumers give high ratings to this restaurant not because of food.  
  
  ○	Implement sentiment analysis to find the rate of good reviews for every expensive restaurant. Compare it with real ratings to calculate the difference between expected ratings from reviews and real ratings.  
  
  ○	Use qdap, snowballc and other packages to clean reviews and word cloud or ggplot2 to show the frequency of keywords for different kinds of restaurants and differences between expected ratings and real ratings.  
  
●	Interactive display  

  ○	Make the plots drew in the above sections interactive. 

Data
----
●	Pittsburgh Yelp data from the Yelp Challenge Dataset (https://www.yelp.com/dataset_challenge)  

●	Pittsburgh Lightrail/Neighborhood Map Data (http://pittsburghpa.gov/dcp/gis/gis-data-new)

●	Pittsburgh Crime Data (http://old.post-gazette.com/neigh_city/20030730crimedatapart1p9.asp)

● Postive and Negative Words Dictionaries From Homework 3


