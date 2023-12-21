mkdocs_pages_out <- function(X) {
  X |>
    dplyr::mutate(
      day = format(ymd, "%A, %d"),
      month = lubridate::month(ymd, label = TRUE, abbr = FALSE),
      new_path = sub(".*/pages/", "docs/", paths),
      #new_path = sub(".md", ".Rmd", new_path),
      new_dir = dirname(new_path),
      text = sub("%", "#", text)
    ) |>
    dplyr::group_by(month) |>
    dplyr::mutate(
      i = dplyr::row_number()
    ) |>
    dplyr::mutate(
      header = dplyr::case_when(
        i == 1 ~ paste0("# ", month, "\n\n"),
        i != 1 ~ ""
      ),
      new_text = paste0(header, text, sep = "\n"),
      new_text = text
    ) |>
    dplyr::ungroup()
}
