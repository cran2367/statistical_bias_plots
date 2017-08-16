# Reference: https://www.r-bloggers.com/the-devil-of-overfitting/
polynomial <- poly(1:100, degree=10)

base       <- polynomial %*% c(1,2,-6,9, 2, 3, 1, 1, 1, 1)

U    <- 80
days <- 1:U

data <- base + rnorm(100, sd=.5)

### Fitting ###
reg1 <- lm(data[days] ~ days)
reg3 <- lm(data[days] ~ poly(days, 3))
reg4 <- lm(data[days] ~ poly(days, 4))
reg6 <- lm(data[days] ~ poly(days, 6))


### Plotting ###
plot(1:100, data)
lines(1:100, rep(mean(data), 100), col = "black", lwd = 2)

abline(v=U, col = "gray", lty = 3) #Add vertical line at U

lines(1:U, fitted(reg1), col="red")
lines(1:U, fitted(reg3), col="green")
lines(1:U, fitted(reg4), col="blue")
lines(1:U, fitted(reg6), col="brown")

lines((U+1):100, predict(reg1,
                         newdata=data.frame(days=(U+1):100)), col="red", lty = 2, lwd=1.5)
lines((U+1):100, predict(reg3,
                         newdata=data.frame(days=(U+1):100)), col="green", lty = 2, lwd=1.5)
lines((U+1):100, predict(reg4,
                         newdata=data.frame(days=(U+1):100)), col="blue", lty = 2, lwd=1.5)
lines((U+1):100, predict(reg6,
                         newdata=data.frame(days=(U+1):100)), col="brown", lty = 2, lwd=1.5)

