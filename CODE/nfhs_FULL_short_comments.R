#Week 1 Assignment
#BUAN 5112 - Winter 2022
#Kate Imbrone

#Load Data
      nfhs <- read_dta('DATA/IAHR52FL.dta')#Loads the 3,588 file as "nfhs"
                                          #Later, we will break this down
                                          # into subsets

#Libraries Used ----
      library(tidyverse)
      library(haven)
      library(ggplot2)

# Question 1 ----
# How many households:

      nrow(nfhs) #returns 109041
      
#Question 2 ----
#How many variables?
      
      ncol(nfhs) #returns 3588

#Question 3----
#Create new subset hhid:shstruc 

     q3_subset_hhid_to_shstruc <- nfhs %>%
       select(hhid:shstruc)
      #new subset has 196 variables

#Question 4 ----
#Plot distribution of number of listed household
#members for the entire sample 
     
     ggplot(data = q3_subset_hhid_to_shstruc, mapping = aes(x = hv009)) +
       geom_histogram(binwidth = 1) +
       xlab("Number of household members")

# New data frame (urban) ----
#Create new data frame containing only urban households


     urban_hhs <- filter(nfhs, hv025 == 1) %>% #df showing only urban households
       select(hhid:hv208) %>%
       rename(area_type = hv025)%>% 
       rename(hh_members = hv009)%>% 
       rename(urban_type = hv026)%>%
       mutate("Large City" = urban_type == 0)%>%
       mutate("Small City" = urban_type == 1)%>%
       mutate("Town" = urban_type == 2)
    
 #Create labels to differentiate between types of urban areas
# I used factors because I could easily assign a label to each
# value (0:2) in hv026 (now "urban_type")
      urban_type_labels <- factor(urban_hhs$urban_type,
       levels = c(0, 1, 2), #values in col are 0:2, recode map identifies
                            #as urban types (see labels)
       labels = c("Large City", "Small City", "Town")) 

#Question 5 ----
#Create boxplot showing distribution of household size by type
#of urban area
      
  #Boxplot (No cropping/cleaning up):
      ggplot(data = urban_hhs, mapping = aes(y = urban_type_labels,
                                             x = hh_members)) +
        geom_boxplot() +
        xlab("Household Members")+
        ylab("Type of Urban Area")
      
  #Boxplot (Cropped/cleaned up)
     ggplot(data = urban_hhs, mapping = aes(y = urban_type_labels,
      x = hh_members)) +
      geom_boxplot(outlier.shape = NA) + #To "zoom in"/visually disregard outliers
      coord_cartesian(xlim = c(0, 10)) + #To "crop" viewing area
      xlab("Household Members")+
      ylab("Type of Urban Area")

#Question 6 ----
#Use 'group_by' and 'summarise' to find means/medians of each urban area type
     
urban_hhs %>%
  group_by(urban_type)%>%
  summarise(median(hh_members), mean(hh_members))

      
            