# Introduction

# setwd("~/perso/tmp/project/penguins") no need for this line

data <- read.csv("https://raw.githubusercontent.com/holtzy/R-graph-gallery/master/DATA/data_2.csv")

summary(data)

print(round(mean(subset(na.omit(data), species == "Adelie" & island == "Torgersen")$bill_length_mm), 2))
print(round(mean(subset(na.omit(data), species == "Adelie" & island == "Biscoe")$bill_length_mm), 2))
print(round(mean(subset(na.omit(data), species == "Adelie" & island == "Dream")$bill_length_mm), 2))


# Plot
penguins_clean <- na.omit(data)
plot(penguins_clean$bill_length_mm, penguins_clean$bill_depth_mm, type = "n", xlab = "Bill Length (mm)", ylab = "Bill Depth (mm)", main = "Penguin Bill Dimensions")
points(
  penguins_clean$bill_length_mm[penguins_clean$species == "Adelie"], penguins_clean$bill_depth_mm[penguins_clean$species == "Adelie"],
  col = "red", pch = 16
)
points(penguins_clean$bill_length_mm[penguins_clean$species == "Chinstrap"], penguins_clean$bill_depth_mm[penguins_clean$species == "Chinstrap"], col = "green", pch = 17)
points(penguins_clean$bill_length_mm[penguins_clean$species == "Gentoo"],
  penguins_clean$bill_depth_mm[penguins_clean$species == "Gentoo"],
  col = "blue", pch = 18
)
legend("topright",
  legend = unique(penguins_clean$species),
  col = c(
    "red",
    "green",
    "blue"
  ), pch = c(16, 17, 18)
)


# Tidyverse
install.packages("dplyr")
install.packgages("ggplot2")

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read data
data <- read.csv("C:/Users/mount/OneDrive/Desktop/productive-r-workflow/Input/data.csv")

# Summarize the data
summary(data)

# Clean data and calculate mean bill lengths
penguins_clean <- data %>%
  na.omit()

mean_bill_length <- penguins_clean %>%
  filter(species == "Adelie") %>%
  group_by(island) %>%
  summarize(mean_bill_length_mm = round(mean(bill_length_mm), 2))

print(mean_bill_length)

# Plot using ggplot2
ggplot(penguins_clean, aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)) +
  geom_point() +
  labs(title = "Penguin Bill Dimensions", x = "Bill Length (mm)", y = "Bill Depth (mm)") +
  theme_minimal() +
  scale_color_manual(values = c("Adelie" = "red", "Chinstrap" = "green", "Gentoo" = "blue")) +
  scale_shape_manual(values = c("Adelie" = 16, "Chinstrap" = 17, "Gentoo" = 18)) +
  theme(legend.title = element_blank())
