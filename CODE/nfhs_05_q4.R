#Question 4 ----
#Plot distribution of number of listed household
#members for the entire sample 

ggplot(data = q3_subset_hhid_to_shstruc, mapping = aes(x = hv009)) +
  geom_histogram(binwidth = 1) +
  xlab("Number of household members") #label horiz axis

#Returns plot uploaded in PLOTS/
