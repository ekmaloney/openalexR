#' Get number of pages of results
#'
#' @param page1_path the url of the first page of results
#'
#' @return the total number of pages needed to get all of the results
#' @export
#'
#' @examples get_number_of_pages("https://api.openalex.org/concepts?filter=level:1")
get_number_of_pages <- function(page1_path){
  author_papers <- openalex_api(page1_path)

  num_pages <- ceiling(author_papers$meta$count/25)

  return(num_pages)
}

#' Get Data from Page
#'
#' Convenience function to get the data from each page -- only pulling out the
#' results
#'
#' @param page_path the url for the page of API results
#'
#' @return df with results from that page
#' @export
#'
#' @examples get_data_from_page("https://api.openalex.org/concepts?filter=level:1")
get_data_from_page <- function(page_path){

  page_results <- openalex_api(page_path)$results

  return(page_results)

}

#' Get all data for Query
#'
#' Queries the openalex api for the data matching your query
#'
#' @param base_page_path the string corresponding to the API query
#' @param number_of_pages total number of pages of results retured by the API query
#'
#' @return dataframe of results matching your query
#' @export
#'
#' @examples
get_all_data_for_query <- function(base_page_path, number_of_pages){

  #make df of the paths
  urls <- data.frame(page_number = seq(from = 1, to = number_of_pages, by = 1)) %>%
          dplyr::mutate(url = paste0(base_page_path, "&page=", page_number))


  #apply function to each row of the df
  res <- urls$url %>% purrr::map_df(get_data_from_page)

  return(res)

}
