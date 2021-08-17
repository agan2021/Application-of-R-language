#代码 6-1
## 散点图
library('lattice')
xyplot(wt ~ 3.5407*mpg, data = mtcars, ylab = 'Weight', xlab = 'Kilometers per liter', main = 'lattice包绘制散点图')

#代码 6-2
## 1.	图形参数
names(trellis.par.get())  # 查看参数列表的名称

#代码 6-3
op <- trellis.par.get()  # 保存原有的参数列表
trellis.par.get('fontsize')  # 查看字体大小与散点大小的集合
trellis.par.set(fontsize = list(text = 20, points = 20))  # 修改参数
xyplot(wt ~ mpg, data = mtcars, xlab = 'Weight', ylab = 'Miles per Gallon', main = 'lattice包绘制散点图')
trellis.par.set(op)  # 将参数回复为默认设置

#代码 6-4
show.settings()  # 图形化显示所有参数

#代码 6-5
data = data.frame(x = 1:15, y = 11:25, z = rep(c('a', 'b', 'c'), times = 5))
xyplot(y ~ x, data = data, groups = z)  # 根据z列绘制分组的散点图
op <- trellis.par.get()  # 保存原有的参数列表
op_1 <- trellis.par.get()  # 赋值
op_1$superpose.symbol$col  # 查看点的颜色
op_1$superpose.symbol$pch  # 查看点的形状
op_1$superpose.symbol$col <- 'black'  # 修改点的颜色
op_1$superpose.symbol$pch <- 1:10  # 修改点的形状
trellis.par.set(op_1)  # 设置参数列表
xyplot(y ~ x, data = data, groups = z)  # 根据z列绘制分组的散点图
trellis.par.set(op)  # 将参数回复为默认设置

#代码 6-6
## 条件变量
library(lattice)
attach(iris)
xyplot(Sepal.Length ~ Sepal.Width | Species)
detach(iris)

#代码 6-7
## 面板函数
my_panel <- function(x,y){panel.lmline(x, y, col = "red", lwd = 1, lty = 2)  # 为数据增加一条回归线
  panel.loess(x,y)  # 增加一条光滑曲线
  panel.grid(h = -1, v = -1)  # 绘制网格线
  panel.rug(x, y)  # 在面板上增加轴须
  panel.xyplot(x, y)}  # 绘制散点图
xyplot(mpg ~ wt, data = mtcars, xlab = "Weight", ylab = "Miles per Gallon",
       main = "Miles per Gallon on Weight", panel = my_panel)

#代码 6-8
## 分组变量
xyplot(Sepal.Length ~ Sepal.Width, group = Species, data = iris,
       pch = 1:3, col = 1:3, main = 'Sepal.Length VS Sepal.Width',
       key = list(space = "right", title = "Species", cex.title = 1, cex = 1,
                text = list(levels(factor(iris$Species))),
                points=list(pch = 1:3, col= 1:3)))

#代码 6-9
## 图形组合
graph1 <- xyplot(Sepal.Length ~ Sepal.Width | Species, data = iris, main = '栅栏图')
graph2 <- xyplot(Sepal.Length ~ Sepal.Width, group = Species, data = iris, main = '散点图1')
graph3 <- xyplot(Petal.Length ~ Petal.Width, group = Species, data = iris, main = '散点图2')
# split参数
plot(graph1, split = c(1,1,3,1))
plot(graph2, split = c(2,1,3,1), newpage = FALSE)
plot(graph3, split = c(3,1,3,1), newpage = FALSE)
# position参数，绘图效果同上
plot(graph1, position = c(0, 0, 1/3, 1))
plot(graph2, position = c(1/3, 0, 2/3, 1), newpage = FALSE)
plot(graph3, position = c(2/3, 0, 1, 1), newpage = FALSE)

#代码 6-10
## 条形图
barchart(VADeaths, main = 'Death Rates in 1940 Virginia(By Group)')
barchart(VADeaths, groups = FALSE, main = list("Death Rates in 1940 Virginia",cex=1.2))

#代码 6-11
str(Titanic)
as.data.frame(Titanic)

#代码 6-12
# 左图：默认条形图
pic1 <- barchart(Class ~ Freq|Age + Sex, data = as.data.frame(Titanic), groups = Survived, 
                 stack = TRUE, auto.key = list(title = "Survived", columns = 2))
#中图：将x轴坐标设置为free的条形图
pic2 <- barchart(Class ~ Freq|Age + Sex, data = as.data.frame(Titanic), groups = Survived, 
                 stack = TRUE, auto.key = list(title = "Survived", columns = 2), scales = list(x = "free"))
