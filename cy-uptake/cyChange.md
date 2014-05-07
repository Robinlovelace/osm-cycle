Investment in cycling infrastructure growth in bicycle commuting: what's the link? 
========================================================


# Introduction

Cycling has many benefits. These include,

- improved health \citep{}
- economic savings at the individual level (e.g. lower expenditure on public transport,
car fuel and gym fees) and for society at large (e.g. reduce dependence on imported fuels)
- reduction in congestion during rush hour - this is a particular benefit of cycle commuting
as opposed to leisure cycling that would have knock-on benefits
in terms of time savings for other commuters, traffic flow and energy use.
- bicycles pose a lower risk to other road users than do cars
- 'wide boundary' impacts including heightened sociability of public space and
the hope that society may one day be able to operate without burning valuable finite resources.

Due to the breadth and strength of these benefits, there has been
a noticeable increase in political commitment to cycling in many countries
in recent years \citep{}. In the UK, for example, Prime Minister David 
Cameron announced that "we want to see cycling soar"
([Prime Minister's Office, 2013](https://www.gov.uk/government/news/government-shifts-cycling-up-a-gear))
as well as providing
a more specific statement of intent: "This government wants to make it easier and safer for people who already cycle
as well as encouraging far more people to take it up" (ibid). However, a major barrier to
increasing the rate of cycling in many areas, assuming that funding and political will are abundant,
is the paucity of specific and quantitative evidence about what works.

The purpose of this paper is to help fill this knowledge gap by analysising the change in
bicycle commuting across administrative zones across the UK. A geographically weighted regression
methodology will be used to estimate how effective different types of intervention - including
investment from the Cycling Demonstration Towns (CDT) initiative and number of cycle paths - have been.

# Data

Census data on commuting provide the highest spatial resolution of
transport data in the UK, down to the level of Output Areas, consisting
of roughly 100 households each. The decadal Census of population also has the highest response
rate and number of participants of any national survey, due to the nationwide coverage
of the census and the legal requirement to complete it. Offering many opportunities
to transport researchers. The downsides to census data are that it only incorporates one
reason for trip (commuting) and its poor temporal resolution. However, recent work
shows that the modal split for commuting is highly correlated with
modal split for all trips (r > 0.9 for private modes and public transport, dropping to r = 0.77
for cycling), suggesting that commuting is a reasonable proxy for travel behaviour overall
\citep{Goodman2013}. In addition, the annual publication of results from the [National
Travel Survey](https://www.gov.uk/government/collections/national-travel-survey-statistics)
provide higher temporal resolution to complement the 10 year cycle of the census.

The input data for this study were tables of commuter mode share by administrative zone
between the 2001 and 2011 Census of population. In line with the principle of parsimony,
the modelling approach was to start simple (with large geographical zones)
and move to analyse higher resolution spatial datasets as the analysis progressed.

A GIS problem that had to be overcome early in the analysis was the conversion
of 2011 Local Authority areas into 2001 Local authority areas.
As shown in Fig. x, there are 8 new local authorities which encapsulate
many smaller areas from the 2001 administrative zones.

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 




# Method




```r
summary(cars)
```

```
##      speed           dist    
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120
```


You can also embed plots, for example:


```r
plot(cars)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


