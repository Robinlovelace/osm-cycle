# Leeds plotting
library(rgdal)
plot(la11)
plot(la11[ la11$NAME == "Leeds", ])
str(la11[ la11$NAME == "Leeds", ])

msoas <- readOGR("/media/SAMSUNG/geodata/UK2011boundaries/england-msoas/", "England_msoa_2011_sgen_clipped")
head(msoas@data)

points(msoa.point)

head(msoa@data)
msoa.leeds <- msoa[ grepl("Leeds", msoa$NAME), ]
# msoa.leeds <- msoas[ grepl("Leeds", msoas$NAME), ]
plot(msoa.leeds)
head(msoa.leeds@data)
msoa.leeds$id <- msoa.leeds$CODE

msoa.leeds@data <- join(msoa.leeds@data, msoa@data, by="CODE")
head(msoa.leeds@data)

msoa.leeds <- spTransform(msoa.leeds, CRS("+init=epsg:4326"))
head(msoa.leeds@data)

msoa.leeds.f <- fortify(msoa.leeds, region="id")
head(msoa.leeds.f)
msoa.leeds.f <- merge(msoa.leeds.f, msoa.leeds@data, by="id")
save(msoa.leeds.f, msoa.leeds,  file="updata/leedsmsoaplot.RData")

bbox(msoa.leeds)

library(ggmap)
ggplot() + 
  geom_polygon(data = msoa.leeds.f, aes(long, lat, group=group, fill=Abs.Growth),
               alpha=0.5) +  scale_fill_gradient2(low="red", mid="grey", high="green", name = "Change in\ncycling (%)") +
  #   scale_fill_continuous(limits=c(-40, 0, 120) low="red", high = "green") + 


ggmap(get_map(bbox(msoa.leeds))) + 
  geom_polygon(data = msoa.leeds.f, aes(long, lat, group=group, fill=Abs.Growth),
               alpha=0.8) +  
  scale_fill_gradient2(low="red", mid="grey", high="green", name = "Change in\ncycling (%)")
