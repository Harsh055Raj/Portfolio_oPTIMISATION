library(urca)
library(tseries)

################
# Install and load the zoo package
mean_spread <- mean(Data$SPREAD, na.rm = TRUE)
Data$SPREAD[is.na(Data$SPREAD)] <- mean_spread
adf.test(Data$SPREAD)

Data=read.csv(file.choose())

# Create a line plot using the plot function
plot(Data$SPREAD ,type = "l", xlab = "Index", ylab = "Spread", main = "Line Plot of Spread")

###################
DataMZ=read.csv(file.choose())
plot(ts(DataMZ))
DataTata=read.csv(file.choose())
data=data.frame(DataMZ,DataTata)
data
cot=ca.jo(data[c('MARUTI.NS','TATAMOTORS.NS')],ecdet="const", type='trace', K=2, spec='transitory')
print(summary(cot))
l1= 1.000000 
l2=-6.423812

y=data['MARUTI.NS'] +l2*data['TATAMOTORS.NS'] -5537.428059 
y<-ts(y)
adf.test(y)
plot(y)


DataEicher=read.csv(file.choose())
DataBajaj=read.csv(file.choose())
DataM_M=read.csv(file.choose())

data2=data.frame(DataEicher,DataBajaj)
data2

cot2=ca.jo(data2[c('EICHERMOT.NS','BAJAJ.AUTO.NS')],ecdet="const", type='trace', K=2, spec='transitory')
print(summary(cot2))
y=data2['EICHERMOT.NS'] +-0.7654912*data2['BAJAJ.AUTO.NS'] -170.7282230
y<-ts(y)
adf.test(y)
plot(y)


data3=data.frame(DataEicher,DataM_M)
data3
cot2=ca.jo(data3[c('EICHERMOT.NS','M.M.NS')],ecdet="const", type='trace', K=5, spec='transitory')
print(summary(cot2))
y=data3['EICHERMOT.NS'] -1.651725 *data3['M.M.NS'] -1054.506239
y<-ts(y)
adf.test(y)
plot(y)

length(DataM_M$M.M.NS)
data4=data.frame(DataTata,DataM_M)
data4
cot2=ca.jo(data4[c('TATAMOTORS.NS','M.M.NS')],ecdet="const", type='trace', K=2, spec='transitory')
print(summary(cot2))
y=data3['EICHERMOT.NS'] -0.4331715*data3['M.M.NS'] +83.0945409
y<-ts(y)
adf.test(y)
plot(y)



### IT
DataTCS=read.csv(file.choose())
DataTech_Mahindra=read.csv(file.choose())

DataInfosys=read.csv(file.choose())
DataHCL=read.csv(file.choose())
DataWiproL=read.csv(file.choose())



data5=data.frame(DataInfosys,DataWiproL)
data5
cot2=ca.jo(data5[c('INFY.NS','WIPRO.NS')],ecdet="const", type='trace', K=2, spec='transitory')
print(summary(cot2))
y=data5['INFY.NS'] -2.831613*data5['WIPRO.NS'] -121.986963
y<-ts(y)
adf.test(y)
plot(y)


data5=data.frame(DataInfosys,DataTCS)
data5
cot2=ca.jo(data5[c('INFY.NS','TCS.NS')],ecdet="const", type='trace', K=2, spec='transitory')
print(summary(cot2))
y=data5['INFY.NS'] -0.5788536*data5['TCS.NS'] +434.4822841
y<-ts(y)
adf.test(y)
plot(y)
summary(y)


data5=data.frame(DataInfosys,DataTech_Mahindra)
data5
cot2=ca.jo(data5[c('INFY.NS','TECHM.NS')],ecdet="const", type='trace', K=2, spec='transitory')
print(summary(cot2))
y=data5['INFY.NS'] -1.620894*data5['TECHM.NS'] +378.590380
y<-ts(y)
adf.test(y)
plot(y)


data5=data.frame(DataTCS,DataTech_Mahindra)
data5
cot2=ca.jo(data5[c('TCS.NS','TECHM.NS')],ecdet="const", type='trace', K=2, spec='transitory')
print(summary(cot2))
y=data5['TCS.NS'] -2.53592 *data5['TECHM.NS'] -424.92079
y<-ts(y)
adf.test(y)
plot(y)

