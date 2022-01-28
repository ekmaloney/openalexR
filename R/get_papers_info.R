#' Find Paper
#'
#' Get Paper details
#'
#' @param id_type the type of id you are using to locate the author: must be either orcid
#' or openalex
#' @param id the id for the author that matches the type selected initially
#' @param variable_unnest the column(s) you want to unnest by to make the dataframe longer -
#' options are authorships, concepts, referenced_works, related_works, and
#' citation_counts_year
#'
#' @return list (sorry) of paper info
#' @export
#'
#' @examples find_paper(id_type = "doi", id = "https://doi.org/10.7717/peerj.4375")
#'
find_paper <- function(id_type = c("open_alex", "doi"),
                       id,
                       variable_unnest = NULL){

  paper_path <- dplyr::case_when(id_type == "doi" ~ paste0("id.doi:", id),
                                id_type == "openalex" ~ paste0("id.openalex:", id))

  path <- paste0("https://api.openalex.org/works/filter=", paper_path)

  paper_info <- openalex_api(path)

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

  if(!is.null(variable_unnest)){
    paper_info_df <- paper_info_df %>%
            tidyr::unnest_longer(variable_unnest)
  }

  return(paper_info_df)

}
