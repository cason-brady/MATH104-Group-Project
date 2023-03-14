library("readxl") # library allows us to read xls files

# load in the data
FEB20131 <- read_xls("PATH\\Driving-licence-Tables-Feb2013.xls", sheet = "DRL0101") # licence type by age and gender
FEB20132 <- read_xls("PATH\\Driving-licence-Tables-Feb2013.xls", sheet = "DRL0102") # licence type by postcode district
FEB20133 <- read_xls("PATH\\Driving-licence-Tables-Feb2013.xls", sheet = "DRL0110") # entitlements held by gender
FEB20134 <- read_xls("PATH\\Driving-licence-Tables-Feb2013.xls", sheet = "DRL0131") # penalty points held by age and gender
FEB20135 <- read_xls("PATH\\Driving-licence-Tables-Feb2013.xls", sheet = "DRL0132") # penalty points help by postcode district

MAR20161 <- read_xls("PATH\\Driving-licence-data-March2016.xls", sheet = "DRL0101") # licence type by age and gender
MAR20162 <- read_xls("PATH\\Driving-licence-data-March2016.xls", sheet = "DRL0102") # licence type by postcode district
MAR20163 <- read_xls("PATH\\Driving-licence-data-March2016.xls", sheet = "DRL0110") # entitlements held by gender
MAR20164 <- read_xls("PATH\\Driving-licence-data-March2016.xls", sheet = "DRL0131") # penalty points held by age and gender
MAR20165 <- read_xls("PATH\\Driving-licence-data-March2016.xls", sheet = "DRL0132") # penalty points help by postcode district
MAR20166 <- read_xls("PATH\\Driving-licence-data-March2016.xls", sheet = "DRL0133") # entitlements count by gender and age

# remove the top part of the xls file where there is no useful data and refactor all tables
FEB20131 <- FEB20131[-(1:26),]
colnames(FEB20131) <- c("Age", "PM", "PF", "PT", "FM", "FF", "FT")
FEB20131 <- data.frame("Age" = FEB20131[3:95, 1],
                       "PM"  = FEB20131[3:95, 2],
                       "PF"  = FEB20131[3:95, 3],
                       "PT"  = FEB20131[3:95, 4],
                       "FM"  = FEB20131[3:95, 5],
                       "FF"  = FEB20131[3:95, 6],
                       "FT"  = FEB20131[3:95, 7])

FEB20132 <- FEB20132[-(1:26),]
colnames(FEB20132) <- c("District", "PM", "PF", "PT", "FM", "FF", "FT")
FEB20132 <- data.frame("District" = FEB20132[3:2890, 1],
                       "PM"       = FEB20132[3:2890, 2],
                       "PF"       = FEB20132[3:2890, 3],
                       "PT"       = FEB20132[3:2890, 4],
                       "FM"       = FEB20132[3:2890, 5],
                       "FF"       = FEB20132[3:2890, 6],
                       "FT"       = FEB20132[3:2890, 7])

FEB20133 <- FEB20133[-(1:26),]
FEB20133 <- FEB20133[, -2]
colnames(FEB20133) <- c("Entitlements", "Female", "Male", "Total")
FEB20133 <- data.frame("Entitlements" = FEB20133[2:73, 1],
                       "Female"       = FEB20133[2:73, 2],
                       "Male"         = FEB20133[2:73, 3],
                       "Total"        = FEB20133[2:73, 4])

FEB20134 <- FEB20134[-(1:26),]
FEB20134F <- FEB20134[(1:87),] # Female
FEB20134F[3] <- FEB20134F[2]
FEB20134F <- FEB20134F[-(1:2)]
names(FEB20134F)[1] <- "Age"
for (index in 1:ncol(FEB20134F)) {
  if (is.na(FEB20134F[index, 1]) == FALSE)  {
    names(FEB20134F)[index] <- FEB20134F[1,index]
  }
}
FEB20134F <- FEB20134F[(3:87),]

