# Step 0: Original helper function and corrected function
# ---------------------------------------------------------

tukey.outlier <- function(x, k = 1.5) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  x < (q1 - k * iqr) | x > (q3 + k * iqr)
}

tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}


# Step 1: Reproduce the result
# ---------------------------------------------------------

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

# Print the test matrix if you want to inspect it
print("Test matrix:")
print(test_mat)

# Run the corrected function
print("Running corrected function:")
tukey_multiple(test_mat)


# Step 2: Diagnose the bug
# ---------------------------------------------------------

# Explanation:
# The issue is the use of &&, which only evaluates the first element
# of a logical vector. Since we need to compare all rows, we must use
# & for element-wise logical operations.


# Step 3: Fix the code
# ---------------------------------------------------------

corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

# Step 4: Validate the fix
# ---------------------------------------------------------

print("Running corrected_tukey function:")
fixed_result <- corrected_tukey(test_mat)
print(fixed_result)

print("Length of returned vector:")
print(length(fixed_result))

# This should return a logical vector of length 10 without error.


# Step 5: Defensive enhancements (optional)
# ---------------------------------------------------------

corrected_tukey_safe <- function(x) {
  if (!is.matrix(x)) {
    stop("x must be a matrix.")
  }
  
  if (!is.numeric(x)) {
    stop("x must be a numeric matrix.")
  }
  
  outliers <- array(TRUE, dim = dim(x))
  
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  
  outlier.vec <- logical(nrow(x))
  
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  
  outlier.vec
}

# Test the safe corrected version
print("Running safe corrected function:")
safe_result <- corrected_tukey_safe(test_mat)
print(safe_result)

print("Length of safe returned vector:")
print(length(safe_result))