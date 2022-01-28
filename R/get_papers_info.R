#' Find Work
#'
#' Find Work details
#'
#' @param id_type the type of id you are using to locate the author: must be either orcid
#' or openalex
#' @param id the id(s) for the work that matches the type selected initially
#' @param variable_unnest the column(s) you want to unnest by to make the dataframe longer -
#' options are authors, concepts, referenced_works, related_works, and
#' citation_counts_year
#'
#' @return tibble of paper info
#' @export
#'
#' @examples find_work(id_type = "doi", id = "https://doi.org/10.7717/peerj.4375")
#'
find_work <- function(id_type = c("open_alex", "doi", "mag", "pmid", "pmcid"),
                       id,
                       variable_unnest = NULL){

  #set the filtering path based on the id_type
  paper_path <- dplyr::case_when(id_type == "doi" ~ paste0("id.doi:", id),
                                id_type == "openalex" ~ paste0("id.openalex:", id),
                                id_type == "mag" ~ paste0("id.mag", id),
                                id_type == "pmid" ~ paste0("id.pmid", id),
                                id_type == "pmcid" ~ paste0("id.pmcid", id))

  #put together the overall paths
  path <- paste0("https://api.openalex.org/works/filter=", paper_path)

  #get the results
  paper_info <- purrr::map(path, openalex_api)

  #put into nicer format
  paper_info_df <- purrr::map_df(paper_info, clean_works_result)


  #unnest if needed
  if(!is.null(variable_unnest)){
    paper_info_df <- paper_info_df %>%
      tidyr::unnest_longer(variable_unnest)
  }

  return(paper_info_df)

}


#' Clean Works Info
#'
#' @param paper_info list object with results from the find_work call
#'
#' @return dataframe with one row per work object
#' @export
#'
#' @examples
clean_works_result <- function(paper_info){

  #making list into df
  #choosing not to include the abstracts because idk how to deal with them
  paper_info_df <- tibble::tibble(id = paper_info$id,
                                  title = paper_info[["display_name"]],
                                  publication_date = paper_info[["publication_date"]],
                                  openalexid = paper_info[["ids"]]$openalex,
                                  doi = paper_info[["ids"]]$doi,
                                  pmid = paper_info[["ids"]]$pmid,
                                  mag = paper_info[["ids"]]$mag,
                                  host_venue_info = list(tibble::tibble(host_venue_id = paper_info[["host_venue"]]$id,
                                                                        host_venue_issn = paper_info[["host_venue"]]$issn,
                                                                        host_venue_name = paper_info[["host_venue"]]$display_name,
                                                                        host_venue_publisher = paper_info[["host_venue"]]$publisher,
                                                                        host_venue_type = paper_info[["host_venue"]]$type,
                                                                        host_venue_url = paper_info[["host_venue"]]$url,
                                                                        host_venue_open_access = paper_info[["host_venue"]]$is_oa)),
                                  works_type = paper_info$type,
                                  open_access = paper_info[["open_access"]]$is_oa,
                                  open_access_status = paper_info[["open_access"]]$oa_status,
                                  open_access_url = paper_info[["open_access"]]$oa_url,
                                  authors = list(tibble::tibble(author_id = paper_info[["authorships"]][["author"]][["id"]],
                                                                author_name = paper_info[["authorships"]][["author"]][["display_name"]],
                                                                author_orcid = paper_info[["authorships"]][["author"]][["orcid"]])),
                                  citation_count = paper_info$cited_by_count,
                                  concepts = list(paper_info$concepts),
                                  referenced_works = list(paper_info[["referenced_works"]]),
                                  related_works = list(paper_info[["related_works"]]),
                                  citation_counts_year = list(paper_info[["counts_by_year"]]))

  return(paper_info_df)
}
