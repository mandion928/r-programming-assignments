# Module 7

data("mtcars")

cat("== STEP 1: DATA ==\n")
print(head(mtcars, 6))

cat("\n== STEP 2: GENERIC FUNCTIONS CHECK ==\n")
cat("class(mtcars): ", paste(class(mtcars), collapse = ", "), "\n", sep = "")
cat("typeof(mtcars): ", typeof(mtcars), "\n", sep = "")
cat("isS4(mtcars): ", isS4(mtcars), "\n", sep = "")

cat("\nIs 'summary' an S3 standard generic? ", isS3stdGeneric("summary"), "\n", sep = "")
cat("Methods for 'summary':\n")
print(methods("summary"))
cat("\nsummary(mtcars):\n")
print(summary(mtcars))

cat("\n== BLOG QUESTIONS (QUICK OUTPUT) ==\n")
cat("OO system (S3 vs S4): use isS4(x); S3 typically isS4(x)=FALSE and has class().\n")
cat("Base type: typeof(x) (plus str(x) for structure).\n")
cat("Generic function: dispatches methods based on class (e.g., summary(), print()).\n")
cat("S3 vs S4: S3 is informal (class tag); S4 is formal (setClass, slots, type checking).\n")

cat("\n== STEP 3: S3 EXAMPLE ==\n")
mycars <- list(data = mtcars, source = "datasets::mtcars")
class(mycars) <- "car_data"

print.car_data <- function(x, ...) {
  cat("S3 'car_data' | source:", x$source,
      "| dims:", nrow(x$data), "x", ncol(x$data), "\n")
  invisible(x)
}

summary.car_data <- function(object, ...) {
  out <- list(
    source = object$source,
    dims = dim(object$data),
    numeric_summary = summary(object$data)
  )
  class(out) <- "summary.car_data"
  out
}

print.summary.car_data <- function(x, ...) {
  cat("Summary for S3 'car_data'\n")
  cat("source:", x$source, "\n")
  cat("dims:", x$dims[1], "x", x$dims[2], "\n\n")
  print(x$numeric_summary)
  invisible(x)
}

print(mycars)
print(summary(mycars))
cat("isS4(mycars): ", isS4(mycars), "\n", sep = "")
cat("typeof(mycars): ", typeof(mycars), "\n", sep = "")
cat("class(mycars): ", paste(class(mycars), collapse = ", "), "\n", sep = "")

cat("\n== STEP 3: S4 EXAMPLE ==\n")
setClass(
  "CarData",
  slots = c(
    data = "data.frame",
    source = "character"
  )
)

setMethod("show", "CarData", function(object) {
  cat("An object of class 'CarData'\n")
  cat("source:", object@source, "\n")
  cat("dims:", nrow(object@data), "x", ncol(object@data), "\n")
})

mycars4 <- new("CarData", data = mtcars, source = "datasets::mtcars")
mycars4
cat("isS4(mycars4): ", isS4(mycars4), "\n", sep = "")
cat("typeof(mycars4): ", typeof(mycars4), "\n", sep = "")
cat("class(mycars4): ", paste(class(mycars4), collapse = ", "), "\n", sep = "")

cat("\n== EXTRA: HOW TO TELL SYSTEM + TYPE ==\n")
check_obj <- function(x, name = "object") {
  cat("\n--", name, "--\n")
  cat("isS4:", isS4(x), "\n")
  cat("class:", paste(class(x), collapse = ", "), "\n")
  cat("typeof:", typeof(x), "\n")
  cat("str:\n")
  str(x)
}

check_obj(mtcars, "mtcars")
check_obj(mycars, "mycars (S3)")
check_obj(mycars4, "mycars4 (S4)")