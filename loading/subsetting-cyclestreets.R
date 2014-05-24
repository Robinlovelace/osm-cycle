m1.sel <- m$speed > median(m$speed) & m$quietness > median(m$quietness)
m2.sel <- m$speed <= median(m$speed) & m$quietness > median(m$quietness)
m3.sel <- m$speed > median(m$speed) & m$quietness <= median(m$quietness)
m4.sel <- m$speed <= median(m$speed) & m$quietness <= median(m$quietness)

m1 <- m[ sel.m1 , ] 
m2 <- m[ sel.m2 , ] 
m3 <- m[ sel.m3 , ] 
m4 <- m[ sel.m4 , ] 

length(which(c(sel.m1, sel.m2, sel.m3, sel.m4))) / nrow(m) # that's all categories
nrow(m1) +
  nrow(m2) +
  nrow(m3) +
  nrow(m4)
.Last.value / nrow(m)