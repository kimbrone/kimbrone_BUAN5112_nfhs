# Question 3 asks us to create a new subset from hhid:shstruc, then
# identify how many variables exist in said subset

q3_subset_hhid_to_shstruc <- nfhs %>%
  select(hhid:shstruc) #creates subset

ncol(q3_subset_hhid_to_shstruc) #new subset has 196 variables