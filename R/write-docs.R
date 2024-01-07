write_docs <- function(X) {
  purrr::walk(dirname(X$new_path), dir.create, recursive = TRUE, showWarnings = FALSE)
  purrr::walk2(X$new_text, X$new_path, readr::write_file)
}