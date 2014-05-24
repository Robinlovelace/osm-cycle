# subsetting different types of cycle path
summary(m$quietness)
summary(m$cycleway)
unique(m$cycleway)
summary(m$bicycle)

sel.m1 <- !is.na(m$cycleway) 
summary(sel.m1)

sel.ded <- m$highway == "cycleway" & m$cycleway == "track"
summary(sel.ded)

isCycleWay <- ps[ sel.m1, ]
isCycleWay@data <- m[ sel.m1, ]

dedicated <- ps[ sel.ded, ]
head(dedicated@data)
dedicated@data <- m[ sel.ded, ]
head(dedicated@data)

sel.onroad <- m$cycleway == "lane" & m$cycleway != "track"
onroad <- ps[ sel.onroad, ] 


writeOGR(dedicated, "bigdata/cc-subsets/", "dedicated", "ESRI Shapefile")
writeOGR(onroad, "bigdata/cc-subsets/", "onroad", "ESRI Shapefile")