library(urca)  
total_obs <- nrow(data5)
frame_length <- 7
cot2_list <- list()


####AUTO DONE

data5=data.frame(DataEicher,DataBajaj)
data5=data.frame(DataEicher,DataM_M)
data5=data.frame(DataM_M,DataBajaj)
data5=data.frame(DataEicher,DataTata)
data5=data.frame(DataTata,DataBajaj)
data5=data.frame(DataTata,DataM_M)

###IT
data5=data.frame(DataInfosys,DataTech_Mahindra)
data5=data.frame(DataTCS,DataTech_Mahindra)
data5=data.frame(DataInfosys,DataTCS)
data5=data.frame(DataInfosys,DataWiproL)
data5=data.frame(DataTech_Mahindra,DataWiproL)
data5=data.frame(DataTCS,DataWiproL)

data5
result_data <- data.frame(l1 = numeric(0), l2 = numeric(0), l3 = numeric(0), score = numeric(0))

for (i in seq(1, total_obs, by = frame_length)) {
  start_idx <- i
  end_idx <- min(i + frame_length - 1, total_obs)
  frame_data <- data5[start_idx:end_idx, ]
  cot2 <- ca.jo(frame_data[c('TCS.NS','WIPRO.NS')], ecdet="const", type='trace', K=2, spec='transitory')
  if (!is.null(cot2)) {
    cot2_summary <- summary(cot2)@V
    l1<-cot2_summary[1, 1]
    l2<-cot2_summary[2, 1]
    l3<-cot2_summary[3, 1]
    res<-l1*data5[start_idx:end_idx,'TCS.NS']+l2*data5[start_idx:end_idx,'WIPRO.NS']+l3
    score<-adf.test(res)$p.value
    result_data <- rbind(result_data, data.frame(l1 = l1, l2 = l2, l3 = l3, score = score))
    
  }
}
result_data
write.csv(result_data, "Downloads/TTCS.NS_wipro.csv", row.names = FALSE)
cot2_list
data5###4 TCS and Tech Mahindra 
data5###7 TCS and Infosys

data9###7 Wipro Infosys

###AUTO INDUSTRY 

## M_M EICHER -3
##EICHER AND TATA -8
##5 TATA M_M

summary(data5)



########
library(readxl)
data=read_excel(file.choose())
data$Spread
dataspread=na.omit(data$Spread)
library(quantmod)
library(dplyr)
library(tidverse)
library(tseries)
library(rugarch)
library(rugarch)
library(xts)
install.packages("rugarch")
mod_specify=ugarchspec(mean.model=list(armaOrder=c(0,0)),distribution.model='norm')
mod_fitting=ugarchfit(data=dataspread,spec=mod_specify,out.sample =20)
mod_fitting



######## High Frequency Data 
data=read_excel(file.choose())
data
length(data$INFO)
total_obs <- nrow(data)
frame_length <- 82
cot2_list <- list()



result_data <- data.frame(l1 = numeric(0), l2 = numeric(0), l3 = numeric(0), score = numeric(0))

for (i in seq(1, total_obs, by = frame_length)) {
  start_idx <- i
  end_idx <- min(i + frame_length - 1, total_obs)
  frame_data <- data[start_idx:end_idx, ]
  cot2 <- ca.jo(frame_data[c('TCS','INFO')], ecdet="const", type='trace', K=2, spec='transitory')
  if (!is.null(cot2)) {
    cot2_summary <- summary(cot2)@V
    l1<-cot2_summary[1, 1]
    l2<-cot2_summary[2, 1]
    l3<-cot2_summary[3, 1]
    res<-l1*data[start_idx:end_idx,'TCS']+l2*data[start_idx:end_idx,'INFO']+l3
    result_data <- rbind(result_data, data.frame(l1 = l1, l2 = l2, l3 = l3, score = score))
    
  }
}
result_data
write.csv(result_data, "Downloads/TcsINFO.csv", row.names = FALSE)
