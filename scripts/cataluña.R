# Lee datos extraídos de la Wikipedia española
library(ggplot2)

data.2015 <- read.table("data/Cataluña-2015.dat")
data.2016 <- read.table("data/Cataluña-2016.dat")
data.2017 <- read.table("data/Cataluña-2017.dat")

data <- data.frame(visitas.2015=data.2015$V1, visitas.2016=data.2016$V1, visitas.2017=data.2017$V1, 
                   ratio1=data.2017$V1/data.2016$V1, ratio2=data.2016$V1/data.2015$V1 )

print(mean(data$visitas.2017))
print(mean(data$visitas.2016))
print(mean(data$visitas.2015))

data.test <- wilcox.test(data$visitas.2017,data$visitas.2016)
if (data.test$p.value < 0.05) {
    print("Medias diferentes")
}

data.test.2 <- wilcox.test(data$visitas.2015,data$visitas.2016)
if (data.test.2$p.value < 0.05) {
    print("Medias diferentes")
}
dias.sept <- paste0(1:30,c("/09"))
dias.oct <- paste0(1:31,c("/10"))

data$dias <- as.Date(c(dias.sept, dias.oct, "01/11"),format="%d/%m")

grafico <- ggplot()+ geom_line(data=data,aes(x=dias,y=visitas.2015,color="2015",group=1))
grafico <- grafico + geom_line(data=data,aes(x=dias,y=visitas.2016,color="2016",group=1)) + geom_line(data=data,aes(x=dias,y=visitas.2017,color="2017",group=1))
grafico <- grafico + theme(axis.text.x = element_text(angle = 90, hjust = 1))
grafico
