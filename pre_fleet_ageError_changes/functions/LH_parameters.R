##########################################################
# Parameter values based on 2013 Petrale Sole Assessment #
##########################################################

#Life-History Parameters
sexes <- 2
ages  <- 41 
num.ages <- ages-1
len.step <- seq(4, 78, 2)      ; mid.len.step <- seq(5, 79, 2)  
data.len.step <- len.step #seq(12,62,2)
bin <- length(len.step)

#steep       <- 0.85 # This is estimated in the PS 2013 model, check what the prior is       
m.f.mean    <- 0.15     ; m.m.mean    <- 0.16 
wght.coef.f <- 2.08e-6  ; wght.coef.m <- 3.05e-6
wght.exp.f  <- 3.47     ; wght.exp.m  <- 3.36
L1f.mean    <- 16       ; L1m.mean    <- 16  
L2f.mean    <- 54       ; L2m.mean    <- 43              
kf.mean     <- 0.134    ; km.mean     <- 0.202
CV1         <- 0.15     ; CV2         <- 0.05
a3          <- 2        ; a4          <- 40 #17 Changed to fix the growth curves   
ohm3        <- -0.743   ; ohm4 		  <- 33   
ohm5        <- 1        ; ohm6        <- 0
mat.age     <- 3 #This is the assessment value for the ctl file for 1st mature age 
a.linear    <- a3 #floor(a3) + 1

# Selectivity parameters 
# The values below are the summer north fishery (2P) (fsp5 & fsp6 are set to -999)
# The survey values are for the NWFSC survey
# The petrale assessment has differential selectivity by sex but currently ignoring it
fsp1        <- c(52,39)       ; ssp1        <- c(42, 36)
fsp2        <- c(3, 3)        ; ssp2        <- c(3, 3)
fsp3        <- c(5, 3.2)      ; ssp3        <- c(5, 4.5)  
fsp4        <- c(14, 14)      ; ssp4        <- c(14, 14)
fsp5        <- c(-999, -999)  ; ssp5        <- c(-999, -999) 
fsp6        <- c(-999, -999)  ; ssp6        <- c(-999, -999)
 
#Solved using put code name here
Fmsy <- 0.25 # DUMMY VALUE!!!!!!!!!!!!!!!!!!!!!!   