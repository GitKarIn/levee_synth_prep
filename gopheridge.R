# plot the locations of the gopheridge pedons with R
# 
# Steps:
# 1) create and inspect an sf data.frame object
# 2) plot the data with mapview

# load libraries
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

# create interactive map with sfc_POINT object
#  use site_id in sf data.frame as labels
mapview(gopher.locations, label = gopher.locations$site_id)