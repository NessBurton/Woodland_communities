
# date: 20-02-24
# author: VB
# purpose: Explore TSH woodland communities

### working dirs ---------------------------------------------------------------

wd <- "C:/Users/vbu/OneDrive - the Woodland Trust/Data-analysis/Woodland-communities"
dirData <- paste0(wd,"/data-raw/")
dirScratch <- paste0(wd,"/data-scratch/")
dirOut <- paste0(wd,"data-out")

### libraries ------------------------------------------------------------------

library(tidyverse)
library(ggplot2)
library(taxize)

### read in data ---------------------------------------------------------------

# taken from the WT tree species handbook https://www.woodlandtrust.org.uk/publications/2022/03/tree-species-handbook/
dfSpecies <- read.csv(paste0(dirData,"Tree_Species_Handbook_database_Feb24.csv"))
head(dfSpecies)
summary(dfSpecies)

### get scientific names -------------------------------------------------------

# TAKES AGES - BEWARE RUNNING!
# dfSpecies <- dfSpecies %>% 
#   mutate(Scientific.name = comm2sci(Species))
dfSpecies <- dfSpecies %>% 
  mutate(Scientific.name = ifelse(Scientific.name == "character(0)", NA, Scientific.name))

lstCommon <- unique(dfSpecies$Species)
lstUID <- get_uid(lstCommon, modifier = "Common Name")
lstSci <- comm2sci(lstUID)


### logical var for ancient woodland indicators --------------------------------

AWIindicators <- c("Woodruff",
                   "Wood melick",
                   "Yellow archangel",
                   "Wych elm",
                   "Wood spurge",
                   "Dog's mercury",
                   "Small-leaved lime",
                   "Sanicle",
                   "Herb paris",
                   "Hairy brome",
                   "Wood millet",
                   "Wood sedge",
                   "Spindle",
                   "Wood speedwell",
                   "Lily-of-the-valley",
                   "Toothwort",
                   "Goldilocks buttercup",
                   "Wild service",
                   "Early dog violet",
                   "Giant fescue",
                   "Wood sorrell",
                   "Slender St. John's-wort",
                   "Common cow wheat",
                   "Hairy wood-rush",
                   "Bluebell",
                   "Wood anenome",
                   "Bitter vetch",
                   "Bilberry",
                   "Scaly male-fern",
                   "Hard fern",
                   "Yellow pimpernel",
                   "Remote sedge",
                   "Great wood-rush",
                   "Opposite-leaved golden-saxifrage",
                   "Water avens",
                   "Pendulous sedge",
                   "Wood horsetail",
                   "Ramsons",
                   "Moschatel",
                   "Red currant")