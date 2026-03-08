# Load package
library(plyr)

# Step 1: Import the dataset
students <- read.table("Assignment 6 Dataset.txt", header = TRUE, sep = ",")

# Mean Grade using Sex as the category
students_gendered_mean <- ddply(students, "Sex", transform,
Grade.Average = mean(Grade))

# View result
students_gendered_mean

# Write output to a file
write.table(students_gendered_mean, "Students_Gendered_Mean.csv",
sep = ",", row.names = FALSE)

# Step 2: Create a new dataset with names containing i
i_students <- subset(students, grepl("i", Name, ignore.case = TRUE))

# View filtered data
i_students

# Step 3: Write filtered dataset to CSV
write.csv(i_students, "i_students.csv", row.names = FALSE)