# subset based on cyclestreets classification
load("bigdata//cyclestreetDB2.RData")
summary(nchar(ps[,1])) 

ps.data <- cbind(ps, mway2)
mway2 <- mway2[1:6]

head(mway2)
m <- merge(mway2, mwayTags, by = "id")
for(i in 5:12){
  m[,i] <- as.factor(m[,i])
}

head(m)
summary(m)
summary(m$highway) # inspiration for subsetting-highway.R

head(mwayBR) # Bicycle Routes - definitely merge these ones!
mwayBR <- mwayBR[c(1,2,3,5,6,10,11)]
for(i in 2:ncol(mwayBR)){
  mwayBR[,i] <- as.factor(mwayBR[,i]) 
}
summary(mwayBR) # it's worth merging, but what to merge by?
summary(mwayBR$id %in% m$id)
summary(mwayBR$id %in% m$wayNameId)
summary(mwayBR$id %in% m$routeId) # the one: best fit
m <- merge(m, mwayBR, by.x = "routeId", by.y = "id", all.x=T)
head(m)

summary(m$network)
m[20:35,]

head(mwayRF) # cc interpretation - attractive as it's 'high level'
summary(mwayRF) # subset by speed and quietness

summary(m$routingFactorId.x) # check we can do a merge - yes
m <- merge(m, mwayRF[,c(1,5,6)], by.x = "routingFactorId.x", by.y = "id")
head(m)
summary(m)

sel.cn <- !is.na(m$network) # this method just does not seem to work to select the cycle network
mcn <- m[ sel.cn, ] 


