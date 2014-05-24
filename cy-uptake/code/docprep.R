# document prep.

library(devtools)
devtools::install_github("rstudio/rmarkdown")
library(rmarkdown)
?render
render("cyChange.Rmd", output_format = "pdf_document")
