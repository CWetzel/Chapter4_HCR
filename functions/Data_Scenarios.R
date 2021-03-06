###############################################################################################
#                                      Model Paramters                                        #
#                                                                                             #
#		           Set up basic model parameters for the OM and EM side                       #
#                                                                                             #
###############################################################################################

#Buffer Values for Management
sigma   <- 0.36
p.value <- 0.45
buffer  <- exp(qnorm(p.value, 0, sigma))

f.fleets <- 2
# split between fleets
f.split <- c(0.75, 0.25)

# SS Estimation Parameters
survey.time  <- 0.5
fishing.time <- -1        
max.F 		 <- 4 

# Shift fishery selectivity for senstivitiy 
if (fish.sel.mat){
	fsp = array(NA, dim=c(2, 2, 6))
	fsp[1,1,] = c(39.6,  3,  3.5, 14, -999, -999) #fishery 1 females
	fsp[1,2,] = c(39.6,  3,  3.5, 14, -999, -999) #fishery 1 males
	fsp[2,1,] = c(39.6,  3,  3.5, 14, -999, -999) #fishery 2 females
	fsp[2,2,] = c(39.6,  3,  3.5, 14, -999, -999) #fishery 2 males
}

# Shift fishery selectivity for senstivitiy 
if (fish.sel.pre){
	fsp = array(NA, dim=c(2, 2, 6))
	fsp[1,1,] = c(33,  3,  3, 14, -999, -999) #fishery 1 females
	fsp[1,2,] = c(33,  3,  3, 14, -999, -999) #fishery 1 males
	fsp[2,1,] = c(33,  3,  3, 14, -999, -999) #fishery 2 females
	fsp[2,2,] = c(33,  3,  3, 14, -999, -999) #fishery 2 males
}

# Swith to apply the ageing error matrix
AgeError <- TRUE
#Adjust the max age value that would be used if ageing error is included
max.age = ages - 1
max.age = 40
s.age.wght = f.age.wght = 1

# Survey and Sigma R parameters
Q            <- 3 
ss.survey.cv <- survey.cv  <- 0.20

# Model dimensions
pre.fishery.yrs <- ages - 1 
setup.yrs       <- 50 
project.yrs     <- 80
f.start         <- 25 #start the fishery data x years prior to the first assessment in year 94
s.start         <- 15 #start the fishery data x years prior to the first assessment in year 94
fishery.yrs     <- setup.yrs + project.yrs + 1
total.yrs       <- pre.fishery.yrs + fishery.yrs
start.s.data    <- ages + setup.yrs - s.start
start.f.data    <- c( ages + setup.yrs - f.start, ages + setup.yrs - f.start)
ass.freq        <- 5
years           <- 1:total.yrs 
ass.num         <- (project.yrs / ass.freq ) + 1

# Determine when the data begins
start.fishery.len.samp <- start.fishery.age.samp <- start.f.data
start.survey.len.samp  <- start.survey.age.samp  <- start.s.data 

# Data Available Based on Scenario
# Fishery data availability by fleet
N.f.len = c(50, 30) ;  N.f.age = c(25, 15)  
N.s.len = 50 ; N.s.age = 50 

# Data reduction sensitivity
# original reduction was done by 50% with CV = 0.30
if( reduce.data ){
	N.f.len = floor(0.30 * N.f.len) ;  N.f.age = floor(0.30 * N.f.age)
	N.s.len = floor(0.30 * N.s.len) ;  N.s.age = floor(0.30 * N.s.age)
	ss.survey.cv <- survey.cv  <- 0.35 
}

# Create the sample number vectors
f.len.samp <- f.age.samp <- matrix(0, total.yrs, f.fleets)

for(fleet in 1:f.fleets){
	data.yrs                   <- start.fishery.len.samp[fleet] : total.yrs
	f.len.samp[data.yrs,fleet] <-rep(N.f.len[fleet],length(data.yrs))

	data.yrs                   <- start.fishery.age.samp[fleet] : total.yrs
	f.age.samp[data.yrs,fleet] <- rep(N.f.age[fleet],length(data.yrs))
}

data.yrs   <- start.survey.len.samp : total.yrs
s.len.samp <- c(rep(0,start.s.data - 1), rep(N.s.len,length(data.yrs)))

data.yrs   <- start.survey.age.samp : total.yrs
s.age.samp <- c(rep(0,start.s.data - 1), rep(N.s.age, length(data.yrs)))