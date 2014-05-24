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
sd(notLon$pCycle)
sd(notLon$pCycle01)

length(which(abs(notLon$Abs.Growth) < 1)) / nrow(notLon)
cD <- which(notLon$Growth < 0) # cycling Down
cU <- which(notLon$Growth > 0)
notLon[notLon$Abs.Growth > 0.5,1]
notLon[notLon$Abs.Growth < -2,1]

head(notLon[order(notLon$Abs.Growth, decreasing=T ), c("NAME", "Abs.Growth") ], 12) 
top5B <- head(notLon[order(notLon$Abs.Growth), c("NAME", "pCycle01", "pCycle", "Abs.Growth", "Growth" ) ], 5) 
top5T <- head(notLon[order(notLon$Abs.Growth, decreasing=T ), c("NAME", "pCycle01", "pCycle", "Abs.Growth", "Growth" ) ], 5) 
tops <- rbind(top5T, top5B)
tops[2:3] <- tops[2:3] * 100
tops[,-1] <- round(tops[,-1], 1)
tops$Evidence <- "..."
write.csv(tops, "results/top5s.csv")
kable(print(tops), row.names=F)

# give these high/low areas names!
lam$Label <- ""
lam$Label[as.numeric(row.names(top5B))] <- as.character(lam$NAME[as.numeric(row.names(top5B))])
lam$Label[as.numeric(row.names(top5T))] <- as.character(lam$NAME[as.numeric(row.names(top5T))])


notLon[cU,1]
length(cD)
summary(notLon$Growth[cD])
length(which(notLon$Growth < 0))
summary(notLon$Growth[cU])
hist(notLon$Growth)

# regression model outside london
notLon <- lam[ lam$Region != "London", ]
lm1 <- lm(DpCycle ~ Avinc + Lpath + Bcrash + Invst, data=notLon)
summary(lm1)

lm2 <- lm(Abs.Growth ~ avinc + pathDPP + CDT + perc.car01, data = notLon, na.action="na.omit")
summary(lm2)

lm2 <- lm(Growth ~ avinc + pathDPP + CDT + perc.car01, data = notLon, na.action="na.omit")
summary(lm2)

lm2 <- lm(Abs.Growth ~ avinc + pathDPP + CDT + changeYMW, data = notLon, na.action="na.omit")
summary(lm2)

lm2 <- lm(Growth ~ avinc + pathDPP + CDT + changeYMW, data = notLon, na.action="na.omit")
summary(lm2)

lm2 <- lm(Abs.Growth ~ avinc + pathDPP + CDT + changeCar, data = notLon, na.action="na.omit")
summary(lm2)

lm2 <- lm(Growth ~ avinc + pathDPP + CDT + changeCar, data = notLon, na.action="na.omit")
summary(lm2)



