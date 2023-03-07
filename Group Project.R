library("readxl") # library allows us to read xls files

# load in the data
FEB20131 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-Tables-Feb2013.xls", sheet = "DRL0101") # Age
FEB20132 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-Tables-Feb2013.xls", sheet = "DRL0102") # District
FEB20133 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-Tables-Feb2013.xls", sheet = "DRL0110") # Categories
FEB20134 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-Tables-Feb2013.xls", sheet = "DRL0131") # Gender
FEB20135 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-Tables-Feb2013.xls", sheet = "DRL0132") # District

MAR20161 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-data-March2016.xls", sheet = "DRL0101") # Age
MAR20162 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-data-March2016.xls", sheet = "DRL0102") # District
MAR20163 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-data-March2016.xls", sheet = "DRL0110") # Categories
MAR20164 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-data-March2016.xls", sheet = "DRL0131") # Gender
MAR20165 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-data-March2016.xls", sheet = "DRL0132") # District
MAR20166 <- read_xls("C:\\Users\\rimic\\Desktop\\Driving Licence (1)\\Driving-licence-data-March2016.xls", sheet = "DRL0133")

FEB20131 <- FEB20131[-(1:26),]
FEB20132 <- FEB20132[-(1:26),]
FEB20133 <- FEB20133[-(1:26),]
FEB20134 <- FEB20134[-(1:26),]
FEB20135 <- FEB20135[-(1:26),]

MAR20161 <- MAR20161[-(1:27),]
MAR20162 <- MAR20162[-(1:26),]
MAR20163 <- MAR20163[-(1:26),]
MAR20164 <- MAR20164[-(1:27),]
MAR20165 <- MAR20165[-(1:27),]
MAR20166 <- MAR20166[-(1:28),]
