# Load cleaned data 
df <- read.csv("C:\\Users\\yazee\\OneDrive - Sri Lanka Institute of Information Technology (1)\\Y3S1\\IT3011 - TPSM\\TPSM - Assignment\\cleaned_student_data.csv")

df$FinalGrade <- as.factor(df$FinalGrade)

# run pearson correlation between all 5 reflection proxies and examscore
cor.test(df$StudyHours, df$ExamScore, method = "pearson")
cor.test(df$Attendance, df$ExamScore, method = "pearson")
cor.test(df$Discussions,df$ExamScore, method = "pearson")
cor.test(df$Motivation, df$ExamScore, method = "pearson")
cor.test(df$AssignmentCompletion,df$ExamScore, method = "pearson")

# run spearman correlation between all 5 reflection proxies and finalgrade
cor.test(df$StudyHours, as.numeric(df$FinalGrade), method = "spearman")
cor.test(df$Attendance, as.numeric(df$FinalGrade), method = "spearman")
cor.test(df$Discussions,as.numeric(df$FinalGrade), method = "spearman")
cor.test(df$Motivation, as.numeric(df$FinalGrade), method = "spearman")
cor.test(df$AssignmentCompletion,as.numeric(df$FinalGrade), method = "spearman")

# Independent Samples T-test 
t.test(ExamScore ~ Discussions, data = df)

model <- aov(ExamScore ~ FinalGrade, data = df)
summary(model)

# Post-hoc test — tells you WHICH groups differ from each other
TukeyHSD(model)