#右图：增加垂直网格线，并将条形边框设置为透明色的条形图
pic3 <- update(pic2, panel=function(...){
  panel.grid(h=0,v=-1)
  panel.barchart(...,border="transparent")
})
plot(pic1, split = c(1,1,3,1))
plot(pic2, split = c(2,1,3,1), newpage = FALSE)
plot(pic3, split = c(3,1,3,1), newpage = FALSE)

#代码 6-13
## 点图
dotplot(VADeaths, pch = 1:4, xlab = 'Death rates per 1000',
                main = list('Death Rates in 1940 Virginia(By Group)', cex = 0.8), 
                key = list(column = 4, text = list(colnames(VADeaths)), points = list(pch = 1:4, col = 1:4)))

#代码 6-14
dotplot(VADeaths, group = FALSE, xlab = 'Death rates per 1000',
                main = list('Death Rates in 1940 Virginia', cex = 0.8))


#代码 6-15
library(lattice)
dotplot(VADeaths, groups = FALSE, layout=c(1,4), origin = 0, type = c("p", "h"),
        main = list("Death Rates in 1940 Virginia",cex=0.8), xlab = "Death rates per 1000")

#代码 6-16
## 直方图
histogram( ~ height | voice.part, data = singer, nint = 17, layout = c(1,8),
           xlab = "Height (inches)")

#代码 6-17
## 核密度图
densityplot( ~ height | voice.part, data = singer, layout=c(1, 8), xlab = "Height (inches)",
            main = "Heights of New York Choral Society singers")

#代码 6-18
# 核密度图的堆放
densityplot( ~ height, group = voice.part, data = singer, xlab = "Height (inches)",
             main = "Heights of New York Choral Society singers", plot.points = FALSE,
            lty = 1:8,col = 1:8, lwd = 1.5, key = list(text = list(levels(singer$voice.part)),
                                             column = 4, lines = list(lty = 1:8, col = 1:8)))

#代码 6-19
## 直方图与核密度图组合
histogram( ~ height | voice.part, data = singer,
           xlab = "Height (inches)", type = "density",
           panel = function(x, ...) {
             panel.histogram(x, ...)
             panel.mathdensity(dmath = dnorm, col = "black",
                               args = list(mean=mean(x),sd=sd(x)))
           })

#代码 6-20
## 带状图
stripplot(~ height, group = voice.part, data = singer, xlab = "Height (inches)",
          main = "Heights of New York Choral Society singers",
          subset = (voice.part == "Bass 2"), jitter.data = TRUE)

#代码 6-21
## QQ图
qqmath(~ height | voice.part, data = singer, prepanel = prepanel.qqmathline,
       panel = function(x, ...) {
         panel.qqmathline(x, ...)
         panel.qqmath(x, ...)
       })

#代码 6-22
qq(voice.part ~ height, aspect = 1, data = singer,
   subset = (voice.part == "Bass 2" | voice.part == "Tenor 2"))

#代码 6-23
## 箱线图
pic1 <- bwplot( ~ height | voice.part, data=singer, xlab="Height (inches)")
pic2 <- bwplot(voice.part ~ height, data=singer, xlab="Height (inches)")
plot(pic1, split = c(1, 1, 2, 1))
plot(pic2, split = c(2, 1, 2, 1), newpage = FALSE)

#代码 6-24
## 散点图
xyplot(Sepal.Length~Sepal.Width|Species,data=iris)

#代码 6-25
## 散点矩阵图
splom(iris[, 1:4], groups = iris$Species, pscales = 0, pch = 1:3, col = 1:3, varnames = colnames(iris)[1:4],
      key = list(columns = 3, text = list(levels(iris$Species)), points = list(pch = 1:3, col = 1:3)))

#代码 6-26
## 三维水平图
library(lattice)
data(Cars93, package = "MASS")
cor.Cars93 <-cor(Cars93[, !sapply(Cars93, is.factor)], use = "pair")
levelplot(cor.Cars93, scales = list(x = list(rot = 90)))

#代码 6-27
## 三维等高线图
contourplot(volcano, cuts = 20)

#代码 6-28
## 三维散点图
par.set <-list(axis.line = list(col = "transparent"), clip = list(panel = "off"))  # 去除面板边框/不削减面板范围
cloud(Sepal.Length ~ Petal.Length * Petal.Width, data = iris, groups = Species, 
      pch = 1:3,col= 1:3,   # 点颜色及样式
      screen = list(z = 20, x = -70, y =0),  # 调节三维散点图的展示角度
      par.settings = par.set, 
      scales = list(col = "black"),  # 加箭头指示
      key=list(column=3, text=list(levels(iris$Species)), points = list(pch = 1:3, col = 1:3)))

#代码 6-29
## 三维曲面图
par.set <-list(axis.line = list(col = "transparent"), clip = list(panel = "off"))  # 去除面板边框/不削减面板范围
wireframe(volcano, shade = TRUE, par.settings = par.set, aspect = c(61/87, 4/10))





