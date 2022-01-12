#Question 5 asks us to create a boxplot showing distribution of
#household size by type of urban area.

#The following was my original graph:
ggplot(data = urban_hhs, mapping = #What data?
         aes(y = urban_type_labels, #Which axis?
             x = hh_members)) +
  geom_boxplot() + #What type of plot?
  xlab("Household Members")+ #Labels?
  ylab("Type of Urban Area")

#Clearly this data is skewed and there are a ton of outliers.
#I was curious to see what the "box" (second/third quartile)
#would look like on their own, so I played around a bit and
#came up with this:
#Boxplot (Cropped/cleaned up)
