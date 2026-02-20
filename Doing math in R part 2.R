# -----------------------------
# Question 1: Matrix operations

A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

A
B

# a) A + B
A_plus_B <- A + B
A_plus_B

# b) A - B
A_minus_B <- A - B
A_minus_B

# ---------------------------------------
# Question 2: Diagonal matrix with diag()

D <- diag(c(4, 1, 2, 3))
D

# ---------------------------------------
# Question 3: Build the required matrix

M <- diag(3, 5)

M[1, ] <- c(3, 1, 1, 1, 1)

M[-1, 1] <- 2

M