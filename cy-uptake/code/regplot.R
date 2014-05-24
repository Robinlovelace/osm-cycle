# regression plotting
library(ggplot2)
plotmatrix(la)
library(GGally)
ggpairs(la)
ggpairs(la[-2])
ggsave("figure/ggpairs.pdf")