#' Get links for each page
#'
#' @param page1_path the url of the first page of results
#'
#' @return the links to request
#' @export
#'
#' @examples
get_links_for_each_page <- function(page1_path){
  author_papers <- purrr::map(page1_path, openalex_api)

  n_pages <- purrr::map(author_papers, get_number_of_pages)

  all_links <- purrr::map2(page1_path, n_pages, construct_links)
  all_links <- unlist(all_links)

  return(all_links)
}


#' Construct Links
#'
#' @param path
#' @param n_page
#'
#' @return
#' @export
#'
#' @examples
construct_links <- function(path, n_page){

  links <- tibble::tibble(path = path,
                  n_page = seq(from = 1, to = n_page, by = 1),
                  url = paste0(path, "&page=", n_page))


  return(links$url)
}


#' Get Number of Pages
#'
#' @param author_papers
#'
#' @return
#' @export
#'
#' @examples
get_number_of_pages <- function(author_papers){

  n_page <- ceiling(author_papers$meta$count/25)

  return(n_page)
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
