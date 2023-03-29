source("setup_libraries.R")

retrieve_items_to_cross <- function() {
  source_list <- read_all_csv_from_data("item_list") |>
    bind_rows() |>
    mutate(
      Source = str_replace(Source, "^...-", "")
    )
}
