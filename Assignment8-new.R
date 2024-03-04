assignment6 <- read.table("Assignment6Dataset.txt", header = TRUE, sep = ",")
print(assignment6)
colnames(assignment6)

studentAverage_sex = ddply(assignment6,"Sex",transform,Grade.Average=mean(Grade))
print(studentAverage_sex)

studentAverage_age = ddply(assignment6,"Age",transform,Grade.Average=mean(Grade))
print(studentAverage_age)

names = assignment6$Name
print(names)

i_students <- subset(assignment6, grepl("i", assignment6$Name, ignore.case=T))
print(i_students)

i_studentAverage_sex = ddply(i_students,"Sex",transform,Grade.AverageSex=mean(Grade))
print(i_studentAverage_sex)

i_studentAverage_age = ddply(i_students,"Age",transform,Grade.AverageAge=mean(Grade))
print(i_studentAverage_age)

i_studentAverage_sex_age = ddply(i_students,"Sex",transform,Grade.AverageSex=mean(Grade))
i_studentAverage_sex_age = ddply(i_studentAverage_sex_age,"Age",transform,Grade.AverageAge=mean(Grade))
print(i_studentAverage_sex_age)

write.table(i_studentAverage_sex_age,"output.csv",sep = ",",row.names = FALSE)


