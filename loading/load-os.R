# load os data
ogrListLayers("data/ordsurv/data/n.mdb")
os <- readOGR("data/ordsurv/allshp/", "allNoPath")

os.dbf <- read.dbf("data/ordsurv/allshp/allshp.dbf")
summary(os.dbf)
length(which(os.dbf$DescTerm == "Footpath")) / nrow(os.dbf)

# analysis
library(rgeos)
gLength(os) / 1000 # ~5000 km cycle paths

# subset by zone + add to la dataset on topic
proj4string(ps) <- CRS("+init=epsg:4326")
osm <- spTransform(ps, CRSobj=CRS("+init=epsg:27700"))
bbox(osm)

gLength(osm) / 1000
