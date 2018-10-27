# Import and examine Bumpus data

rm(list=ls()) #Removes all previous crap.
bumpus<-read.csv("Bumpus_data.csv",header=T)
bumpus.data<-bumpus[,(3:11)] # matrix of linear measurements
sex<-as.factor(bumpus[,1])
surv<-as.factor(bumpus[,2])

#t-tests by sex
t.test(formula=bumpus.data[,1]~surv)
t.test(formula=bumpus.data$totlen~surv)	#MORE INTUITIVE call columns by var. name
plot(sex,bumpus.data$totlen,ylab="Total Length")

t.test(formula=bumpus.data$wingext~sex)	
plot(sex,bumpus.data$wingext,ylab="Wing Extent")

# t-test by survival
t.test(formula=bumpus.data$totlen~surv)	
plot(surv,bumpus.data$totlen,ylab="Total Length")

#correlation tests
cor.test(bumpus.data$totlen,bumpus.data$wingext)
plot(bumpus.data$totlen,bumpus.data$wingext)

#pairwise correlations of all variables
cor.bumpus<-cor(bumpus.data)	

#plot all pairwise
require(graphics) #pairs command requires the graphicas protocol.
pairs(bumpus.data)