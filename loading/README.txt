*** Road and path data for a "Data Hack" ***

These data were provided by Simon Nuttall from CycleStreets.net
following requests from Robin Lovelace at the University of Leeds.
They are ultimately licensed under the ODBL Licence as they were downloaded
from OpenStreetMap.org: http://opendatacommons.org/licenses/odbl/
The files in this folder were produced by Robin,
who prepocessed the original data to extract the geographic data
(now saved in leedsAll.shp and leedsRoads.geojson).
See https://github.com/Robinlovelace/osm-cycle for more on this.

This data is important because it may help create better cycle infrastructure.
The primary reason for making it widely available is fun and learning but,
if anything exciting does come out of it,
please feel free to contact r.lovelace@ leeds. ac. uk

The description below was written to Simon Nuttall of cyclestreets.net.
Many thanks to www.cyclestreets.net - if you'd like to contribute to their
project - a free bicycle routing app the really works - please contact
info@cyclestreets.net

Robin Lovelace 2014

Original file downloaded from (may now be unnavailble):
wget http://www.cyclestreets.net/routingProject.sql.gz

Then you can create and fill the database using:

mysql -e "create database routing140513 default character set utf8
default collate utf8_unicode_ci;"

gunzip < routingProject.sql.gz | mysql routing140513


Note mainly to self this script builds this dump:
https://github.com/cyclestreets/cyclestreets-setup/commit/633245fce5bd9201a21900795a293d3c46c780d0


You will have three tables:

map_way

with these fields:

id corresponds to OSM ways, eg the first one is 37:
http://www.openstreetmap.org/way/37

wayNameId references the name of the street via a row in map_wayNameId table

lengthMetres The length of the way in metres.

routingFactorId Links to a row in the map_routingFactor table.

flow - The direction that cycling is permitted along the way.

island - Routes can only be found over ways with the same same island number.

points - This is the spatial geometry containing the lat lon of the
points on the way. Inspect using eg. select astext(points) from
map_way where id = 37;

elevations - CSV of elevations at each point

distances - CSV of distances (in metres) between points



map_wayName

id

name



map_routingFactor

This is probably the most complicated table. During the interpretation
of the OSM data lots of inferences are made about the suitability of a
route for cycling. Firstly it is determined whether the way is
cyclable at all, and if not whether it is walkable. The two fields
cyclable and walkable capture these two aspects. Then three other
aspects are captured:

speed - how fast the way can be ridden - mostly affected by the
quality of the riding surface

quietness - depends on large range of factors

pause - a time in seconds representing a delay caused by e.g traffic
signals or a bollard


The table contains only the distinct combinations of these factors and
the map_way rows point to rows in this table.

The color column is used to color the ways on the CycleStreets map
data layer (which should be accessible to you when logged in at eg
http://www.cyclestreets.net/way/37/ by clicking on the blue + symbol
on map top right).

The rfHash column is used during the build to identify each distinct
combination of the five routing factors and at this stage is of no use
to you.
 
