f <- function(month, year) {
  folder <- paste0("docs/", year, "/", month)
  month_name <- month.name[as.numeric(month)]
  my_list <- list()
  my_list[[month_name]] <- folder |>
    dir_ls(glob = "*.md") |>
    gsub("docs/", "", .) |>
    as.character() |>
    as.list()
  return(my_list)
}
