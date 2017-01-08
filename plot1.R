d_power_consumption.txt"
data <- read.table(fileName, stringsAsFactors = FALSE, sep =";", header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data_df <-tbl_df(data)

rm(data)

dt1 <- ymd("2007-02-01")
dt2 <- ymd("2007-02-02")
data_df1 <- filter (data_df, dmy(Date) >= dt1 & dmy(Date) <= dt2)

# plot1
png("plot1.png", height = 480, width = 480)
hist(data_df1$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()

