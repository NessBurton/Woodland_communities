
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

df_Species <- read.csv(paste0(dirData,"Tree_Species_Handbook_database_Feb24.csv"))
head(df_Species)
summary(df_Species)
