library(purrr)
library(readr)

source("R/mkdocs_pages_out.R")
source("R/read-pages.R")

pages_out <- file.path(Sys.getenv("PAGESPATH")) |>
  read_pages(years = 2023) |>
  mkdocs_pages_out()

walk(pages_out$new_dir, dir.create, recursive = TRUE, showWarnings = FALSE)

walk2(pages_out$new_text, pages_out$new_path, write_file)
