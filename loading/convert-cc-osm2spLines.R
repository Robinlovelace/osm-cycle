# extract osm points as paths
load("data//cyclestreetDB2.RData")
library(sp)

ps <- as.list(ps) # make a list to modify contents

for(i in 1:length(ps)){
  ps[[i]] <- gsub("LINESTRING\\(", "", ps[[i]])
  ps[[i]] <- gsub("\\)", "", ps[[i]])
  ps[[i]] <- gsub(" ", ",", ps[[i]])
  ps[[i]] <- as.numeric(read.csv(text = ps[[i]], header=F))
  ps[[i]] <- matrix(ps[[i]], ncol=2, byrow=T)
  ps[[i]] <- Line(ps[[i]])
  ps[[i]] <- Lines(ps[[i]], ID = i)
}

ps <- SpatialLines(ps) # convert to SpatialLines object
plot(ps[1:50000,]) # test plot
ps <- SpatialLinesDataFrame(ps, data=mway2[1:5,1:6]) # add data
head(ps@data)
head(mwayTags)
ps@data <- merge(ps@data, mwayTags, by = "id")
head(ps@data)

# testing it before final implementation:
head(ps)
class(ps)
ps[2,1] # the nums we want to extract

psSub <- ps[1:5,]
psSub <- as.list(psSub)
# 
# for(i in 1:length(psSub)){
# psSub[[i]] <- gsub("LINESTRING\\(", "", psSub[[i]])
# psSub[[i]] <- gsub("\\)", "", psSub[[i]])
# psSub[[i]] <- gsub(" ", ",", psSub[[i]])
# psSub[[i]] <- as.numeric(read.csv(text = psSub[[i]], header=F))
# psSub[[i]] <- matrix(psSub[[i]], ncol=2, byrow=T)
# psSub[[i]] <- Line(psSub[[i]])
# psSub[[i]] <- Lines(psSub[[i]], ID = i)
# }
# 
# psSub <- SpatialLines(psSub) # convert to SpatialLines object
# plot(psSub) # test plot
# psSub <- SpatialLinesDataFrame(psSub, data=mway2[1:5,1:6]) # add data
# head(psSub@data)
# head(mwayTags)
# psSub@data <- merge(psSub@data, mwayTags, by = "id")
# head(psSub@data)
# 
# length(unique(mway2$id))
# length(unique(mway2$wayNameId))
# summary(unique(mway2$id))
