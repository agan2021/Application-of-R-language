#代码 7-7
install.packages('RODBC')
library(RODBC)
odbcConnect("ids_user_action","Daniel.xie","xie@iedlan")

#代码 7-8
actionuser <- read.table("clipboard",header = T)#导入剪切板数据
dim(actionuser)
head(actionuser)

#代码 7-9
mydataset <- read.table("./第7章 可视化数据挖掘工具Rattle/正文程序/data/居民储蓄调查数据.sav",header = T)
mydataset <- as.data.frame(mydataset)