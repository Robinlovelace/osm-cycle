# safety by LA - run after bikeR preliminaries on STATS19 data

load("updata/cyAc.mini.STATS19.RData")
cyAc.mini <- cyAc.mini[!is.na(cyAc.mini$Location_Easting_OSGR),]
# convert to 'safety point' (s for short)
s <- SpatialPoints(matrix(c(cyAc.mini$Location_Easting_OSGR, cyAc.mini$Location_Northing_OSGR), ncol=2))
s <- SpatialPointsDataFrame(s, data=cyAc.mini[3:5], proj4string=CRS(proj4string(la11)) )
plot(la11)
points(s)
s$weightAc <- 1
summary(s$Accident_Severity)
s$weightAc[ s$Accident_Severity == 2] <- 5
s$weightAc[ s$Accident_Severity == 1] <- 20
s@data <- data.frame( weightAc =s$weightAc)

sagg <- aggregate(s, la11, sum)
summary(sagg$weightAc)
lam$weightAc <- sagg$weightAc
sagg <- aggregate(s, la11, length)
summary(sagg$weightAc)
lam$count.Ac <- sagg$weightAc
head(lam)