FEB20134M <- FEB20134[-(3:87),] # Male
FEB20134M[3] <- FEB20134M[2]
FEB20134M <- FEB20134M[-(1:2)]
names(FEB20134M)[1] <- "Age"
for (index in 1:ncol(FEB20134M)) {
  if (is.na(FEB20134M[index, 1]) == FALSE)  {
    names(FEB20134M)[index] <- FEB20134M[1,index]
  }
}
FEB20134M <- FEB20134M[(3:89),]

FEB20134T <- FEB20134[-(3:174),] # Total
FEB20134T <- FEB20134T[-(1:3)]
names(FEB20134T) <- (split(FEB20134T,1:nrow(FEB20134T))$'1')
FEB20134T <- FEB20134T[3,]

FEB20135 <- FEB20135[-(1:26),]
FEB20135 <- FEB20135[,-2]
for (index in 1:ncol(FEB20135)) {
  if (is.na(FEB20135[index, 1]) == FALSE)  {
    names(FEB20135)[index] <- FEB20135[1,index]
  } else {
    names(FEB20135)[index] <- FEB20135[2,index]
  }
}
FEB20135 <- FEB20135[-(1:2),]

MAR20161 <- MAR20161[-(1:27),]
colnames(MAR20161) <- c("Age", "PM", "PF", "PT", "FM", "FF", "FT")
MAR20161 <- data.frame("Age" = MAR20161[3:96, 1],
                       "PM"  = MAR20161[3:96, 2],
                       "PF"  = MAR20161[3:96, 3],
                       "PT"  = MAR20161[3:96, 4],
                       "FM"  = MAR20161[3:96, 5],
                       "FF"  = MAR20161[3:96, 6],
                       "FT"  = MAR20161[3:96, 7])

MAR20162 <- MAR20162[-(1:26),]
colnames(MAR20162) <- c("District", "PM", "PF", "PT", "FM", "FF", "FT")
for (index in 1:(nrow(MAR20162)-2)) {
  MAR20162[index,1] = MAR20162[index+2,1]
}
MAR20162 <- data.frame("District" = MAR20162[3:2834, 1],
                       "PM"       = MAR20162[3:2834, 2],
                       "PF"       = MAR20162[3:2834, 3],
                       "PT"       = MAR20162[3:2834, 4],
                       "FM"       = MAR20162[3:2834, 5],
                       "FF"       = MAR20162[3:2834, 6],
                       "FT"       = MAR20162[3:2834, 7])

MAR20163 <- MAR20163[-(1:26),]
MAR20163 <- MAR20163[, -2]
colnames(MAR20163) <- c("Entitlements", "Female", "Male", "Total")
MAR20163 <- data.frame("Entitlements" = MAR20163[2:60, 1],
                       "Female"       = MAR20163[2:60, 2],
                       "Male"         = MAR20163[2:60, 3],
                       "Total"        = MAR20163[2:60, 4])

MAR20164 <- MAR20164[-(1:27),]

MAR20164F <- MAR20164[(1:87),] # Female
MAR20164F <- MAR20164F[-1]
MAR20164F <- MAR20164F[-2]
names(MAR20164F)[1] <- "Age"
for (index in 2:ncol(MAR20164F)) {
  if (is.na(MAR20164F[index, 1]) == FALSE)  {
    names(MAR20164F)[index] <- MAR20164F[1,index]
  }
}
for (index in 3:nrow(MAR20164F)) {
  if (!is.na(MAR20164F[index, 37]) && MAR20164F[index, 37] != '-') {
    MAR20164F[index,39] <- MAR20164F[index,39] - as.integer(MAR20164F[index, 37])
  }
  if (!is.na(MAR20164F[index, 38]) && MAR20164F[index, 38] != '-') {
    MAR20164F[index,39] <- MAR20164F[index,39] - as.integer(MAR20164F[index, 38])
  }
}
MAR20164F[37] <- MAR20164F[39]
MAR20164F <- MAR20164F[-(1:2),]
MAR20164F <- MAR20164F[-(38:39)]

