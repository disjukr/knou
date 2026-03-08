# R 실습 준비

## ggplot2 설치

R 또는 RStudio 콘솔에서 아래 명령을 실행합니다.

```r
install.packages("ggplot2", repos = "https://cloud.r-project.org")
install.packages("forcats", repos = "https://cloud.r-project.org")
library(ggplot2)
library(forcats)
```

## 설치가 안 될 때

Windows에서 기본 라이브러리 폴더에 쓰기 권한이 없으면 사용자 라이브러리에 설치하면 됩니다.

```r
lib <- Sys.getenv("R_LIBS_USER")
dir.create(lib, recursive = TRUE, showWarnings = FALSE)
install.packages("ggplot2", lib = lib, repos = "https://cloud.r-project.org")
.libPaths(c(lib, .libPaths()))
library(ggplot2)
```

## 설치 확인

아래 명령이 버전을 출력하면 정상입니다.

```r
packageVersion("ggplot2")
```
