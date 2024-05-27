library(magrittr)
library(readxl)
# import data
data <- readxl::read_excel("Input/data.xlsx", na = "NA")

#remove rows 23 and 48
clean_data <- data[!(rownames(data) %in% c("23", "48")), ]

#save as RDS
saveRDS(clean_data, file = "Input/clean_data.rds")
