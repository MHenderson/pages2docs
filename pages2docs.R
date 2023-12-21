source("R/mkdocs_pages_out.R")

read_pages <- function(path, years = c(2021)) {
  tibble::tibble(
    paths = list.files(
      path = path,
      recursive = TRUE,
      pattern = "[0123456789]{2}_[0123456789]{2}_[0123456789]{2}.md$",
      full.names = TRUE
    )
  ) |>
  dplyr::mutate(
    text = purrr::map_chr(paths, readr::read_file)
  ) |>
  dplyr::mutate(
    ymd = lubridate::ymd(gsub(".md", "", basename(paths)))
  ) |>
  dplyr::filter(lubridate::year(ymd) %in% years)
}

pages_path <- file.path(Sys.getenv("HOME"), "001_Project", "Writing", "Memoir", "pages")

(pages <- read_pages(pages_path, years = 2013:2023))

(pages_out <- pages |>
    #filter(lubridate::year(ymd) %in% c(2019, 2018, 2017)) %>%
    #filter(lubridate::month(ymd) %in% c(6, 5, 4)) %>%
    mkdocs_pages_out())

purrr::walk(pages_out$new_dir, dir.create, recursive = TRUE, showWarnings = FALSE)

purrr::walk2(pages_out$new_text, pages_out$new_path, readr::write_file)
