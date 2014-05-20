# trying to load the osm cycle data from mysql
library(RODBC)
odbcConnect("/var/lib/mysql/mysql.sock")

library(RMySQL)
con <- dbConnect(dbDriver("MySQL"), user = "root", password = "pw", dbname = "routing140513")
## list the tables in the database
dbListTables(con)
mway <- dbReadTable(con, "map_way")

names(mway)
summary(mway$points[3000:3100])
ps <- dbGetQuery(con, "SELECT astext(points) FROM map_way")
head(ps)

library(devtools)
# devtools::install_github('hadley/dplyr')
library(dplyr)
sessionInfo()

mway2 <- src_mysql("routing140513", host = NULL, port = 0L, user = "root", password = "pw")
mwayd <- tbl(mway2, "map_way")
class(mwayd)
head(mwayd)

# loading mway2
con <- dbConnect(dbDriver("MySQL"), user = "root", password = "pw", dbname = "routing140514")
dbListTables(con)
mway2 <- dbReadTable(con, "map_way")
names(mway)
summary(mway$points[3000:3100])
ps <- dbGetQuery(con, "SELECT astext(points) FROM map_way")
head(ps)

# load the tags data
mwayTags <- dbReadTable(con, "map_way_tags")
head(mwayTags)
mwayBR <- dbReadTable(con, "map_osmBicycleRoute")
head(mwayBR)
dbDisconnect(con)

# load cc routing factors
mwayRF <- dbReadTable(con, "map_routingFactor")
head(mwayRF)
head(mway2)

# load the osm tags
con <- dbConnect(dbDriver("MySQL"), user = "root", password = "pw", dbname = "planetExtractOSM140514")
dbListTables(con)
mwayTag_osm <- dbReadTable(con, "osm_wayTag")
head(mwayTag_osm)
mwayTag_osm$k <- as.factor(mwayTag_osm$k)
summary(mwayTag_osm$k)

save.image("data/cyclestreetDB2.RData")
