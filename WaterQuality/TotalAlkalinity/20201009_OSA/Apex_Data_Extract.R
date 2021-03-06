#http://www.informit.com/articles/article.aspx?p=2215520

#modified as of 20190625 SJG
#NOTE: April - July conditioning (pediveliger to juvenile) only involves T5, T6, and T7; 
# T5 = elevated pCO2 (head tank) 
# T6 = elevated pCO2 (top heath tray in stack)
# T7 = ambient conditions (second heath tray in stack)
#added reminders on lines 39 and 43 to prevent overwritting files ->  SJG

library("XML")
library("plyr")
### line 13 is super important, xml line takes forever to load
xmlfile <- xmlParse("http://192.168.1.100:80/cgi-bin/datalog.xml?sdate=190809&days=7") #read in the date plus x days of Apex data

Apex.Data <- ldply(xmlToList(xmlfile), data.frame) #convert xml to dataframe
head(Apex.Data) # check the first few lines to see the first few hrs of the extracted data
tail(Apex.Data) # check to end to dertmine if the xmlParse extracted up to present day
Apex.Data2 <- Apex.Data[4:nrow(Apex.Data),] #remove extra metadata from top
Apex.Data2 <- head(Apex.Data2,-2) #remove extra metadata from bottom

# view data and names to ID the raw probe.name or probe.type or probe.value
Apex.Data2
tail(Apex.Data2) # check most recent data 
names(Apex.Data2)

# Column names modified as of 20190220 - new apex (from broodstock set-up) moved to conicals due to a malfunction

# Date.Time = column 3

# TMP_T0 = column 6 
# pH_T0= column 9 

# TMP_T4 = column 69 
# pH_T4 = column 72 

# TMP_T6 = column 75 
# pH_T6 = column 78 

# TMP_T5 = column 81 
# pH_T5 = column 84  

# TMP_T1 = column 87 
# pH_T1 = column 90 

# TMP_T7 = column 93 
# pH_T7 = column 96 

# TMP_T3 = column 99 
# pH_T3 = column 102 

# TMP_T2 = column 105 
# pH_T2 = column 108 pH_T2

# NOTE: 18 in total above

#keep columnes with data of interest. This needs to be changed as it will be specific to the Apex configuration
Probe.Data <- Apex.Data2[,c(3,6,9,69,72,75,78,81,84,87,90,93,96,99,102,105,108)] #select columns
colnames(Probe.Data) <- c("Date.Time", "TMP_T0", "pH_T0", "TMP_T4", "pH_T4", "TMP_T6","pH_T6",
                           "TMP_T5", "pH_T5", "TMP_T1", "pH_T1", "TMP_T7", "pH_T7", "TMP_T3", 
                          "pH_T3", "TMP_T2", "pH_T2")  #rename columns
Probe.Data$Date.Time <- as.POSIXct(Probe.Data$Date.Time, format = "%m/%d/%Y %H:%M:%S", tz="HST") #convert date to HI time
# tail(Probe.Data) # to view the newest data and compare to APEX fusion for assigning column names
# CHANGE DATE FOR NEW CSV (risk overwritting previous)
write.csv(Probe.Data, "C:/Users/samjg/Documents/My_Projects/Inragenerational_thresholds_OA/RAnalysis/Data/Apex_data/Output/20190815_Apex_Data_Output.data.csv") #write file to save data

#plot Temp and pH and save to output
# CHANGE DATE FOR NEW PDF (risk overwritting previous)
pdf("C:/Users/samjg/Documents/My_Projects/Inragenerational_thresholds_OA/RAnalysis/Data/Apex_data/Graphs/20190815_Apex_Data_Output.data.pdf")
par(mfrow=c(2,1))
plot(as.numeric(as.character(TMP_T0)) ~ Date.Time, Probe.Data, col = "grey", type="l", ylim=c(15, 20),  xlab="Time", ylab="Temperature °C")
lines(as.numeric(as.character(TMP_T1)) ~ Date.Time, Probe.Data, col = "red")
lines(as.numeric(as.character(TMP_T2)) ~ Date.Time, Probe.Data, col = "blue")
lines(as.numeric(as.character(TMP_T3)) ~ Date.Time, Probe.Data, col = "black")
lines(as.numeric(as.character(TMP_T4)) ~ Date.Time, Probe.Data, col = "green")
lines(as.numeric(as.character(TMP_T5)) ~ Date.Time, Probe.Data, col = "purple")
lines(as.numeric(as.character(TMP_T6)) ~ Date.Time, Probe.Data, col = "orange")
lines(as.numeric(as.character(TMP_T7)) ~ Date.Time, Probe.Data, col = "brown")

axis.POSIXct(side=1, Probe.Data$Date.Time)

plot(as.numeric(as.character(pH_T0)) ~ Date.Time, Probe.Data, col = "grey", type="l", ylim=c(6, 8.5),  xlab="Time", ylab="pH NBS")
lines(as.numeric(as.character(pH_T1)) ~ Date.Time, Probe.Data, col = "red")
lines(as.numeric(as.character(pH_T2)) ~ Date.Time, Probe.Data, col = "blue")
lines(as.numeric(as.character(pH_T3)) ~ Date.Time, Probe.Data, col = "black")
lines(as.numeric(as.character(pH_T4)) ~ Date.Time, Probe.Data, col = "green")
lines(as.numeric(as.character(pH_T5)) ~ Date.Time, Probe.Data, col = "purple")
lines(as.numeric(as.character(pH_T6)) ~ Date.Time, Probe.Data, col = "orange")
lines(as.numeric(as.character(pH_T7)) ~ Date.Time, Probe.Data, col = "brown")
axis.POSIXct(side=1, Probe.Data$Date.Time)

# plot(as.numeric(as.character(Salt_XL)) ~ Date.Time, Probe.Data, col = "grey", type="l", ylim=c(20, 35),  xlab="Time", ylab="Salinity psu")
# lines(as.numeric(as.character(Salt_L)) ~ Date.Time, Probe.Data, col = "red")
# lines(as.numeric(as.character(Salt_A)) ~ Date.Time, Probe.Data, col = "blue")
# axis.POSIXct(side=1, Probe.Data$Date.Time)
dev.off()

