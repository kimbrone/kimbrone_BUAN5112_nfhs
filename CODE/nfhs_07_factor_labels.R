#We are advised to use factor() to label and organize urban area
#types. This step will allow us to use the data in each label
#quantitatively! 

#Create a value "urban_type_labels" by factor()
urban_type_labels <- factor(urban_hhs$urban_type,
                        levels = c(0, 1, 2),
                        labels = c("Large City", "Small City", "Town")) 