MAR20164M <- MAR20164[-(3:87),] # Male
MAR20164M <- MAR20164M[-1]
MAR20164M <- MAR20164M[-2]
names(MAR20164M)[1] <- "Age"
for (index in 2:ncol(MAR20164M)) {
  if (is.na(MAR20164M[index, 1]) == FALSE)  {
    names(MAR20164M)[index] <- MAR20164M[1,index]
  }
}
for (index in 3:nrow(MAR20164M)) {
  if (!is.na(MAR20164M[index, 37]) && MAR20164M[index, 37] != '-') {
    MAR20164M[index,39] <- MAR20164M[index,39] - as.integer(MAR20164M[index, 37])
  }
  if (!is.na(MAR20164M[index, 38]) && MAR20164M[index, 38] != '-') {
    MAR20164M[index,39] <- MAR20164M[index,39] - as.integer(MAR20164M[index, 38])
  }
}
MAR20164M[37] <- MAR20164M[39]
MAR20164M <- MAR20164M[-(1:2),]
MAR20164M <- MAR20164M[-(38:39)]

MAR20164T <- MAR20164[174,] # Total
MAR20164T <- MAR20164T[-(1:3)]
colnames(MAR20164T) <- colnames(MAR20164M)[2:ncol(MAR20164M)]
for (index in 3:nrow(MAR20164T)) {
  if (!is.na(MAR20164T[index, 37]) && MAR20164T[index, 37] != '-') {
    MAR20164T[index,38] <- MAR20164T[index,38] - as.integer(MAR20164T[index, 37])
  }
  if (!is.na(MAR20164T[index, 38]) && MAR20164T[index, 38] != '-') {
    MAR20164T[index,38] <- MAR20164T[index,38] - as.integer(MAR20164T[index, 36])
  }
}

MAR20165 <- MAR20165[-(1:27),]
MAR20165 <- MAR20165[,-2]
for (index in 1:ncol(MAR20165)) {
  if (is.na(MAR20165[index, 1]) == FALSE)  {
    names(MAR20165)[index] <- MAR20165[1,index]
  } else {
    names(MAR20165)[index] <- MAR20165[2,index]
  }
}
for (index in 3:nrow(MAR20165)) {
  if (!is.na(MAR20165[index, 37]) && MAR20165[index, 37] != '-') {
    MAR20165[index,39] <- MAR20165[index,39] - as.integer(MAR20165[index, 37])
  }
  if (!is.na(MAR20165[index, 38]) && MAR20165[index, 38] != '-') {
    MAR20165[index,39] <- MAR20165[index,39] - as.integer(MAR20165[index, 38])
  }
}
MAR20165 <- MAR20165[-(1:2),]
MAR20165 <- MAR20165[-(38:39)]

MAR20166 <- MAR20166[-(1:28),]
for (index in 3:(nrow(MAR20166)-3)) {
  MAR20166[index,1] <- MAR20166[index+3,1]  
}
MAR20166 <- MAR20166[-(62:64),]

MAR20166F <- MAR20166[(1:92)] # Female
MAR20166F <- MAR20166F[-2]
MAR20166F <- MAR20166F[-1,]
for (index in 1:ncol(MAR20166F)) {
  if (is.na(MAR20166F[1, index]) == FALSE)  {
    names(MAR20166F)[index] <- MAR20166F[1,index]
  }
}
names(MAR20166F)[1] <- "Entitlements"
MAR20166F <- MAR20166F[-1,]

MAR20166M <- MAR20166[-(3:92)] # Male
MAR20166M <- MAR20166M[-96]
MAR20166M <- MAR20166M[-2]
MAR20166M <- MAR20166M[-1,]
for (index in 1:ncol(MAR20166M)) {
  if (is.na(MAR20166M[1, index]) == FALSE)  {
    names(MAR20166M)[index] <- MAR20166M[1,index]
  }
}
names(MAR20166M)[1] <- "Entitlements"
MAR20166M <- MAR20166M[-1,]

MAR20166T <- MAR20166[-(3:185)]
MAR20166T <- MAR20166T[-2]
MAR20166T <- MAR20166T[-1,]
for (index in 1:ncol(MAR20166T)) {
  if (is.na(MAR20166T[1, index]) == FALSE)  {
    names(MAR20166T)[index] <- MAR20166T[1,index]
  }
}
MAR20166T <- MAR20166T[-1,]
names(MAR20166T)<- c("Entitlements","Total")
