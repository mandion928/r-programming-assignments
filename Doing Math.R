#############################
# Step 1: Create Matrices

A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)

# Check dimensions
dim(A)

dim(B)

#############################
# Step 2: Determinant of A

detA <- det(A)
print(detA)

#############################
# Step 3: Attempt Inverse of A

invA <- tryCatch(
solve(A),
error = function(e) e$message
)
print(invA)

#############################
# Step 4: Determinant of B

detB <- tryCatch(
det(B),
error = function(e) e$message
)
print(detB)
        
#############################
# Step 5: Attempt Inverse of B

invB <- tryCatch(
solve(B),
error = function(e) e$message
)
print(invB)

# Final comment: 
# Matrix A is square but singular (determinant = 0), so it has no inverse.
# Matrix B is not square (10×100), so neither its determinant nor inverse is defined.