# install packages
install.packages("gridExtra")
install.packages("corrplot")

library(dplyr)
library(gridExtra)
library(corrplot)

# Load cleaned data 
clean_data <- read.csv("C:\\Users\\yazee\\OneDrive - Sri Lanka Institute of Information Technology (1)\\Y3S1\\IT3011 - TPSM\\TPSM - Assignment\\cleaned_student_data.csv")
clean_data$FinalGrade <- as.factor(clean_data$FinalGrade)

numeric_cols <- clean_data[, c("StudyHours", "Attendance", "Discussions",
                               "Motivation", "AssignmentCompletion", "ExamScore")]

# 1. Summary Statistics Table 
summary_stats <- data.frame(
  Column  = names(numeric_cols),
  Mean    = round(sapply(numeric_cols, mean),   2),
  Median  = round(sapply(numeric_cols, median), 2),
  SD      = round(sapply(numeric_cols, sd),     2),
  Minimum = round(sapply(numeric_cols, min),    2),
  Maximum = round(sapply(numeric_cols, max),    2)
)

print(summary_stats)

png("summary_table.png", width = 800, height = 300)
plot.new()
grid.table(summary_stats)
dev.off()

# 2. Correlation Matrix 
cor_matrix <- round(cor(numeric_cols), 3)

print(cor_matrix)

png("correlation_table.png", width = 900, height = 400)
plot.new()
grid.table(as.data.frame(cor_matrix))
dev.off()

# 3. Chart 1 — Histogram of ExamScore 
png("chart1_histogram.png", width = 800, height = 600)
hist(clean_data$ExamScore,
     main   = "Distribution of Exam Scores",
     xlab   = "Exam Score",
     ylab   = "Frequency",
     col    = "steelblue",
     border = "white",
     breaks = 6,
     ylim   = c(0, max(hist(clean_data$ExamScore,
                            breaks = 12, plot = FALSE)$counts) * 1.1))
dev.off()

# 4. Chart 2 — Bar Chart of Mean ExamScore by Discussions 
mean_by_disc <- tapply(clean_data$ExamScore, clean_data$Discussions, mean)

png("chart2_barchart.png", width = 800, height = 600)
barplot(mean_by_disc,
        main      = "Mean Exam Score by Discussion Participation",
        xlab      = "Discussions (0 = No, 1 = Yes)",
        ylab      = "Mean Exam Score",
        col       = c("tomato", "steelblue"),
        ylim      = c(0, 100),
        names.arg = c("No (0)", "Yes (1)"))
dev.off()

# 5. Chart 3 — Box Plot of ExamScore by FinalGrade 
png("chart3_boxplot.png", width = 800, height = 600)
boxplot(ExamScore ~ FinalGrade,
        data = clean_data,
        main = "Exam Score Distribution by Final Grade",
        xlab = "Final Grade",
        ylab = "Exam Score",
        col  = c("lightgreen", "steelblue", "orange", "tomato"))
dev.off()

# 6. Chart 4 — Correlation Heatmap
png("chart4_correlation.png", width = 800, height = 600)
corrplot(cor_matrix,
         method      = "color",
         type        = "upper",
         addCoef.col = "black",
         tl.col      = "black",
         title       = "Correlation Matrix",
         mar         = c(0, 0, 1, 0),
         col         = colorRampPalette(c("tomato", "white", "steelblue"))(200),
         cl.lim      = c(-1, 1))
dev.off()

cat("All files saved to:", getwd(), "\n")