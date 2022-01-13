#Question 6 ----
#Use 'group_by' and 'summarise' to find means/medians of each urban area type

urban_hhs %>%
  group_by(urban_type)%>%
  summarise(median(hh_members), mean(hh_members))

#This is pretty straightforward, right? 

#Yeah, this question took me the longest.

#Finally figured out it was because I had been referencing
#hv002 instead of hv009. This is why looking at your numbers
#progressively is important. I was getting a mean in the 20s.