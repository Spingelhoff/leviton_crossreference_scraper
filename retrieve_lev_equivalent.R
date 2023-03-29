source("setup_libraries.R")

retrieve_lev_equivalent <- function() {
  source("generate_cross_list.R")

  link_html_list <- generate_cross_list()

  crawl_nodes_for_lev <- function(x) {
    result <- x |>
      html_elements(".ss-md.product__title") |>
      html_element("a") |>
      html_attr("href") |>
      str_remove("/en/products/") |>
      str_to_upper() |>
      as.character() # coerce from list to character to allow for row binding

    prefixed_result <- str_c(
      "LEV-",
      result
    )

    standardized_result <- if(!length(prefixed_result) == 1) {
      "NO MATCH FOUND"
    } else {
      prefixed_result
    }
  }

  lev_conversions <- lapply(
    link_html_list,
    "crawl_nodes_for_lev"
  ) |>
    cbind()

  item_list <- read_all_csv_from_data("item_list") |>
    bind_rows()

  cbind(
    item_list,
    unlist(lev_conversions)
  ) |>
    save_csv_to_results_folder(
      "lev_translated_item_lists",
      str_c(
        str_remove(list_data_files("item_list"), ".csv"),
        "_translation_",
        Sys.Date()
      )
    )
}
