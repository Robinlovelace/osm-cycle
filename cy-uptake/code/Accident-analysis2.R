sum(lamf$Cycle.x)
sum(lamf$Cycle.y)

# number of serious injuries and fatalities
head(acWY@data)

# load accident severity data (load wb object)
wbA <- read.xls("Road-Accident-Safety-Data-Guide-1979-2004.xls", sheet=4)
head(wbA)
acWY$Accident_Sf <- factor(acWY$Accident_Severity, labels = wbA$label)

# subsetting for serious and deathly crashes
wserious <- acWY$Accident_Sf == "Serious" 
summary(wserious)
wdeath <- acWY$Accident_Sf == "Fatal" 
summary(wdeath)

proj4string(lamf) <- proj4string(acWY)

# extract n. serious injuries
latmp <- aggregate(acWY[wserious,"Accident_Sf"], by=lamf, FUN=length)
head(latmp@data)
nrow(latmp)
lamf$n.serious <- latmp$Accident_Sf
plot(lamf$Cycle.x, lamf$n.serious)

# n. fatalities
latmp <- aggregate(acWY[wdeath,"Accident_Sf"], by=lamf, FUN=length)
lamf$n.death <- latmp$Accident_Sf
plot(lamf$Cycle.x, lamf$n.death)
lamf@data[c("NAME", "n.serious", "n.death")]

# estimated distance cycled
lamf$dmkm.yr <- (lamf$Cycle.x * 4032) / # million pkm per cycle commuter 
  1000000

# proportion of deaths/bkm
lamf$p.serious.yr <- ( (lamf$n.serious / 8) / # rate per year
                         (lamf$dmkm.yr / 1000) )

lamf$p.death.yr <- ( (lamf$n.death / 8) /
                       (lamf$dmkm.yr / 1000) )