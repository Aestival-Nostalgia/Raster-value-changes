#安装Package：
#install.packages("raster") 

设置工作路径
Setwd("E:\")

使用Raster进行栅格数据集的整理
library(raster)

Your_mother_fucker <- file.path("E:", "TEST.tif")
raster(Your_mother_fucker) -> mytiff

# 在R里新建一个raster：
raster(mytiff) -> new

# 获得blocksize:
bs <- blockSize(mytiff)
# 把所有的数据分成很多个block，每个block含有很多个row。这样便于处理大数据。

# 开始写新的tiff文件：
new <- writeStart(new, filename = choose.files(), overwrite = T)
# 仍然弹出一个窗口，在窗口里调整到适当地址新建一个空白tif文件。
# 也可以把choose.files()直接换成想存的文件名"新文件名.tif"。

# 分批处理数据，并写入新文件中，注意，在这个部分，您可以设置一套完整的数据映射
for (i in 1:bs$n) 
	{
	v <- getValues(mytiff, row = bs$row[i], nrows = bs$nrows[i]) 
	v[v == 0] <- 900 
	v[v == 1] <- 900 
	v[v == 2] <- 900
	v[v == 3] <- 900
	v[v == 4] <- 900
	v[v == 5] <- 900
	v[v == 6] <- 900
	v[v == 7] <- 900
	v[v == 8] <- 900
	v[v == 9] <- 900
	v[v == 10] <- 900
	v[v == 11] <- 900
	v[v == 12] <- 900
	v[v == 13] <- 900
	v[v == 14] <- 900
	v[v == 15] <- 900
	v[v == 16] <- 900
	v[v == 17] <- 900
	v[v == 18] <- 900
	v[v == 19] <- 900
	v[v == 20] <- 900
	v[v == 21] <- 900
	v[v == 22] <- 900
	v[v == 23] <- 900
	v[v == 24] <- 900
	v[v == 25] <- 900

	writeValues(new, v, bs$row[i]) 
	}
# 其他可能的处理数据代码：
# 把所有小于等于0的数据改成NA：v[v <= 0] <- NA 
# 所有数据乘以10000：v <- v*10000
# 所有数据向上取整：v <- ceiling(v)
# 更复杂的处理，可能要用循环与挨个处理v中的数值。

# 结束写入：
new <- writeStop(new)
