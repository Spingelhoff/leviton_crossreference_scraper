access_lev_reference <- function(product) {

  html_search_start <- "https://www.leviton.com/en/support/resources-tools/manufacturer-cross-reference?id-upc="
  html_search_end <- "&itemsPerPage=1&page=1"

  html_link <- str_c(
    html_search_start,
    product,
    html_search_end
  )

  read_html(html_link)
}
