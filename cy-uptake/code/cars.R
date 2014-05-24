# cars
cars <- read.csv("updata/car_ua.csv")
head(cars)
cars <- rbind(cars, read.csv("updata/car_dis.csv"))

tpop <- rbind(read.csv("updata//percWMUA.csv"), read.csv("updata/percWMD.csv"))
head(tpop)
tpop <- tpop[1:3]
head(tpop)
head(cars)

cars$car.per <- cars$ks0170007 / tpop$st1010001
head(cars)
head(lam[1:3])
cars$NAME <- cars$Zone.Name
cars$Zone.Name <- NULL ; cars$Zone.Code <- NULL; cars$ks0170007 <- NULL
head(cars)

library(plyr)
lam <- join(lam, cars)
head(lam)

head(lam)
summary(lam$cars)

cars11 <- read.csv("updata/Data_CARVAN_UNIT.csv")
head(cars11)
names(cars11)
cars11 <- cars11[-1, c(2,6)]
cars11$F110068 <- as.integer(as.character(cars11$F110068))
head(cars11)
tPop <- read.csv("updata/Data_ALL_LA-simple.csv")
head(tPop)
class(tPop$F60293) # check it's the correct class
summary(cars11)

head(cars11)
head(tPop)
cars11$F110068 <- cars11$F110068 / tPop$F60293
summary(cars11$F110068)
# merge with lam dataset
names(lam)
cars
cars11 <- merge(lam[1:2], cars11, by.x="CODE", by.y="GEO_CODE", all.x=T, sort=F)
head(cars11)
head(lam[1:4])
lam$cars11 <- cars11$F110068 
plot(lam$car.per, lam$cars11)
lam$changeCar <- lam$cars11 - lam$car.per
