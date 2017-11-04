# Lee datos extraídos de la Wikipedia española
data.2016 <- read.table("data/Cataluña-2016.dat")
data.2017 <- read.table("data/Cataluña-2017.dat")

data <- data.frame(visitas.2016=data.2016$V1, visitas.2017=data.2017$V1, ratio=data.2017/data.2016)
print(mean(data.2017$V1))
print(mean(data.2016$V1))
print(mean(data$visitas.2017))
print(mean(data$visitas.2016))

data.test <- wilcox.test(data$visitas.2017,data$visitas.2016)
if (data.test$p.value < 0.05) {
    print("Medias diferentes")
}
