apply_statistics <- read.csv("/Users/Todd/Desktop/Code Stock/R_FYP/ApplyStatistics.csv", header = TRUE, sep = ",")

# 使用Subset来提取有hifi或者lofi关键字的子集
hifi_subject <- subset(apply_statistics, Group.Type == "hi-fi")
lofi_subject <- subset(apply_statistics, Group.Type == "lo-fi")

# 从hifi和lofi组里选取Trait的后测，然后比较一下他们的平均值
hifi_subject$Post_STAI_S
lofi_subject$Post_STAI_T

mean(hifi_subject$Post_STAI_S)
mean(lofi_subject$Post_STAI_T)

t.test(hifi_subject$Post_STAI_S, lofi_subject$Post_STAI_T)