# subset and convert points to create proper spatial lines polygon

# select the highest quality bike paths 1st
cn <- !is.na(m$network) # all cycle networks
sel.m1 <- m$highway == "cycleway"
# sel.m1[ cn ] <- T # select all cycle paths (deal with this!)
m1 <- m[ sel.m1, ] # 1st and best way of describing high qual. bike paths
nrow(m1) / nrow(m)
head(m1)
summary(m1)


sel.m2 <- grepl("bridle|footway|living_street|path|pedestrian|track", m$highway)
summary(sel.m2)
sel.m2[ which(m$bicycle == "dismount") ] <- F
# sel.m2[ cn ] <- F
m2 <- m[ sel.m2, ]
summary(m2)

sel.m3 <- grepl("bus_|motorw|prima|resid|road|second|service|tert|trunk|unclass" , m$highway) 
# sel.m3[ cn ] <- F
m3 <- m[ sel.m3 , ] 

sel.m4 <- grepl("bridle|footway|living_street|path|pedestrian|track", m$highway)
summary(sel.m4)
sel.m4[ m$bicycle != "dismount" & sel.m2 ] <- F # only areas where dismounts are essential
sel.m4[ grepl("ae|byway|cons|ferr|steps" , m$highway) ] <- T
# sel.m4[ cn ] <- F
m4 <- m[ sel.m4, ]

length(which(c(sel.m1, sel.m2, sel.m3, sel.m4))) / nrow(m) # that's all categories
nrow(m1) +
nrow(m2) +
nrow(m3) +
nrow(m4)
