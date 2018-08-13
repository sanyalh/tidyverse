library(tidyverse)
library(readxl)
library(lubridate)
#library(ggplot2)

das <- read_excel('D:/My_Data/R/Courses/R Programming course/Dataset/week18_dallas_animals.xlsx',sheet = 1)
#das1 <- das %>% filter(!is.na(intake_type)) 
#View(das1)

das1 <- das %>% filter(!is.na(intake_type))%>%
  select(animal_id,intake_type,intake_date) %>% 
  mutate(intake_month = month(intake_date),
         intake_year = year(intake_date),
         intake_mmyy = intake_month, intake_year, sep = '-')   
#group_by(intake_month,intake_type) %>% 
#summarize(count1=n())

ggplot(data=das1, mapping=aes(intake_mmyy, fill=intake_type)) +
  geom_bar()