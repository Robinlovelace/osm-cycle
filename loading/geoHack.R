# subset and save data for python hack event
library(rgdal)
la <- readOGR("cy-uptake/updata/")
la <- readOGR("cy-uptake/updata/", "ua2011")
ps.leeds <- ps[ la[ la$NAME== "Leeds" ,], ] # didn't work

# loading the local cyclable paths from .shp file (filtered in qgis)
# ps.leeds <- readOGR("cy-uptake/updata/", "leedsAll")
setwd("~/")
ps.leeds <- readOGR(".", "bristol-cycleways")


object.size(ps.leeds) / 1000000
leedsTags <- mwayTags[ mwayTags$id %in% ps.leeds$id, ]
head(leedsTags)
head(mwayRF)
head(mwayBR)
summary(mwayTag_osm$id %in% mwayTags$id)
summary(mwayTags$id %in% mwayTag_osm$id) # all cycle paths in there
leedsOSMTags <- mwayTag_osm[mwayTag_osm$id %in% leedsTags$id,]

# save files
write.csv(leedsTags, "/scratch/pythonGeoHack/leedsTags.csv")
write.csv(leedsOSMTags, "/scratch/pythonGeoHack/leedsOSMTags.csv")
write.csv(mwayRF, "/scratch/pythonGeoHack/mwayRF.csv")
write.csv(mwayBR, "/scratch/pythonGeoHack/mwayBR.csv")


# congruence
mwayBR$id %in% mwayTags$routeId
which(mwayBR$id %in% mwayTags$routeId)
summary(mwayBR$id %in% mwayTags$routeId)
