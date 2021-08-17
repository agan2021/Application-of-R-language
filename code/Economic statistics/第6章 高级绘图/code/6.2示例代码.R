#代码 6-30
## qplot函数
library(ggplot2)
qplot(Species, Sepal.Length, data = iris, geom = "boxplot", fill = Species,
      main = "依据种类分组的花萼长度箱线图")

#代码 6-31
qplot(Species, Sepal.Length, data = iris, geom = c("violin", "jitter"), fill = Species,
      main = "依据种类分组的花萼长度小提琴图")

#代码 6-32
qplot(Sepal.Length, Sepal.Width, data = iris, colour = Species, shape = Species,
      main = "绘制花萼长度和花萼宽度的散点图")

#代码 6-33
qplot(Sepal.Length, Sepal.Width, data = iris, geom = c("point", "smooth"), facets = ~Species,
      colour = Species, main = "绘制分面板的散点图")

#代码 6-34
## ggplot2语言逻辑
plot(iris$Sepal.Length, iris$Sepal.Width)
library(ggplot2)
ggplot(data= iris, aes(x = Sepal.Length, y = Sepal.Width)) +  #绘制底层画布
  geom_point(color = "darkred")  #在画布上添加点

#代码 6-35
## ggplot函数
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species, shape = Species)) +  # 底层画布
  geom_point()

#代码 6-36
ggplot(data = iris) +  # 底层画布
  geom_point( aes(x = Sepal.Length, y = Sepal.Width, colour = Species, shape = Species))

#代码 6-37
## 统计变换
ggplot(iris) + 
  geom_bar(aes(x=Sepal.Length), stat="bin", binwidth = 0.5)

#代码 6-38
ggplot(iris) + 
  stat_bin(aes(x=Sepal.Length), geom="bar", binwidth = 0.5)

#代码 6-39
## 标尺
set.seed(1234)  # 设置随机种子
my_iris <- iris[sample(1:150, 100, replace = FALSE),]  # 随机抽样
p <- ggplot(my_iris) + geom_bar(aes(x = Species, fill = Species))
p# 左图
p + scale_fill_manual(
  values = c("orange", "olivedrab", "navy"), # mannual类scale特有的选项，指定图形属性的取值范围
  breaks = c("setosa", "versicolor", "virginica"), # 图例和轴要显示的分段点
  name = "my_Species",  # 图例和轴使用的名称
  labels = c("set", "ver", "vir")  # 图例使用的标签
)# 右图

#代码 6-40
# 修改颜色
#图一：使用scale_color_manual函数
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species))+
  scale_color_manual(values = c("orange", "olivedrab", "navy"))+
  geom_point(size = 2)
#图二:使用scale_color_brewer函数
ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, colour = Species))+
  scale_color_brewer(palette = "Set1")+
  geom_point(size=2)

#代码 6-41
## 坐标系
# 饼图 = 堆叠长条图 + polar coordinates
pie <- ggplot(my_iris, aes(x = factor(1), fill = Species)) +
  geom_bar(width = 1)
pie
pie + coord_polar(theta = "y")
# 靶心图 = 饼图 + polar coordinates
pie + coord_polar()
#锯齿图 = 柱状图 + polar coordinates
cxc <- ggplot(my_iris, aes(x = Species)) +
  geom_bar(width = 1, colour = "black")
cxc
cxc + coord_polar()

#代码 6-42
## 分面
library(ggplot2)
library(tidyr)
library(dplyr)
my_iris1 <- iris %>% gather(feature_name, feature_value, 
                             one_of(c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")))
# facet_grid
ggplot(my_iris1) + 
  geom_violin(aes(x = Species, y = feature_value)) +
  facet_grid(feature_name ~ Species, scales = "free")

#代码 6-43
# facet_wrap
ggplot(my_iris1) +
  geom_violin(aes(x = Species, y = feature_value)) +
  facet_wrap(~ feature_name + Species, scales = "free")

#代码 6-44
## 保存图形
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species))+
  geom_point(size = 2)
ggsave(file = "mygraph.pdf", width = 5, height = 4)






