setwd("C:/Rdata")
getwd()
library(readxl)
library(stringr)
library(ggplot2)
install.packages("plotrix")
library(plotrix)
tb <- read_xlsx("�½ǰ����оߺ����ⷮ.xlsx")
tb <- as.data.frame(tb)
str(tb)
pie(tb$"2020",labels=tb$...1,
      col=c("#58D883","#CEDB59","#A746CE","#4865D6"), explode=0.1,
      labelcex=0.5, labelrad=0.5)


tb1 <- read.csv("�����½ǰ����оߺ����ⷮ.csv", fileEncoding ="CP949")
head(tb1)
class(tb1)
names(tb1)

xat=seq(1990,2020,by=1) 
yat=seq(0,700,by=20)

ggplot(data=tb1, aes(x=����, y=���ⷮ))+
  geom_line(aes(y=�ѹ��ⷮ), col="#F25E60", size=3)+
  geom_line(aes(y=������),col="#34E200", size=2)+
  geom_line(aes(y=�������),col="#ED9E00", size=2)+
  geom_line(aes(y=���), col="#BD45C1", size=2)+
  geom_line(aes(y=��⹰),col="#007AED", size=2)+
  scale_y_continuous(limits=c(0,800), breaks=seq(0,800, by=100))+
  scale_x_continuous(limits=c(1990,2020), breaks=seq(1990,2020, by=1))+
  xlab("")+
  ylab("")


library(RColorBrewer)
tb2 <- read.csv("����½ǰ������ⷮ.csv", fileEncoding ="CP949")
head(tb2)
ggplot(data=tb2, aes(x=�⵵))+
  geom_line(aes(y=���ѹα�), col = "blue", size=2)+
  geom_line(aes(y=�߱�),col="red",size=2)+
  geom_line(aes(y=�ε�),col="orange",size=2)+
  geom_line(aes(y=�Ϻ�), col="green",size=2)+
  geom_line(aes(y=ĳ����), col="aquamarine",size=2)+
  geom_line(aes(y=�̱�), col="purple",size=2)+
  geom_line(aes(y=����), col="pink1",size=2)+
  geom_line(aes(y=���þ�), col="brown",size=2)+
  geom_line(aes(y=����), col="darkgreen",size=2)+
  scale_y_continuous(limits=c(0,11000), breaks=seq(0,11000, by=1000))+
  scale_x_continuous(limits=c(1990,2020), breaks=seq(1990,2020, by=1))+
  xlab("")+
  ylab("")

tb3 <- read.csv("�½ǰ�����.csv", fileEncoding ="CP949")
tb3

ggplot(data=tb3, aes(x=�⵵))+
  geom_line(aes(y=�ѱ�), col="#272DC6",size=2)+
  geom_line(aes(y=����), col="#ED2FB1",size=2)+
  scale_y_continuous(limits=c(450,550), breaks=seq(450,550, by=20))+
  scale_x_continuous(limits=c(2011,2020), breaks=seq(2011,2020, by=1))+
  ylab("")

library(lubridate)
library(stringr)
library(dplyr)
library(ggplot2)
library(plotly)

k6 <- read.csv("�긲������.csv", fileEncoding = "EUC-KR")
k6

k1 <- read.csv("GDP ���1�δ� �½ǰ��� ���ⷮ.csv", fileEncoding = "EUC-KR")
k1

ggplot(k1, aes(x=�⵵))+
  geom_line(aes(y=GDP), col=2, size=2)+
  geom_line(aes(y=X1�δ�), col=3, size=2)+
  scale_x_continuous(limits=c(1990, 2018), breaks=seq(1990,2018,by=1))+
  scale_y_continuous(limits=c(2,15), breaks=seq(2,15,by=2))+
  xlab("")+
  ylab("")

k_lulu <- k6 %>% select(����=����, LULUCF)
k_lulu

