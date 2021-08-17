#代码 1-7
head(iris)

#代码 1-8
data() #列出已载入的包中的所有数据集。

#代码 1-9
data(package = .packages(all.available = TRUE))  # 列出已安装的包中的所有数据集
head(Cars93)  # 由于Car93数据集不在基础包内，无法直接调用
data(Cars93, package="MASS")  # 加载Car93数据集
head(Cars93)  # 查看Car93数据集前6列数据
