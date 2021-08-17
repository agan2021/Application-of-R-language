#代码 4-10
# if-else语句
x <- c("what","is","truth")
if ("Truth" %in% x) {
  print("Truth is found")
} else {
  print("Truth is not found")
}

#代码 4-11
# 嵌套的if-else语句，若a<0,result=0,若0<a<1,result=1,若a>1,result=2
a <- -1
if (a < 0) {
  result = 0
} else if (a < 1) {
  result = 1
} else {
  result = 2
}
result

#代码 4-12
# ifelse语句
x <- c(1, 1, 1, 0, 0, 1, 1)
ifelse(x != 1, 1, 0)  # 如果x的值不等于1，输出1，否则输出0

#代码 4-13
# switch语句
switch(2, mean(1:10), 1:5, 1:10)  # 输出第二个向量
y <- "fruit"
switch(y, fruit = "apple", vegetable = "broccoli", meat = "beef")  # 输出fruit对应的值