ggplot(k_lulu, aes(x=����))+
  geom_line(aes(y=abs(LULUCF)), col="#1BC643",size=2)+
  scale_x_continuous(limits=c(1990, 2020), breaks=seq(1990,2020,by=1))+
  scale_y_continuous(limits=c(20,70), breaks=seq(20,70,by=5))+
  xlab("")+
  ylab("")


cs <- read.csv("�м���.csv", fileEncoding = "CP949")
head(cs)
out <- lm(CO2~., data=cs)
summary(out)

library(leaps)
leaps <- regsubsets(CO2~.,data=cs, nbest=10)
summary(leaps)
plot(leaps)

out_bic <- lm(CO2~SF6+������ϼ�, data=cs)
summary(out_bic)

plot(leaps,scale="adjr2")
out_adj <- lm(CO2~��ձ��+�����ϼ�+������ϼ�+HFCs+SF6, data=cs)
summary(out_adj)
out_agj1 <- lm(��ձ��~., data=cs)
summary(out_agj1)


cc <- read.csv("������_�½ǰ���������.csv", fileEncoding = "CP949")

cc1 <- lm(�ѹ��ⷮ~.,data=cc)
summary(cc1)
cc2 <- lm(����ձ��~.,data=cc)
summary(cc2)
leaps <- regsubsets(����ձ��~+0,data=cc, nbest=7)
summary(leaps)

plot(leaps)
plot(leaps, scale="adjr2")
out_adj2 <- lm(����ձ��~����+�����ϼ�+�����ϼ�+�����ϼ�+�ѹ��ⷮ+LULUCF,data=cc)
summary(out_adj2)
head(cc)
ccc <- cc[,c('�ѹ��ⷮ','����','��������','�����ϼ�','LULUCF')]
plot(ccc)
summary(out_adj2)
cor(cc)
head(cc)
plot(leaps, scale="adjr2")
out_adj3 <- lm(����ձ��~.,data=cc)
summary(out_adj3)
cor(cc)
out_adj3 <- lm(����ձ��~����+��������+�����ϼ�+�����ϼ�+�ѹ��ⷮ+LULUCF+0,data=cc)
summary(out_adj3)
plot(out_adj3)

out_adj5 <- lm(����ձ��~�����ϼ�+�ѹ��ⷮ,data=cc)
summary(out_adj5)
cor(cc)
out_adj4 <- lm(�ѹ��ⷮ~����+0,data=cc)
summary(out_adj4)

cor(cc)

step(lm(�ѹ��ⷮ~.,data=cc), direction="both", trace=FALSE)


oc <- read.csv("���ؾ�_�½ǰ���������.csv", fileEncoding = "CP949")
oc1 <- na.omit(oc)
oc1 <- lm(���ؾ���ձ��~.,data=oc1)
summary(oc1) #������� :1
cor(oc)

bm <- read.csv("�½ǰ������ⷮ(�ι���).csv", fileEncoding ="CP949")
bm1 <- lm(�ѹ��ⷮ~.,data=bm)
summary(bm1)  #������� :1
x <- (13.02+0.000463-0.104574+0.017138+0.013602)/0.003113
x
x1 <- (13.52+0.000463-0.104574+0.017138+0.013602)/0.003113
x1
y <- -0.000463+0.104574-0.017138+0.003113*x-0.013602
y
b=137
a <- 0.27705*b
b <- a/0.27705
a <- a2-a1
a1=4158.891
a2=4319.508
b1 <- a1/0.27705
b2 <- a2/0.27705
b1
b2

a1 <- (1.967e+03)+(6.873e-02)*b1
a2 <- (1.967e+03)+(6.873e-02)*b2
a1
a2
c <- 15591-15011

c(2,4,6,8)+c(3,5,7,9,11)

10+5+25+5+20+20+15
0/0


mx=matrix(c(1,2,3,4,5,6), ncol=2,byrow=T)
mx