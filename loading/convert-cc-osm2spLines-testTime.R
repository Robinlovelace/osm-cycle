# extract osm points as paths
load("data//cyclestreetDB2.RData")

head(ps)
class(ps)
ps[2,1] # the nums we want to extract

library(sp)

ps.orig <- ps
start <- proc.time()
ps <- ps[1:round(nrow(ps) / 1000),]
ps <- as.list(ps) # make a list to modify contents
# for loop to process all the lines - taking over 3 hours (started at 11am Monday)
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
ps <- SpatialLinesDataFrame(ps, data=mway2[1:i,1:6]) # add data
plot(ps) # test plot
head(ps@data)
head(mwayTags)
ps@data <- merge(ps@data, mwayTags[1:i,], by = "id")
proc.time() - start

plot(psSub) # test plot
psSub <- SpatialLinesDataFrame(psSub, data=mway2[1:5,1:6]) # add data
head(psSub@data)
head(mwayTags)
psSub@data <- merge(psSub@data, mwayTags, by = "id")
head(psSub@data)

length(unique(mway2$id))
length(unique(mway2$wayNameId))
summary(unique(mway2$id))
