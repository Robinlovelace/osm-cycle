# load os data
library(rgdal)
library(rgeos)
# ogrListLayers("/home/georl/repos/osm-cycle/data/ordserv/n.mdb")
# os <- readOGR("data/ordsurv/allshp/", "allNoPath")

f <- list.files("/media/SAMSUNG/repos/osm-cycle/data/ordserv/", pattern = "shp$")
f <- gsub(".shp", "", f)

# load up the data
osd <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/ordserv/", layer = f[1])
osd1 <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/ordserv/", layer = f[2])
osd2 <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/ordserv/", layer = f[3])
osd3 <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/ordserv/", layer = f[4])
osd4 <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/ordserv/", layer = f[5])

head(osd@data)
summary(osd$DescTerm)
cosd <- osd[ osd$DescTerm  == "Cycle Path", ] 
cosd1 <- osd1[ osd1$DescTerm  == "Cycle Path", ] 
cosd2 <- osd2[ osd2$DescTerm  == "Cycle Path", ] 
cosd3 <- osd3[ osd3$DescTerm  == "Cycle Path", ] 
cosd4 <- osd4[ osd4$DescTerm  == "Cycle Path", ] 
library(maptools)
head(row.names(cosd))
row.names(cosd1) <- paste0("1", 1:nrow(cosd1))
os_cypath <- gUnion(cosd, cosd1)
os_cypath <- gUnion(os_cypath, cosd2)
os_cypath <- gUnion(os_cypath, cosd3)
os_cypath <- gUnion(os_cypath, cosd4)

plot(os_cypath)

proj4string(os_cypath)
gLength(os_cypath) / 1000000
gLength(os_cypath) / (gLength(osd) + gLength(osd1) + gLength(osd2) + gLength(osd3) + gLength(osd4)) 
os_cypathdf <- SpatialLinesDataFrame(os_cypath, data = data.frame(1:length(os_cypath)))

writeOGR(os_cypathdf, dsn = "data/ordserv/", layer = "os_cypath", driver = "ESRI Shapefile")

# old approach
# os.dbf <- read.dbf("data/ordsurv/allshp/allshp.dbf")
# summary(os.dbf)
# length(which(os.dbf$DescTerm == "Footpath")) / nrow(os.dbf)
# 
# # analysis
# library(rgeos)
# gLength(os) / 1000 # ~5000 km cycle paths
# 
# # subset by zone + add to la dataset on topic
# proj4string(ps) <- CRS("+init=epsg:4326")
# osm <- spTransform(ps, CRSobj=CRS("+init=epsg:27700"))
# bbox(osm)
# 
# gLength(osm) / 1000
