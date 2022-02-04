#### Preamble ####
# Purpose: Download data from opendatatoronto
# Author: Eunkyo Oh
# Data: 3 February 2022
# Contact: g.oh@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)

#### Data Download ####
# From https://open.toronto.ca/dataset/places-of-worship/

# Datasets are grouped into packages that have multiple datasets also called
# resources, that are releveant to that topic. So we first look at the package
# using a unique key that we obtain from the datasets webpage (see above).

# get all resources for this package
resources <- list_package_resources("8e22e693-3394-4dfa-8dc0-eb436db38603")

# load the second datastore resource (geojson) as a sample
religious_locations <-
  filter(resources, row_number() == 2) %>% 
  get_resource()

### Save Data ###
write_csv(religious_locations, "inputs/data/religious_locations.csv")