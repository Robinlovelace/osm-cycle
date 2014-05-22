# income at la and msoa level

msoa.point <- SpatialPointsDataFrame(coordinates(msoa), data = msoa@data[1], match.ID=F)
plot(msoa.point)
msoaIncome <- read.csv("/scratch/incomedata/msoa-04-05-income-D120305_1779_GeoPolicy_MSOA.csv")
head(msoaIncome)
msoa.point@data <- msoa@data[1]
head(msoa.point@data)
msoa.point@data <- merge(msoa.point@data, msoaIncome[c(5,7)], by.x = "CODE", by.y = "MSOA_CODE")
head(msoa.point@data)
msoa.point$avinc <- msoa.point$DATA_VALUE
head(msoa.point@data)

proj4string(msoa.point) <- proj4string(la11)
agginc <- aggregate(msoa.point, by = la11, mean, na.rm=T)
head(agginc@data)
plot(agginc[ agginc$avinc > 800,])
la11@data[agginc$avinc > 800, 1:5]
lam$avinc <- agginc$avinc
head(lam)
