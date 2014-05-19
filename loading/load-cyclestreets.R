# trying to load the osm cycle data from mysql
library(RODBC)
odbcConnect("/var/lib/mysql/mysql.sock")

library(RMySQL)
con <- dbConnect(dbDriver("MySQL"), user = "root", password = "NDean19", dbname = "routing140513")
## list the tables in the database
dbListTables(con)
mway <- dbReadTable(con, "map_way")
names(mway)
summary(mway$points[3000:3100])

library(devtools)
# devtools::install_github('hadley/dplyr')
library(dplyr)
sessionInfo()

mway2 <- src_mysql("routing140513", host = NULL, port = 0L, user = "root", password = "NDean19")
mwayd <- tbl(mway2, "map_way")
class(mwayd)
head(mwayd)
