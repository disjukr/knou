# 벡터 생성: 숫자를 직접 나열
c(3,4,5,6,7)

# 벡터 생성: 3부터 7까지 연속된 값 생성
c(3:7)

# 문자형 벡터 생성
c("1","KOREA","NATIONAL","OPEN","UNIVERSITY")

# 문자형 벡터를 변수에 저장하고 길이 확인
v1 <- c("1","KOREA","NATIONAL","OPEN","UNIVERSITY")
length(v1)

# 논리형 벡터 생성
c(T,F,T)
c(TRUE,FALSE,TRUE)

# 사용자로부터 값을 입력받아 벡터 생성
scan(sep=",")

# seq() 함수로 규칙적인 수열 생성
seq(from=3, to=7, by=1)
seq(3, 7, 1)
seq(from=3, to=7, length=3)
seq(from=1, by=0.05, along=1:5)
seq(from=1, to=5, along=1:6)

# rep() 함수로 원소 반복
rep(c(1,2), times=2)
rep(c(2,4), times=c(2,1))
rep(c(2,4), each=2)
rep(c(2,4,8), length=5)

# 벡터의 일부 원소 선택
v1 <- c(11:20)
v1[c(3,5)]
v1[v1 > 15]
v1[c(-2,-4)]

# 벡터 값 변경, 추가
v2 <- c(3:7)
replace(v2,2,10)
append(v2,8,after=5)
v3 <- append(v2,8,after=5)

# 여러 함수로 만든 벡터를 정렬, 순위, 정렬 인덱스로 확인
x <- c(rep(3,3),seq(3,7,by=2),rev(seq(3,7,length=3)),rep(4,3))
sort(x)
rank(x)
order(x)

# 행렬 생성 후 길이, 자료형, 차원 확인
matr <- matrix(1:9, nrow=3)
length(matr)
mode(matr)
dim(matr)

# 행 벡터를 묶어서 행렬 만들기
r1 <- c(1,2,3)
r2 <- c(4,5,6)
r3 <- c(7,8,9)
rbind(r1, r2, r3)

# 열 벡터를 묶어서 행렬 만들기
c1 <- c(1:3)
c2 <- c(4:6)
c3 <- c(7:9)
cbind(c1, c2, c3)

# 벡터에 차원을 지정해 행렬로 변환
m1 <- 1:9
dim(m1) <- c(3,3)
m1

# 행 우선(byrow) 방식으로 행렬 생성 및 원소 추출
mat <- matrix(c(1,2,3,4,5,6,7,8,9), ncol=3, byrow=T)
mat[1,]
mat[,3]
mat[mat[,3] > 4, 2]

# 행과 열 이름이 있는 행렬 생성 후 새 열 추가
Height <- c(140,155,142,175)
size.1 <- matrix(c(130,26,110,24,118,25,112,25), ncol=2, byrow=T, dimnames=list(c("Lee", "Kim", "Park", "Choi"), c("Weight", "Waist")))
size <- cbind(size.1, Height)
size

# apply()로 열 평균과 행 평균 계산
colmean <- apply(size, 2, mean)
rowmean <- apply(size, 1, mean)

# sweep()으로 행렬의 각 행 또는 열에 연산 적용
sweep(size, 2, colmean)
sweep(size, 1, rowmean)
sweep(size, 1, c(1,2,3,4), "+")

# 행렬 곱셈, 역행렬, 전치행렬
m1 <- matrix(1:4, nrow=2)
m2 <- matrix(5:8, nrow=2)
m1%*%m2
solve(m1)
t(m1)
