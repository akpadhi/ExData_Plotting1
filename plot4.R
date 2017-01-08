
library(dplyr)
library(lubridate)


fileName <- "household_power_consumption.txt"
data <- read.table(fileName, stringsAsFactors = FALSE, sep =";", header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data_df <-tbl_df(data)

rm(data)

dt1 <- ymd("2007-02-01")
dt2 <- ymd("2007-02-02")
data_df1 <- filter (data_df, dmy(Date) >= dt1 & dmy(Date) <= dt2)
data_df1 <- mutate(data_df1, dateTime = dmy_hms(paste(data_df1$Date, data_df1$Time)))

# plot4
png("plot4.png", height = 480, width = 480)

par(mfcol = c(2,2))

plot(data_df1$dateTime, data_df1$Global_active_power, type ="l", xlab= "",ylab = "Global Active Power (kilowatts)")

with(data_df1, plot(Sub_metering_1~dateTime, type ="l", xlab= "",ylab = "Energy sub metering"))
lines(data_df1$dateTime, data_df1$Sub_metering_2, col = "red")
lines(data_df1$dateTime, data_df1$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col =c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data_df1, plot(dateTime, Voltage, type ="l", xlab= "datetime",ylab = "Voltage"))

with(data_df1, plot(dateTime, Global_reactive_power, type ="l", xlab= "datetime",ylab = "Global_reactive_power"))


dev.off()

rm(list = ls())
