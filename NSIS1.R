library(aqp)
library(soilDB)
library(sf)
library(mapview)



# this creates sample gopheridge object in your environment
data("gopheridge", package = "soilDB")

# replace gopheridge object with fetchNASIS() (your data)
# gopheridge <- fetchNASIS()

# create simple features POINT geometry data.frame
# st_as_sf(): convert data.frame to spatial simple features, with points in $geometry 
# st_crs(): set EPSG:4326 Coordinate Reference System (CRS) as Well-Known Text (WKT)
gopher.locations <- st_as_sf(
  site(gopheridge), 
  coords = c('x_std','y_std'),
  crs = st_crs(4326)
)



# get pedons from the selected set
pedons <- fetchNASIS(from = 'pedons')