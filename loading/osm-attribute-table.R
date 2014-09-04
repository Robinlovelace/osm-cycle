# Bicycle path data
# After 'load-osm.R', use this script to build table x on osm attributes

summary(hways$highway)
summary(hways$cycleway)
summary(hways$cycleway)[1] / nrow(hways)

apply(hways, MARGIN = 2, FUN = function(x) length(which(x == "")))
nrow(hways) - .Last.value

nrow(bicycle_all)
summary(bicycle_all$bicycle)
sort(summary(hways$bicycle), decreasing = T)[1:10]

nrow(cways)
summary(cways)
sort(summary(hways$cycleway), decreasing = T)[1:10]

sort(summary(hways$lcn), decreasing = T)[1:10]

sort(summary(hways$ncn_ref), decreasing = T)[1:10]

sort(summary(hways$ncn), decreasing = T)[1:10]

sort(summary(hways$towpath), decreasing = T)[1:10]

t1 <- read.csv("tables/table-osm-attributes.csv")
library(knitr)
kable(t1, )
