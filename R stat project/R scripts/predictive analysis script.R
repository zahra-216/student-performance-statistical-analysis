# Load cleaned data 
df <- read.csv("C:\\Users\\yazee\\OneDrive - Sri Lanka Institute of Information Technology (1)\\Y3S1\\IT3011 - TPSM\\TPSM - Assignment\\cleaned_student_data.csv")

# Re-convert FinalGrade to factor
df$FinalGrade <- as.factor(df$FinalGrade)

# MODEL 1 — Linear Regression (predicting ExamScore)
model1 <- lm(ExamScore ~ StudyHours + Attendance + Discussions +
               Motivation + AssignmentCompletion, data = df)
summary(model1)

# Extract key evaluation metrics
cat("\n--- Linear Regression Model Evaluation ---\n")
cat("R-squared      :", round(summary(model1)$r.squared, 4), "\n")
cat("Adj R-squared  :", round(summary(model1)$adj.r.squared, 4), "\n")
cat("Residual Std Error:", round(summary(model1)$sigma, 4), "\n")

# Residual plot to check model assumptions
plot(model1$fitted.values, model1$residuals,
     main = "Residuals vs Fitted — Linear Regression",
     xlab = "Fitted Values",
     ylab = "Residuals",
     col  = "steelblue",
     pch  = 16)
abline(h = 0, col = "red", lty = 2)
plot.new()

# MODEL 2 — Logistic Regression (predicting Pass/Fail)

# Create PassFail variable
# FinalGrade 0 and 1 = Pass (coded as 0)
# FinalGrade 2 and 3 = Fail (coded as 1)
df$PassFail <- ifelse(df$FinalGrade %in% c("2", "3"), 1, 0)

cat("\nPassFail distribution:\n")
table(df$PassFail)

# Build logistic regression model using all 5 reflection proxies
model2 <- glm(PassFail ~ StudyHours + Attendance + Discussions +
                Motivation + AssignmentCompletion,
              data = df, family = "binomial")

summary(model2)

# ── Predictions and Confusion Matrix ─────────────────────────
predicted_prob  <- predict(model2, type = "response")
predicted_class <- ifelse(predicted_prob > 0.5, 1, 0)

confusion <- table(Predicted = predicted_class, Actual = df$PassFail)
cat("\n--- Confusion Matrix ---\n")
print(confusion)

# Accuracy
accuracy <- sum(diag(confusion)) / sum(confusion) * 100
cat("\nModel Accuracy:", round(accuracy, 2), "%\n")

# ── Odds Ratios ───────────────────────────────────────────────
cat("\n--- Odds Ratios ---\n")
print(round(exp(coef(model2)), 4))