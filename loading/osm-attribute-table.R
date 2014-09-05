# Bicycle path data
# After 'load-osm.R', use this script to build table x on osm attributes

sort(summary(hways$highway), decreasing = T)[1:40]
summary(hways$cycleway)
summary(hways$cycleway)[1] / nrow(hways)

sort(apply(hways, MARGIN = 2, FUN = function(x) length(which(x == ""))))[1:40]
nrow(hways) - .Last.value

nrow(bicycle_all)
summary(bicycle_all$bicycle)
sort(summary(hways$bicycle), decreasing = T)[1:10]

nrow(cways)
summary(cways)
(cnames <-sort(summary(hways$cycleway), decreasing = T)[1:20])
names(cnames)
sort(summary(hways$lcn), decreasing = T)[1:10]

sort(summary(hways$ncn_ref), decreasing = T)[1:50]

sort(summary(hways$ncn), decreasing = T)[1:10]
sort(summary(hways$rcn), decreasing = T)[1:10]

sort(summary(hways$towpath), decreasing = T)[1:10]

sort(summary(hways$cycleway.left), decreasing = T)[1:10]
sort(summary(hways$cycleway.right), decreasing = T)[1:10]
sort(summary(hways$cycleway.oneside), decreasing = T)[1:10]
sort(summary(hways$cycleway.otherside), decreasing = T)[1:10]
sort(summary(hways$oneway.bicycle), decreasing = T)[1:10]
sort(summary(hways$path.bicycle), decreasing = T)[1:10]
sort(summary(hways$path.segregated), decreasing = T)[1:10]

t1 <- read.csv("tables/table-osm-attributes.csv")
library(knitr)
kable(t1, )


# expression resulting

"highway"  =  'cycleway'

OR  "bicycle"  =  'designated'

OR  "cycleway" =  'track' OR  "cycleway" =  'lane' OR  "cycleway" =  'shared' OR  "cycleway" =   'opposite_lane' OR  "cycleway" =   'opposite_track' OR  "cycleway" =   'segregated'  OR  "cycleway" =   'shared_lane' OR  "cycleway" =  'yes'

OR "cycleway:left" = 'lane' OR  "cycleway:left" = 'track'

OR  "cycleway:right" = 'lane' OR  "cycleway:right" = 'track'

OR  "cycleway:oneside" =  'lane'

OR  "cycleway:otherside" =  'lane'

OR  "path.bicycle"  =  'designated'

OR  "ncn_ref" != NULL

OR  "ncn" = 'yes'

OR  "towpath" = 'yes'

OR  "lcn"  =  'yes' OR  "lcn"  =  'cambscc_wisbech_rural'

## just bicycle-specific: final output:
"highway"  =  'cycleway'

OR  "bicycle"  =  'designated'

OR  "cycleway" =  'track' OR  "cycleway" =  'lane' OR  "cycleway" =  'shared' OR  "cycleway" =   'opposite_lane' OR  "cycleway" =   'opposite_track' OR  "cycleway" =   'segregated'  OR  "cycleway" =   'shared_lane' OR  "cycleway" =  'yes'

OR "cycleway:left" = 'lane' OR  "cycleway:left" = 'track'

OR  "cycleway:right" = 'lane' OR  "cycleway:right" = 'track'

OR  "cycleway:oneside" =  'lane'

OR  "cycleway:otherside" =  'lane'

OR  "path.bicycle"  =  'designated'

###


oneway.bicycle
3351251                  3351514
cycleway.oneside             path.bicycle
3351613                  3351625
path.segregated           access.bicycle
3351625                  3351628
cycleway.otherside      bikenorthbirmingham
3351662


