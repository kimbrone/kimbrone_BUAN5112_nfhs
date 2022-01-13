nfhs <- read_dta('DATA/IAHR52FL.dta')

library(tidyverse)
library(haven)
library(ggplot2)

nrow(nfhs) 
ncol(nfhs) 

q3_subset_hhid_to_shstruc <- nfhs %>%
  select(hhid:shstruc)

ggplot(data = q3_subset_hhid_to_shstruc, mapping = aes(x = hv009)) +
  geom_histogram(binwidth = 1) +
  xlab("Number of household members")

urban_hhs <- filter(nfhs, hv025 == 1) %>%
  select(hhid:hv208) %>%
  rename(area_type = hv025)%>% 
  rename(hh_members = hv009)%>% 
  rename(urban_type = hv026)%>%
  mutate("Large City" = urban_type == 0)%>%
  mutate("Small City" = urban_type == 1)%>%
  mutate("Town" = urban_type == 2)

urban_type_labels <- factor(urban_hhs$urban_type,
                            levels = c(0, 1, 2),
                            labels = c("Large City", "Small City", "Town")) 

ggplot(data = urban_hhs, mapping =
     aes(y = urban_type_labels, x = hh_members)) +
  geom_boxplot() +
  xlab("Household Members")+
  ylab("Type of Urban Area")

#Boxplot (Cropped/cleaned up)
ggplot(data = urban_hhs, mapping =
    aes(y = urban_type_labels, x = hh_members)) +
  geom_boxplot(outlier.shape = NA) +
  coord_cartesian(xlim = c(0, 10)) +
  xlab("Household Members") +
  ylab("Type of Urban Area")

urban_hhs %>%
  group_by(urban_type)%>%
  summarise(median(hh_members), mean(hh_members))


