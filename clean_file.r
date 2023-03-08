library(tidyverse)
library(readxl)
library(here)
library(readr)
library(fs)
library(tools)

ci_np <- read_excel(here("data", "ci_np.xlsx"))
newTib <- ci_np %>% 
   mutate(visitors = sprintf("%08d",visitors)) %>% 
   write_delim(here("test.data"), col_names = FALSE, delim = "")
fullPath <- file.choose()
fName <- path_file(fullPath)
baseName <- file_path_sans_ext(fName)
fExt <- file_ext(fName)
