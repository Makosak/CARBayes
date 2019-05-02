## Notes

Using Lee's CARBayes R Package and Tutorial:

Lee, D. (2013). CARBayes: an R Package for bayesian spatial modeling with conditional autoregressive priors. Journal of Statistical Software, 55(13), 1-24


## Model
The final dissimilarity model in this example has the following levels and specifications:

### Likelihood model :
  Poisson (log link function) 	
  Yk ~ Poisson (Ek,Rk)

### Random effects model : 
  Localised CAR 	
  ~ N 

### Dissimilarity metrics : 
  Z.LUNG (using population count per unit area)
{ wkj | k ~ j }

### Regression equation :
[1] "LUNG[OBS] ~ offset(log(LUNGEXP))"
ln(Rk) =   

Part of M. Kolak's grad work at ASU (2016)