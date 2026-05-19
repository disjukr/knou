# R 내장 데이터인 iris 데이터셋의 Sepal.Length 변수만을 추출하여
# 그 합계(sum)를 구하는 코드를 작성하시오.
sum(iris$Sepal.Length)

# 현재 작업 디렉토리에 있는 iris 데이터를 텍스트 파일로 저장하되,
# 값 사이를 탭(tab)으로 구분하여 저장하는 함수와 인자를 기술하시오.
write.table(
  iris,
  file = "102304.txt",
  sep = "\t",
  row.names = FALSE
)
