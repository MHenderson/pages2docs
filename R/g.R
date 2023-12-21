g <- function(year) {
  my_list <- list()
  my_list[[paste0("20", year)]] <- sprintf("%02d", 1:12) |>
    map(possibly(f, otherwise = NA), year = year)
  my_list <- lapply(my_list, function(x) x[!is.na(x)])
  return(my_list)
}
