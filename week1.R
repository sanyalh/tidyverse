us_cost1 <- us_cost  %>% gather(`2004-05`:`2015-16`, key = "Year", value = "Cost")
View(us_cost1)

ggplot(data = us_cost1) +
  geom_point(mapping = aes(x = Year, y = Cost)) +
  facet_wrap(~State) +
  labs(x = "Year", y = "Average Tution in The United States") +
  theme(axis.text.x = element_text(angle = 90)) 
