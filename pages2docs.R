source("R/mkdocs-pages-out.R")
source("R/read-pages.R")
source("R/write-docs.R")

pages_out <- file.path(Sys.getenv("PAGESPATH")) |>
  read_pages(years = 2023) |>
  mkdocs_pages_out() |>
  write_docs()
