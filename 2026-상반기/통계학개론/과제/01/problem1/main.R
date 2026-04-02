par(cex = 4)

math_scores <- c(
  85, 92, 78, 90, 68,
  88, 95, 72, 80, 75,
  88, 92, 85, 90, 83,
  79, 82, 87, 90, 93,
  72, 85, 88, 78, 85,
  90, 92, 80, 88, 85,
)
mean(math_scores)
median(math_scores)
min(math_scores)
max(math_scores)

hist(math_scores, main = "수학 점수 히스토그램", xlab = "점수")
boxplot(math_scores, main = "수학 점수 상자그림", ylab = "점수")
