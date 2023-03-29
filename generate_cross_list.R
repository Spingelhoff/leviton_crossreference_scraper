source("setup_libraries.R")

generate_cross_list <- function() {
  source("retrieve_items_to_cross.R")
  source("access_lev_reference.R")

  item_list <- retrieve_items_to_cross()

  apply(
    item_list,
    MARGIN = 1,
    "access_lev_reference"
  )
}
