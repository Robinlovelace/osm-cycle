# regression - additional variables
names(lam)

lm2 <- lm(Growth ~ avinc + pathDPP  +  CDT, data = lam, na.action="na.omit")
summary(lm2)

lm2 <- lm(Growth ~ avinc + perc.car01 +  CDT, data = lam, na.action="na.omit")
summary(lm2)

lm2 <- lm(Growth ~ avinc + pathDPP +  CDT + changeYMW, data = lam, na.action="na.omit")
summary(lm2)

lm2 <- lm(Abs.Growth ~ avinc + pathDPP +  CDT + changeYMW, data = lam, na.action="na.omit")
summary(lm2)

lm2 <- lm(Growth ~ avinc + pathDPP +  CDT + percYMW, data = lam, na.action="na.omit")
summary(lm2)

lm2 <- lm(Abs.Growth ~ avinc + pathDPP +  CDT + changeYMW, data = lam, na.action="na.omit")
summary(lm2)

lm2 <- lm(Growth ~ avinc + pathDPP + perc.car01 +  CDT, data = lam, na.action="na.omit")
summary(lm2)

lm2 <- lm(Abs.Growth ~ avinc + pathDPP +  CDT + changeCar, data = lam, na.action="na.omit")
summary(lm2)

lm2 <- lm(Growth ~ avinc + pathDPP + changeCar +  CDT, data = lam, na.action="na.omit")
summary(lm2)

## Finding the final model
lm2 <- lm(Growth ~ avinc + perc.car01 +  CDT, data = notLon, na.action="na.omit")
summary(lm2)

lm2 <- lm(Growth ~ avinc + perc.car01 +  CDT, data = lam, na.action="na.omit")
summary(lm2)
