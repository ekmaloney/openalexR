#' Find Paper
#'
#' Get Paper details
#'
#' @param id_type the type of id you are using to locate the author: must be either orcid
#' or openalex
#' @param id the id for the author that matches the type selected initially
#'
#' @return list (sorry) of paper info
#' @export
#'
#' @examples find_paper(id_type = "doi", id = "https://doi.org/10.7717/peerj.4375")
find_paper <- function(id_type = c("open_alex", "doi"),
                       id){

  paper_path <- dplyr::case_when(id_type == "doi" ~ paste0("id.doi:", id),
                                id_type == "openalex" ~ paste0("id.openalex:", id))

  path <- paste0("https://api.openalex.org/works/filter=", paper_path)

  paper_info <- openalex_api(path)

}

