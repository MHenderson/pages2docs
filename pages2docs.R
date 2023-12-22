source("R/mkdocs_pages_out.R")
source("R/read-pages.R")

pages_path <- file.path(Sys.getenv("HOME"), "001_Project", "Writing", "Memoir", "pages")

pages <- read_pages(pages_path, years = 2020:2023)

pages_out <- pages |>
    #filter(lubridate::year(ymd) %in% c(2019, 2018, 2017)) %>%
    #filter(lubridate::month(ymd) %in% c(6, 5, 4)) %>%
    mkdocs_pages_out()

purrr::walk(pages_out$new_dir, dir.create, recursive = TRUE, showWarnings = FALSE)

purrr::walk2(pages_out$new_text, pages_out$new_path, readr::write_file)
