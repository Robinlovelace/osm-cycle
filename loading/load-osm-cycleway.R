# loading osm cycleways shapefile
library(rgdal)
osm_cyway <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/osm/", "cycleways")
proj4string(osm_cyway)
cycleway <- spTransform(osm_cyway, CRSobj = CRS("+init=epsg:27700"))
gLength(cycleway) / 1000000

# Loading files via osmar
library(osmar)
help(package = "osmar")
src <- osmsource_osmosis(file="/media/SAMSUNG/data/osm//b-highways.osm")
library(ggmap)
library(raster)
source("~/Dropbox/configs/r-scripts/ggmap_rast.R")
uk <- ggmap(get_map(location = "UK", zoom = 5))
ukr <- ggmap_rast(map = get_map(location = "UK", zoom = 5))
b <- bbox(ukr)

bh <- get_osm(x = b , src)
plot(potter)