# analysis for pedallers

# where does Leeds fit in the national picture and relative to neighbouring LAs?

lam[ lam$Abs.Growth > 0.4, ]
names(lam)

lam[lam$Abs.Growth > 0.4, c("NAME", "Abs.Growth")]

head(lam[ order(lam$Abs.Growth, decreasing=T), c("NAME", "Abs.Growth") ], 40)

# Map of spatial distribution of cycling uptake

# Correlation between income estimates and dep and cycling/growth in cycling.
