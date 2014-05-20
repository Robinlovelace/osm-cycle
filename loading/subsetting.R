# subsetting cycle network lines
ps.orig <- ps # save backup of points data
ps <- ps.orig # reset points data for new runs

# sel <- nchar(ps[,1]) > 30000
ps <- ps[ m1.sel , ]
ps <- as.list(ps)

for(i in 1:length(ps)){
  ps[[i]] <- gsub("LINESTRING\\(", "", ps[[i]])
  ps[[i]] <- gsub("\\)", "", ps[[i]])
  ps[[i]] <- gsub(" ", ",", ps[[i]])
  ps[[i]] <- as.numeric(read.csv(text = ps[[i]], header=F))
  ps[[i]] <- matrix(ps[[i]], ncol=2, byrow=T)
  ps[[i]] <- Line(ps[[i]])
  ps[[i]] <- Lines(ps[[i]], ID = i)
  if( i %% 10000  == 0 ) print(i)
}

ps <- SpatialLines(ps) # convert to SpatialLines object
ps <- SpatialLinesDataFrame(ps, data=m[ m1.sel, ], match.ID=F) # add data
# plot(ps) # test plot
summary(ps@data)
head(mwayTags)

library(rgdal)
writeOGR(ps, "data/", "m1CycleStreets", "ESRI Shapefile")

ps <- ps.orig
ps <- ps[ sel.m2 , ]
ps <- as.list(ps)

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
ps <- SpatialLinesDataFrame(ps, data=m2[1:i, ], match.ID=F) # add data
# plot(ps) # test plot
head(ps@data)

writeOGR(ps, "data/", "cycleways2", "ESRI Shapefile")

ps <- ps.orig
ps <- as.list(ps)
start <- proc.time()

for(i in 1:1000000){
  ps[[i]] <- gsub("LINESTRING\\(", "", ps[[i]])
  ps[[i]] <- gsub("\\)", "", ps[[i]])
  ps[[i]] <- gsub(" ", ",", ps[[i]])
  ps[[i]] <- as.numeric(read.csv(text = ps[[i]], header=F))
  ps[[i]] <- matrix(ps[[i]], ncol=2, byrow=T)
  ps[[i]] <- Line(ps[[i]])
  ps[[i]] <- Lines(ps[[i]], ID = i)
}

ps <- SpatialLines(ps) # convert to SpatialLines object
ps <- SpatialLinesDataFrame(ps, data=m[1:i, ], match.ID=F) # add data
proc.time() - start

