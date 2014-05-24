# script to measure the length of cycle path by local authority
x <- c("rgdal", "rgeos")
lapply(x, require, character.only = T)

on <- readOGR("../bigdata/cc-subsets/", "onroad")
proj4string(on) <- CRS("+init=epsg:4326")
on <- spTransform(on, CRS(proj4string(la11)))

cp <- readOGR("../bigdata/cc-subsets/", "dedicated")
proj4string(cp) <- CRS("+init=epsg:4326")
cp <- spTransform(cp, CRS(proj4string(la11)))

m1 <- readOGR("../bigdata/cc-subsets/", "m1CycleStreets")
proj4string(m1) <- CRS("+init=epsg:4326")
m1 <- spTransform(m1, CRS(proj4string(la11)))

gLength(on); gLength(cp); gLength(m1)

load("updata/lam.RData")
names(lam)
lam$pathDist <- NA

for(i in 1:nrow(la11)){
  cpS <- m1[la11[i, ], ]
#   plot(la11[i,])
#   plot(cpS, add = T)
  # no need to plot but these look beautiful - should include some of these in paper!
  lam$pathDist[i] <- gLength(cpS) / 1000
print(i)
}

lam$pathDPP <- lam$pathDist / lam$Allm.y
plot(lam$Abs.Growth, lam$pathDPP )
cor(lam$Abs.Growth, lam$pathDPP )

# object.size(cp) / 1000000 # 200 mb!
# cps <- SpatialLinesDataFrame(gSimplify(cp, tol=20), cp@data)
# object.size(cps) / 1000000

