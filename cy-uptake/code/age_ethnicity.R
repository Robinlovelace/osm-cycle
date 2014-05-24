# proportion of white young men - not used atm - too complex
la01 <- la01.backup
la01.backup <- la01


wymLA <- read.csv("updata/percWMUA.csv")
head(wymLA)
wymLA$Zone.Code %in% la01$ZONE_CODE # all these zones are included: great

# add districts
names(read.csv("updata/percWMD.csv"))
names(wymLA)
wymLA <- rbind(wymLA, read.csv("updata/percWMD.csv"))
wymLA <- wymLA[c(1,3,14:33)]
head(wymLA)
wymLA$Zone.Code %in% la01$ZONE_CODE # all these zones are also included

# rearrange
la01names <- data.frame(ZONE_CODE = la01@data[1])
la01names$ZONE_LABEL <- la01$Zone.Name
head(la01names)
head(wymLA)
wymLA <- merge(la01names, wymLA, by.x="ZONE_CODE", by.y="Zone.Code")
head(wymLA)
head(la01@data) # yes it's the same order

# convert to la11 zones - output = la11merge
la01@data <- la01@data[1:2]
head(la01@data)
la01@data <- merge(la01@data, wymLA, by="ZONE_CODE")
head(la01@data)
names(la01@data)
# source("code/la01-2-la11.R")
# head(la11merge)
la01.epoints <- SpatialPointsDataFrame(coordinates(la01), data=la01@data[3:ncol(la01@data)], match.ID=F)
head(la01.epoints@data)
plot(la11)
points(la01.epoints)
proj4string(la01.epoints) <- proj4string(la11)
la11.ethnic <- aggregate(la01.epoints, la11, sum, na.rm=T)
head(la11.ethnic@data)
lam$percYMW <- rowSums(la11.ethnic@data[2:ncol(la11.ethnic)]) / la11.ethnic$st1010001
summary(lam$percYMW)

## Alternative try
wymLA2 <- data.frame(NAME = wymLA$ZONE_LABEL, percYMW = rowSums(wymLA[4:ncol(wymLA)]) / wymLA$st1010001 )
head(merge(lam, wymLA2, by="NAME", all.x=T ))
lam <- merge(lam, wymLA2, by="NAME", all.x=T )
head(lam)

tPop <- read.csv("updata/Data_ALL_LA-simple.csv")
head(tPop)
tPop <- cbind(tPop, read.csv("updata/Data_AGE_ETHGRP_SEX_UNIT-simple.csv"))
tPop <- tPop[ !is.na(tPop$F65600), ]
head(tPop)
plot(tPop$F60293, rowSums(tPop[5:10]))

tPop <- data.frame(tPop[c(3)], percYMW11 = rowSums(tPop[5:10]) / tPop$F60293 )
head(tPop)
head(lam)
library(plyr)
lam$percYMW11 <- NULL
lam <- join(lam, tPop, by="NAME")
plot(lam$percYMW, lam$percYMW11)
cor(lam$percYMW, lam$percYMW11, use="complete.obs")
lam$changeYMW <- lam$percYMW11 - lam$percYMW

save(lam, file = "updata/lam.RData")
