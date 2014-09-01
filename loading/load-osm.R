# loading the osm data

cways <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/osm/", "cycleways-all")
summary(cways@data)

bicycle_most <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/osm/", "bicycle-designated-shared")
lcn <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/osm/", "lcn-all")
ncn <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/osm/", "ncn-all")
rcn <- readOGR("/media/SAMSUNG/repos/osm-cycle/data/osm/", "rcn-all")

cways <- spTransform(cways, CRS("+init=epsg:27700"))
bicycle_most <- spTransform(bicycle_most, CRS("+init=epsg:27700"))
lcn <- spTransform(lcn, CRS("+init=epsg:27700"))
ncn <- spTransform(ncn, CRS("+init=epsg:27700"))
rcn <- spTransform(rcn, CRS("+init=epsg:27700"))

obp <- gUnion(cways, bicycle_most)
obp <- gUnion(obp, lcn)
obp <- gUnion(obp, ncn)
obp <- gUnion(obp, rcn)
obp <- spTransform(obp, CRS("+init=epsg:27700"))
obpdf <- SpatialLinesDataFrame(obp, data = data.frame(id = 1), match.ID = F)
writeOGR(obpdf, "/media/SAMSUNG/repos/osm-cycle/data/osm/", "all-tags-merged", driver = "ESRI Shapefile")
nrow(fortify(obpdf))

gLength(obp) / 1000000
gLength(obp) / 1000000 / length(row.names(obp))
gLength(cways) / 1000000
gLength(cways) / 1000 / nrow(cways)
gLength(lcn) / 1000000
gLength(lcn) / 1000000 / nrow(lcn)
gLength(ncn) / 1000000
gLength(ncn) / 1000000 / nrow(ncn)
gLength(rcn) / 1000000
gLength(rcn) / 1000000 / nrow(rcn)
gLength(bicycle_most) / 1000000
gLength(bicycle_most) / 1000000 / nrow(bicycle_most)

sum(gLength(cways), gLength(lcn), gLength(ncn), gLength(rcn), gLength(bicycle_most))  / 1000000

UK <- readOGR("/home/georl/repos/Creating-maps-in-R/data/", "ukbord")
png(filename = "figures/osm-overview.png", height = 20, width = 15)

plot(UK, col = "grey")
plot(cways, add = T)
plot(bicycle_most, col = "red", add = T)
plot(lcn, col = "blue", add = T)
plot(ncn, col = "green", add = T)
plot(rcn, col = "yellow", add = T)

dev.off()
