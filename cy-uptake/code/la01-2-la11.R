la01.pnts <- SpatialPointsDataFrame(coordinates(la01), data=la01@data, match.ID=F)
head(la01.pnts@data)
plot(la11[ grepl("Cornw", la11$NAME), ])
proj4string(la01.pnts) <- proj4string(la11)
cornwal01 <- la01.pnts[la11[ grep("Cornw|Sci", la11$NAME), ],]
cornwal01
points(cornwal01)
corRegionel <- c(row.names(cornwal01), "96") # include isle of scilly

# la01.pnts@data <- la01@data[c(2,9:23)]
colSums(la01.pnts@data[corRegionel,2:16])
la01.pnts$ZONE_LABEL <- as.character(la01.pnts$ZONE_LABEL)
# la01.pnts@data <- rbind(la01.pnts@data, c("Cornwall,Isles of Scilly", colSums(la01.pnts@data[corRegionel, 2:16])))
newCornw <- SpatialPointsDataFrame(coordinates(la11[ grepl("Cornw", la11$NAME), ]), match.ID= F,
                                   data = data.frame(t(c(ZONE_LABEL =1000, colSums(la01.pnts@data[corRegionel, 2:16])))) )
proj4string(newCornw) <- proj4string(la01.pnts)

la01.pnts <- rbind.SpatialPointsDataFrame(la01.pnts, newCornw )

class(la01.pnts@data$Mfh)
la01.pnts@data[nrow(la01.pnts@data),1] <- "Cornwall"

la01.pnts <- la01.pnts[- which(row.names(la01.pnts) %in% corRegionel) ,]
la11@data[ grep("Cornw", la11$NAME), ]
la01.pnts@data[ grep("Cornw", la01.pnts@data$ZONE_LABEL),]

plot(la11)
plot(la11[ grep("Wilt", la11$NAME), ], col = "red", add = T)
Wilt <- la01.pnts[la11[ grep("Wilt", la11$NAME), ],]
points(Wilt)
Wilt # names make sense?
Wilt <- row.names(Wilt)
la01.pnts[Wilt,]

newWilt <- SpatialPointsDataFrame(coordinates(la11[ grepl("Wilt", la11$NAME), ]), match.ID= F,
                                  data = data.frame(t(c(ZONE_LABEL =1000, colSums(la01.pnts@data[Wilt, 2:16])))) )
proj4string(newWilt) <- proj4string(la01.pnts)

la01.pnts <- rbind.SpatialPointsDataFrame(la01.pnts, newWilt )
la01.pnts@data[nrow(la01.pnts@data),1] <- as.character(la11@data$NAME[ grep("Wilt", la11$NAME)])

nrow(la01.pnts)
la01.pnts <- la01.pnts[- which(row.names(la01.pnts) %in% Wilt) ,]
nrow(la01.pnts)
la11@data[ grep("Wilt", la11$NAME), ]
la01.pnts@data[ grep("Wilt", la01.pnts@data$ZONE_LABEL),]
points(la01.pnts, col = "green")

# Merge the next zone: Northumberland

plot(la11)
plot(la11[ grep("Northumb", la11$NAME), ], col = "red", add = T)
Northumb <- la01.pnts[la11[ grep("Northumb", la11$NAME), ],]
points(Northumb)
Northumb # names make sense?
Northumb <- row.names(Northumb)
la01.pnts[Northumb,]

newNorthumb <- SpatialPointsDataFrame(coordinates(la11[ grepl("Northumb", la11$NAME), ]), match.ID= F,
                                      data = data.frame(t(c(ZONE_LABEL =1000, colSums(la01.pnts@data[Northumb, 2:16])))) )
proj4string(newNorthumb) <- proj4string(la01.pnts)

la01.pnts <- rbind.SpatialPointsDataFrame(la01.pnts, newNorthumb )
la01.pnts@data[nrow(la01.pnts@data),1] <- as.character(la11@data$NAME[ grep("Northumb", la11$NAME)])

nrow(la01.pnts)
la01.pnts <- la01.pnts[- which(row.names(la01.pnts) %in% Northumb) ,]
nrow(la01.pnts)
la11@data[ grep("Northumb", la11$NAME), ]
la01.pnts@data[ grep("Northumb", la01.pnts@data$ZONE_LABEL),]
points(la01.pnts, col = "green")

# Durham:
  
plot(la11)
plot(la11[ grep("Durh", la11$NAME), ], col = "red", add = T)
Durh <- la01.pnts[la11[ grep("Durh", la11$NAME), ],]
points(Durh)
Durh # names make sense?
Durh <- row.names(Durh)
la01.pnts[Durh,]

newDurh <- SpatialPointsDataFrame(coordinates(la11[ grepl("Durh", la11$NAME), ]), match.ID= F,
                                  data = data.frame(t(c(ZONE_LABEL =1000, colSums(la01.pnts@data[Durh, 2:16])))) )
proj4string(newDurh) <- proj4string(la01.pnts)

la01.pnts <- rbind.SpatialPointsDataFrame(la01.pnts, newDurh )
la01.pnts@data[nrow(la01.pnts@data),1] <- as.character(la11@data$NAME[ grep("Durh", la11$NAME)])

nrow(la01.pnts)
la01.pnts <- la01.pnts[- which(row.names(la01.pnts) %in% Durh) ,]
nrow(la01.pnts)
la11@data[ grep("Durh", la11$NAME), ]
la01.pnts@data[ grep("Durh", la01.pnts@data$ZONE_LABEL),]
points(la01.pnts, col = "green")

