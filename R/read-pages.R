pages_to_read <- function(pagespath, years) {
  tibble::tibble(
    paths = list.files(
            path = pagespath,
       recursive = TRUE,
         pattern = "[0123456789]{2}_[0123456789]{2}_[0123456789]{2}.md$",
      full.names = TRUE
    )
  ) |>
  dplyr::mutate(
    ymd = lubridate::ymd(gsub(".md", "", basename(paths)))
  ) |>
  dplyr::filter(lubridate::year(ymd) %in% years)
}

read_pages <- function(pagespath, years = c(2023)) {
  pages_to_read(pagespath, years) |>
    dplyr::mutate(
      text = purrr::map_chr(paths, readr::read_file)
    )
}