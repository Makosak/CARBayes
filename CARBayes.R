library(shapefiles)
library(sp)
library(maptools)
library(splines)
library(spdep)
library(CARBayes)

counties.mp <- readShapePoly("counties-maptools")

# Create simple binary contiguity weight
W.nb <- poly2nb(counties.mp, row.names = rownames(counties.mp))
W.mat <- nb2mat(W.nb, style = "B")

# Create dissimilarity index using spatial weight
Z.LUNG <- as.matrix(dist(cbind(counties.mp$POPULATION, 
counties.mp$POPULATION), method = "manhattan", diag = TRUE, 
upper = TRUE)) * W.mat/2

form <- "LUNG ~ offset(log(LUNGEXP))"

##Spatial Model 
model.dissimilarity <- S.CARdissimilarity(formula=form, data = counties.mp,
family="poisson", W = W.mat, Z = list(Z.LUNG = Z.LUNG), burnin = 20000, 
n.sample = 100000, thin = 10)

model.dissimilarity
summary(model.dissimilarity)

##plot final results
border.locations <- model.dissimilarity$W.summary$W.posterior
risk.estimates <- model.dissimilarity$fitted.values/counties.mp$LUNGEXP
counties.mp@data <- data.frame(counties.mp@data, risk.estimates)

spplot(counties.mp, "risk.estimates", scales = list(draw = TRUE),
at = seq(min(risk.estimates) - 0.1, max(risk.estimates) + 0.1, length.out = 8),
col.regions = c("#cdb79e","#cccccc", "#949494", "#4a4a4a", "#a37ff0","#5d3ce9", "#e95d3c"))

