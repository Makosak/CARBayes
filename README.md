Sample code

Using Lee's CARBayes R Package:

Lee, D. (2013). CARBayes: an R Package for bayesian spatial modeling with conditional autoregressive priors. Journal of Statistical Software, 55(13), 1-24




The final dissimilarity model thus has the following levels and specifications:

Likelihood model :
Poisson (log link function) 	
Yk ~ Poisson (Ek,Rk)

Random effects model : 
Localised CAR 	
~ N 

Dissimilarity metrics : 
  Z.LUNG (using population count per unit area)
{ wkj | k ~ j }

Regression equation :
[1] "LUNG[OBS] ~ offset(log(LUNGEXP))"
ln(Rk) =   



Result examples:

summary(model.dissimilarity)

                   		Length Class  	Mode     
summary.results      	18    -none- 	numeric  
samples               	5    -none-	list     
fitted.values       	156    -none- 	numeric  
residuals           		156    -none- 	numeric  
modelfit             		3    -none- 	numeric  
accept                		4    -none- 	numeric  
localised.structure   	2    -none- 	list     
formula               	1    -none- 	character
model               		5    -none- 	character
X                		156    -none- 	numeric  



> model.dissimilarity

#################
#### Model fitted
#################
Likelihood model - Poisson (log link function) 
Random effects model - Localised CAR 
Dissimilarity metrics -  Z.LUNG 
Regression equation - [1] "LUNG ~ offset(log(LUNGEXP))"

############
#### Results
############
Posterior quantiles and DIC

          		 Median    	2.5%  		97.5% 	n.sample        % accept 	alpha.min
(Intercept) 	0.0081 		-0.0060 	0.0218      800     	60.0        NA
tau2        	0.0919  		0.0675 		0.1263      800    	100.0        NA
Z.LUNG     	 0.0000  	0.0000 		0.0000      800    	 65.4         0

DIC =  1342.147       p.d =  113.7895