# Cheshire E:
  
plot(la11)
plot(la11[ grep("Cheshire E", la11$NAME), ], col = "red", add = T)
Chest <- la01.pnts[la11[ grep("Cheshire E", la11$NAME), ],]
points(Chest)
Chest # names make sense?
Chest <- row.names(Chest)
la01.pnts[Chest,]

newChest <- SpatialPointsDataFrame(coordinates(la11[ grepl("Cheshire E", la11$NAME), ]), match.ID= F,
                                   data = data.frame(t(c(ZONE_LABEL =1000, colSums(la01.pnts@data[Chest, 2:16])))) )
proj4string(newChest) <- proj4string(la01.pnts)

la01.pnts <- rbind.SpatialPointsDataFrame(la01.pnts, newChest )
la01.pnts@data[nrow(la01.pnts@data),1] <- as.character(la11@data$NAME[ grep("Cheshire E", la11$NAME)])

nrow(la01.pnts)
la01.pnts <- la01.pnts[- which(row.names(la01.pnts) %in% Chest) ,]
nrow(la01.pnts)
la11@data[ grep("Cheshire E", la11$NAME), ]
la01.pnts@data[ grep("Cheshire E", la01.pnts@data$ZONE_LABEL),]
points(la01.pnts, col = "green")

# Cheshire W:
  
plot(la11)
plot(la11[ grep("Cheshire W", la11$NAME), ], col = "red", add = T)
Chest <- la01.pnts[la11[ grep("Cheshire W", la11$NAME), ],]
points(Chest)
Chest # names make sense?
Chest <- row.names(Chest)
la01.pnts[Chest,]

newChest <- SpatialPointsDataFrame(coordinates(la11[ grepl("Cheshire W", la11$NAME), ]), match.ID= F,
                                   data = data.frame(t(c(ZONE_LABEL =1000, colSums(la01.pnts@data[Chest, 2:16])))) )
proj4string(newChest) <- proj4string(la01.pnts)

la01.pnts <- rbind.SpatialPointsDataFrame(la01.pnts, newChest )
la01.pnts@data[nrow(la01.pnts@data),1] <- as.character(la11@data$NAME[ grep("Cheshire W", la11$NAME)])

nrow(la01.pnts)
la01.pnts <- la01.pnts[- which(row.names(la01.pnts) %in% Chest) ,]
nrow(la01.pnts)
la11@data[ grep("Cheshire W", la11$NAME), ]
la01.pnts@data[ grep("Cheshire W", la01.pnts@data$ZONE_LABEL),]
points(la01.pnts, col = "green")

# Shropshire:
  
plot(la11)
plot(la11[ grep("Shrop", la11$NAME), ], col = "red", add = T)
Chest <- la01.pnts[la11[ grep("Shrop", la11$NAME), ],]
points(Chest)
Chest # names make sense?
Chest <- row.names(Chest)
la01.pnts[Chest,]

newChest <- SpatialPointsDataFrame(coordinates(la11[ grepl("Shrop", la11$NAME), ]), match.ID= F,
                                   data = data.frame(t(c(ZONE_LABEL =1000, colSums(la01.pnts@data[Chest, 2:16])))) )
proj4string(newChest) <- proj4string(la01.pnts)

la01.pnts <- rbind.SpatialPointsDataFrame(la01.pnts, newChest )
la01.pnts@data[nrow(la01.pnts@data),1] <- as.character(la11@data$NAME[ grep("Shrop", la11$NAME)])

nrow(la01.pnts)
la01.pnts <- la01.pnts[- which(row.names(la01.pnts) %in% Chest) ,]
nrow(la01.pnts)
la11@data[ grep("Shrop", la11$NAME), ]
la01.pnts@data[ grep("Shrop", la01.pnts@data$ZONE_LABEL),]
points(la01.pnts, col = "green")

# Central Befordshire:
  
plot(la11)
plot(la11[ grep("Central B", la11$NAME), ], col = "red", add = T)
Chest <- la01.pnts[la11[ grep("Central B", la11$NAME), ],]
points(Chest)
Chest # names make sense?
Chest <- row.names(Chest)
la01.pnts[Chest,]

newChest <- SpatialPointsDataFrame(coordinates(la11[ grepl("Central B", la11$NAME), ]), match.ID= F,
                                   data = data.frame(t(c(ZONE_LABEL =1000, colSums(la01.pnts@data[Chest, 2:16])))) )
proj4string(newChest) <- proj4string(la01.pnts)

la01.pnts <- rbind.SpatialPointsDataFrame(la01.pnts, newChest )
la01.pnts@data[nrow(la01.pnts@data),1] <- as.character(la11@data$NAME[ grep("Central B", la11$NAME)])

nrow(la01.pnts)
la01.pnts <- la01.pnts[- which(row.names(la01.pnts) %in% Chest) ,]
nrow(la01.pnts)
la11@data[ grep("Central B", la11$NAME), ]
la01.pnts@data[ grep("Central B", la01.pnts@data$ZONE_LABEL),]
points(la01.pnts, col = "green")

# total zones merged
length(corRegionel) + length(Wilt) + length(Northumb) + length(Durh) + 3 + 3 + 5 + length(Chest)  

## Now merge the results

la11merge <- merge(la11@data[1:2], la01.pnts@data, by.y = "ZONE_LABEL", by.x = "NAME", all.x=F, sort=F)

