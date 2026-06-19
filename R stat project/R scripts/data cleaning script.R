library(dplyr)

# Load CSV file
data <- read.csv("C:\\Users\\yazee\\OneDrive - Sri Lanka Institute of Information Technology (1)\\Y3S1\\IT3011 - TPSM\\TPSM - Assignment\\student_performance.csv")

# Check dimensions
dim(data)
str(data)
summary(data)

# Check missing values
colSums(is.na(data))

# Check impossible values
data[data$Attendance > 100, ]

# Check duplicates
sum(duplicated(data))

# Remove duplicates
data <- distinct(data)

# Convert FinalGrade to factor
data$FinalGrade <- as.factor(data$FinalGrade)
class(data$FinalGrade)
levels(data$FinalGrade)

# Create 7-column subset
clean_data <- data[, c("StudyHours", "Attendance", "Discussions",
                       "Motivation", "AssignmentCompletion",
                       "ExamScore", "FinalGrade")]

# Remove duplicates again after subsetting
clean_data <- distinct(clean_data)

# Verify
dim(clean_data)
colnames(clean_data)

# Save
write.csv(clean_data, "cleaned_student_data.csv", row.names = FALSE)

# Check current working directory
getwd()

# See if file exists
file.exists("cleaned_student_data.csv")