# loading msoa data
# devtools::install_github("hadley/dplyr") # latest version of dplyr needed
library(devtools)

x <- c("rgdal", "ggplot2", "rgeos", "dplyr")
lapply(x, require, character.only=T)

msoa <- readOGR("updata/", "msoa-2011") # load spatial data
msoa.data <- read.csv("updata/all-modes-msoa-2011.csv") # 2011 ttw
head(msoa.data)
names(msoa.data)
names(msoa.data)[3]  <- "CODE"
names(msoa.data)[5:17] <- c("All", "Mfh", "Tram", "Train", "Bus", "Taxi", "Moto", "Car.d", "Car.p", "Cycle", "Walk", "Other", "Unemp")
head(msoa.data)
head(msoa@data)
msoa@data <- left_join(msoa@data, msoa.data, copy=T)
head(msoa@data)

msoa01 <- readOGR("updata/", "msoa-2001")
msoa01.data <- read.csv("updata/allmodes-2001-msoa.csv")
head(msoa01.data)
names(msoa01.data)[3:14] <- c("All", "Mfh", "Tram", "Train", "Bus", "Moto", "Car.d", "Car.p", "Taxi", "Cycle", "Walk", "Other")
head(msoa01.data)

nrow(msoa01.data)
nrow(msoa)
j <- msoa01@data$MSOA04CD %in% msoa$CODE
k <- msoa$CODE %in% msoa01.data$Zone.Code
summary(msoa$CODE %in% msoa.data$CODE) # all zones in 2011 areas R there!
length(which(j)) / nrow(msoa01.data) # 98 % zones are in the 2011 data
length(which(k)) / nrow(msoa) # 98 % zones in 2011 data also in 2001 data

# join the data with dplyr
head(msoa@data[1:5])
head(msoa01.data[1:5])
names(msoa01.data)[1] <- "CODE"
msoa@data  <- left_join(msoa@data, msoa01.data, by="CODE")
head(msoa@data)
plot(msoa$Cycle.x, msoa$Cycle.y) # has it worked? - Yes seems good
summary(is.na(msoa$Cycle.x))
summary(is.na(msoa$Cycle.y)) # the 151 zones with no match in 2001 data
msoa.mis <- msoa[is.na(msoa$Cycle.y),]
msoa01.mis <- msoa01[-which(j), ]
plot(msoa.mis) 
plot(msoa01.mis, add=T) # plot to see that they overlap
m <- as.numeric(row.names(msoa.mis)) # mismatching zones

nrow(msoa01.mis)
plot(msoa01.mis)
# writeOGR(msoa01.mis, "results/", "msoa01-mismatch", "ESRI Shapefile")

# oas <- read.csv("file:///media/AA5EAF5C5EAF2055/GIS/Datagis/England/oas/alloas_ttw.csv")
# head(oas[1:5])
# names(oas)[5:16] <- c("All", "Mfh", "Tram", "Train", "Bus", "Moto",
#   "Car.d", "Car.p", "Taxi", "Cycle", "Walk", "Other")
# oas$Easting <- as.numeric(as.character(oas$Easting))
# oas$Northing <- as.numeric(as.character(oas$Northing))
# # plot(oas$Easting, oas$Northing) # check it works
# oas <- SpatialPointsDataFrame(as.matrix(cbind(oas$Easting, oas$Northing)),
#   data = oas)
# bbox(oas)
# proj4string(oas) <- proj4string(msoa)
# # subset the oas falling into the empty msoas for 01 data
# bbox(msoa)
# oas <- oas[msoa.mis, ]

load("updata/oas01.RData")
plot(oas)
# save(oas, file="updata/oas01.RData")
# writeOGR(oas, "updata/", "oas01", "ESRI Shapefile")
head(oas@data[5:16]) # all ttw data
head(msoa@data[20:31]) # all 2001 msoa data
head(msoa.mis@data[20:31]) # the parts we need to fill in

# Now aggregate the oa data
for(i in m){
  sel <- oas[msoa[i,], ]
#   plot(msoa[i,])
#   points(sel) # check the selected points are in the zone - testing
  oas.d <- colSums(oas@data[row.names(sel), 5:16], na.rm=T)
  msoa@data[i, 20:31] <- oas.d
}
i <- which(is.na(msoa$Cycle.y))
  sel <- oas[msoa[i,], ]
#   plot(msoa[i,])
#   points(sel) # check the selected points are in the zone - testing
  oas.d <- colSums(oas@data[row.names(sel), 5:16], na.rm=T)
  msoa@data[i, 20:31] <- oas.d

# writeOGR(msoa[is.na(msoa$Cycle.y), ], "results/", "msoa11-miss-oa", "ESRI Shapefile")
# cor(msoa$All.x[as.numeric(row.names(msoa.mis))], msoa$All.y[as.numeric(row.names(msoa.mis))], use="complete.obs")
cor(msoa$Cycle.x / msoa$All.x, msoa$Cycle.y / msoa$All.y, "complete.obs")
cor(msoa$Cycle.x[m] / msoa$All.x[m], msoa$Cycle.y[m] / msoa$All.y[m], "complete.obs") # test2
cor(msoa$Train.x[m] / msoa$All.x[m], msoa$Train.y[m] / msoa$All.y[m], "complete.obs") # test1

msoa@data$Allm.y <- rowSums( msoa@data[c("Tram.y", "Train.y","Bus.y","Moto.y","Car.d.y","Car.p.y","Taxi.y","Cycle.y","Walk.y", "Other.y")])
summary(msoa@data$Allm.y / (msoa@data$Mfh.y + msoa@data$Allm.y)) # around 10% work mfh 2001
msoa@data$pCycle01 <- msoa@data$Cycle.y / msoa@data$Allm.y

# analysis of growth in cycling (msoas) - taken from 'foundations.Rmd'
msoa@data$Allm.x <- rowSums(msoa@data[c("Tram.x", "Train.x","Bus.x","Moto.x","Car.d.x","Car.p.x","Taxi.x","Cycle.x","Walk.x", "Other.x")])
summary(msoa@data$Allm.x / (msoa@data$Mfh.x + msoa@data$Allm.x)) # around 5% work mfh 2011???
msoa@data$pCycle <- msoa@data$Cycle.x / msoa@data$Allm.x

plot(msoa@data$pCycle01, msoa@data$pCycle) # make this plot nice! add regions!!!
cor(msoa@data$pCycle01, msoa@data$pCycle, "complete.obs") # make this plot nice! add regions!!!
.Last.value^2

summary(msoa@data$pCycle)
summary(msoa@data$pCycle01)

sd(msoa@data$pCycle)
sd(msoa@data$pCycle01, na.rm=T)

sum(msoa@data$Cycle.y) / sum(msoa@data$Allm.y)
sum(msoa@data$Cycle.x) / sum(msoa@data$Allm.x)

msoa@data$Growth <- (msoa@data$pCycle / msoa@data$pCycle01  - 1) * 100
msoa@data$Abs.Growth <- (msoa@data$pCycle - msoa@data$pCycle01) * 100

# analysing the growth in cycling
summary(msoa@data$Growth)
summary(msoa@data$Abs.Growth)
length(which(abs(msoa@data$Abs.Growth) < 1)) / nrow(msoa@data)
cD <- which(msoa@data$Growth < 0) # cycling Down
cU <- which(msoa@data$Growth > 0)
length(cD)
summary(msoa@data$Growth[cD])
summary(msoa@data$pCycle01[cU])
summary(msoa@data$pCycle01[cD])

length(which(msoa@data$Growth < 0))
summary(msoa@data$Growth[cU])
hist(msoa@data$Growth)


