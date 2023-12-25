write_docs <- function(X) {
  purrr::walk(X$new_dir, dir.create, recursive = TRUE, showWarnings = FALSE)
  purrr::walk2(X$new_text, X$new_path, readr::write_file)
}