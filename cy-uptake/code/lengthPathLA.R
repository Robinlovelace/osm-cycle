# script to measure the length of cycle path by local authority
x <- c("rgdal", "rgeos")
lapply(x, require, character.only = T)

cp <- readOGR("../bigdata/cc-subsets/", "m1CycleStreets")
proj4string(cp) <- CRS("+init=epsg:4326")
cp <- spTransform(cp, CRS(proj4string(la11)))

load("updata/lam.RData")
names(lam)
lam$pathDist <- NA

for(i in 1:nrow(la11)){
  cpS <- cp[la11[i, ], ]
  plot(la11[i,])
  plot(cpS, add = T)
  # no need to plot but these look beautiful - should include some of these in paper!
  lam$pathDist[i] <- gLength(cpS) / 1000
}

lam$pathDPP <- lam$pathDist / lam$Allm.y
plot(lam$Abs.Growth, lam$pathDPP )
cor(lam$Abs.Growth, lam$pathDPP )

# object.size(cp) / 1000000 # 200 mb!
# cps <- SpatialLinesDataFrame(gSimplify(cp, tol=20), cp@data)
# object.size(cps) / 1000000

