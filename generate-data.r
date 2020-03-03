#Generate the data

# We will use the command mvrnorm to draw a matrix of variables
library(MASS)
# Let's keep it simple, 
mu <- rep(0,4)
Sigma <- matrix(.7, nrow=4, ncol=4) + diag(4)*.3

rawvars <- mvrnorm(n=10000, mu=mu, Sigma=Sigma)

cov(rawvars); cor(rawvars)
# We can see our normal sample produces results very similar to our 
#specified covariance levels.

# No lets transform some variables
pvars <- pnorm(rawvars)

# Through this process we already have 
cov(pvars); cor(pvars)
# We can see that while the covariances have dropped significantly, 
# the simply correlations are largely the same.

plot(rawvars[,1], pvars[,2], main="Normal of Var 1 with probabilities of Var 2") 