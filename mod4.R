#A1
# Frequency of hospital visits
Freq <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)

# Blood Pressure values
bloodp <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)

# First doctor assessment (bad=1, good=0)
first <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)

# Second doctor assessment (low=0, high=1)
second <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)

# Final emergency unit decision (low=0, high=1)
finaldecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)

#A2
# 1 row, 2 columns
par(mfrow = c(1,2))

boxplot(bloodp,
        main="Boxplot of Blood Pressure",
        ylab="Blood Pressure")

hist(bloodp,
     main="Histogram of Blood Pressure",
     xlab="Blood Pressure")
