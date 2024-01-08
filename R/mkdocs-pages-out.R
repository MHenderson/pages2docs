mkdocs_pages_out <- function(X) {
  X |>
    dplyr::mutate(
           day = format(ymd, "%A, %d"),
         month = lubridate::month(ymd, label = TRUE, abbr = FALSE),
      new_path = sub(".*/pages/", "docs/", paths),
      new_text = sub("%", "#", text)
    )
}
