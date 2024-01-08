write_docs <- function(X, output_location = ".") {
  purrr::walk(dirname(file.path(output_location, X$new_path)), dir.create, recursive = TRUE, showWarnings = FALSE)
  purrr::walk2(X$new_text, file.path(output_location, X$new_path), readr::write_file)
}