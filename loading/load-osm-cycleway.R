# loading osm cycleways shapefile
library(rgdal)
osm_cyway <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/osm/", "cycleways")
proj4string(osm_cyway)
cycleway <- spTransform(osm_cyway, CRSobj = CRS("+init=epsg:27700"))
gLength(cycleway) / 1000000
