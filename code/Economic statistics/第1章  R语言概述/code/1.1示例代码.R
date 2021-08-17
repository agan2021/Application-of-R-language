#代码 1-1
install.packages("installr")
require(installr)          #load / install+load installr
updateR()

#代码 1-2
a <- 'Hello world!'
a
'Hello world!' -> b
b
plot(1:10, col = 'red')  # 此时，参数设置使用=