# Between questions 4 and 5, we are asked to create a new subset containing
#only urban households. Later we will need to differentiate between 
#what type of urban area a household is from. See lines 13:15 and comments.

#Area type is identified in column hv025 as
# 1 == urban, 2 == rural

urban_hhs <- filter(nfhs, hv025 == 1) %>% #df showing only urban households
  select(hhid:hv208) %>%
  rename(area_type = hv025)%>%  #getting rid of those-
  rename(hh_members = hv009)%>% #hard to follow-
  rename(urban_type = hv026)%>% #column names!
  mutate("Large City" = urban_type == 0)%>% #NICE! we jumped ahead here folks
  mutate("Small City" = urban_type == 1)%>% #we are using mutate to label the
  mutate("Town" = urban_type == 2)          #TYPE of urban area they live in

#In column hv026 (which we have renamed urban_type), the values (0, 1, 2)
#refer to (Large City, Small City, Town). More on this in the next file.