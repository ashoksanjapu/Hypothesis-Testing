my_data <- read.csv(file.choose())
## Show a random sample
set.seed(1234)
dplyr::sample_n(my_data, 10)
levels(my_data$UnitB)

my_data$UnitB <- ordered(my_data$UnitB,levels = c("ctrl", "trt1", "trt2"))
#Compute summary statistics by groups - count, mean, sd:
library(dplyr)
group_by(my_data, UnitB) %>%
  summarise(
    count = n(),
    mean = mean(UnitA, na.rm = TRUE),
    sd = sd(UnitA, na.rm = TRUE)
  )
# Compute the analysis of variance
res.aov <- aov(UnitA ~ UnitB, data = my_data)
# Summary of the analysis
summary(res.aov)


#The output includes the columns F value and Pr(>F) corresponding to the
#p-value of the test.