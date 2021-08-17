#代码 3-29
# 字符串查询
txt <- c("Whatever", "is", "worth", "doing", "is", "worth", "doing", "well")
# grep()函数
grep("e.*r|wo", txt,fixed = FALSE)  # 查询含有"e...r"或"wo"的字符串，返回匹配项下标
# grepl()函数
grepl("e.*r|wo", txt)  # 返回一个逻辑向量，TRUE表示匹配
# gregexpr()函数
gregexpr("e.*r|wo", txt)  # 返回一个列表，结果包括匹配项的起始位置及匹配项长度
# regexec()函数
regexec("e.*r|wo", txt)  # 结果与gregexpr()函数相同
# regexpr()函数
regexpr("e.*r|wo", txt)  # 返回匹配项的起始位置及匹配项长度

#代码 3-30
# 字符串替换
txt <- c("Whatever", "is", "worth", "doing", "is", "worth", "doing", "well")
sub("[tr]", "k", txt)  # 各分量第一个"t"或"r"替换为"k"

#代码 3-31
# 字符串替换
txt <- c("Whatever", "is", "worth", "doing", "is", "worth", "doing", "well")
gsub("[tr]", "k", txt)  # 所有"t"和"r"替换为"k"

#代码 3-32
# 字符串拆分
data <- c("2016年1月1日", "2016年2月1日")
strsplit(data, "年")  # 以"年"为分隔符拆分字符串，字符串拆分后以列表形式存储
strsplit(data, "年")[[1]][1]  # 提取列表中的元素

#代码 3-33
# 字符串连接
paste("AB", 1:5, sep = "")  # 将"AB"与向量1:5连接起来
x <- list(a = "1st", b = "2nd", c = "3rd")
y <- list(d = 1, e = 2)
paste(x, y, sep = "-")  # 用符号"-"连接x与y，较短的向量被循环使用
paste(x, y, sep = "-", collapse = "; ")  # 设置collapse参数，连成一个字符串
paste(x, collapse = ", ")  # 将x的各分量连接为一个字符串，符号", "为各分量的分隔符
