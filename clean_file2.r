library(tidyverse)
library(here)
library(readr)
library(fs)
library(tools)

fullPath <- file.choose()
fName <- path_file(fullPath)
baseName <- file_path_sans_ext(fName)
fExt <- file_ext(fName)

# Read data from non-delimited user-specified file
lehd_file <- read_fwf(fullPath,
                      fwf_widths(c(22,40,2,10,18),
                                 c("Fill1","Name","FIPS","UIN","Fill2")),
                      col_types = "ccccc",
                      n_max = 20
                      )

lehd_File %>% 
   mutate(visitors = sprintf("%08d",visitors)) %>% 
#  subset(State=='KY') %>% 
#  mutate(State='21') %>% 
   write_delim(here(paste(baseName,"_Cleaned.",fExt)), col_names = FALSE, delim = "")

