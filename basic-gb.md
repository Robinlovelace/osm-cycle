OSM-GB - basic analysis of the dataset
========================================================

This vignette describes how to load-in and undertake basic analysis of cycle 
path data in OSM.

## Accessing the data

### Downloading sections of planet.osm

Planet.osm is the name of the entire world, as represented in a single, large (~32 Gb)
xml file. Clearly this is not easy to download or process so we downloaded sections.

The file "great-britain-latest.osm.pbf" was downloaded from [geofabrik](http://download.geofabrik.de/europe/great-britain.html) on 10th March 2014. Another possible solution would be 
to use the "overpass" API, but this approach has not yet been attempted.

This file has a compressed size of 611 Mb, and is constantly growing due to new 
additions to the map from the OSM community. Clearly, this is a large file to manage, 
so the first stage was to filter out all of the information except for cycleways. 
This was done using the following command.

```{bash}
osmosis --read-pbf great-britain-latest-10-03-2014.osm.pbf --tf accept-ways highway=cycleway --used-node --write-xml gb-cways.osm
```

This command took 5 minutes to run on a 3rd generation Core i5 laptop computer with 12 Mb of RAM.
The resulting file was 260 Mb in size. It was decided that a further subset would be taken of this file, to facilitate fast preliminary analysis. To start with, we took the bounding box 
encapsulating Leeds and Nottingham, the home locations of the authors and where
the cycle network is best understood in intuitive terms.

```{bash}
osmosis --read-xml gb-cways.osm --bounding-box top=53.2 left=-1.8 bottom=52.7 right=-1.3 --write-xml NottLeedsCways.osm
```
This resulted in a file that was a more manageable size: 4 Mb.

### Using the Overpass API

The [Overpass API](http://wiki.openstreetmap.org/wiki/Overpass_API) allows specific
parts of the planet.osm file to be accessed and downloaded directly, using its 
own language of filters. To download all cycle paths in the UK, for example, 
the following query can be used:

```{bash}
http://overpass-api.de/api/interpreter?[timeout:600];data=(way(poly:"51.33770 
1.983960 50.10375 0.05807600 49.89032 -1.246113 49.77612 -2.027284 
49.76352 -2.020900 49.76171 -2.031990 49.10263 -1.808598 49.00443 
-1.835368 49.15592 -3.940324 49.70097 -7.024780 52.78017 -5.441616 
53.77268 -5.206178 54.86510 -5.488813 55.33747 -6.208707 55.45018 
-6.730561 57.73276 -9.408655 58.20977 -9.077830 60.34515 -4.158581 
61.13564 -1.637515 61.1030 -0.2670265 59.76591 0.1278457 59.42198 
0.09781600 55.79959 0.7998970 54.43427 1.702395 52.58000 
2.250000")[highway=cycleway];);<;>;out meta;
```

Many thanks to Toni Hernandez at the 
[SIGTE](http://www.sigte.udg.edu/sigte_en/) service of the University 
of Girona for demonstrating this method. 

This resulted in a 16 Mb .pbf file. This was converted to an osm file using osmconvert:







