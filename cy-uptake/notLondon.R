# change in the rate of cycling outside london

notLon <- lam[ lam$Region != "London", ]
plot(notLon$pCycle01, notLon$pCycle) # make this plot nice! add regions!!!
summary(notLon$pCycle)
summary(notLon$pCycle01)
sum(notLon$Cycle.y) / sum(notLon$Allm.y)
sum(notLon$Cycle.x) / sum(notLon$Allm.x)
notLon$Growth <- (notLon$pCycle / notLon$pCycle01  - 1) * 100
notLon$Abs.Growth <- (notLon$pCycle - notLon$pCycle01) * 100

# analysing the growth in cycling
summary(notLon$Growth)
summary(notLon$Abs.Growth)



length(which(abs(notLon$Abs.Growth) < 1)) / nrow(notLon)
cD <- which(notLon$Growth < 0) # cycling Down
cU <- which(notLon$Growth > 0)
notLon[notLon$Abs.Growth > 0.5,1]
notLon[cU,1]
length(cD)
summary(notLon$Growth[cD])
length(which(notLon$Growth < 0))
summary(notLon$Growth[cU])
hist(notLon$Growth)

# ar