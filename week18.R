library(tidyverse)
library(readxl)
library(lubridate)
#library(ggplot2)

das <- read_excel('D:/My_Data/R/Courses/R Programming course/Dataset/week18_dallas_animals.xlsx',sheet = 1)


das1 <- das %>% filter(!is.na(intake_type))%>%
  select(animal_id,intake_type,intake_date) %>% 
  mutate(intake_month = month(intake_date,label = TRUE,abbr = TRUE),
         intake_year = year(intake_date),
         intake_mmyy = paste(intake_month, intake_year, sep = '-')) %>% 
  group_by(intake_type) %>% 
  summarize(counts = n()) %>% 
  mutate(perc = counts/sum(counts) * 100) %>% 
  arrange(desc(perc))
          
#View(das1)

das2 <- das %>% 
  mutate(intake_type2 = str_replace_all(intake_type,
    c("LOST REPORT" = "OTHER", "WILDLIFE" = "OTHER", "FOSTER" = "OTHER", 
      "FOUND REPORT" = "OTHER", "TRANSFER" = "OTHER"))) 

das3 <- das2 %>% filter(!is.na(intake_type))%>%
  select(animal_id,intake_type2,intake_date) %>% 
  mutate(intake_month = month(intake_date,label = TRUE,abbr = TRUE),
         intake_year = year(intake_date),
         intake_mmyy = paste(intake_month, intake_year, sep = '-'))

ggplot(data=das3, mapping=aes(intake_mmyy, fill=intake_type2)) +
  geom_bar() +
  scale_fill_brewer(palette = 'Spectral')+
  theme(axis.text.x = element_text(angle = 90,size = 10,face = 'plain'),
        axis.text.y = element_text(size = 10, face = 'plain'),
        legend.title = element_text(size = 10,face = 'bold'),
        legend.text = element_text(size = 9, face = 'plain'))
