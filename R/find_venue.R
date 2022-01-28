#' Find Venue
#'
#' @param id_type type of id you are submitting, should be one of openalex,
#' issn_l, mag, or issn
#' @param id one or more ids that correspond to the id type
#'
#' @return tibble of results from api
#' @export
#'
#' @examples find_venue(id_type = "openalex", id = c("https://openalex.org/V131591925",
#' "https://openalex.org/V125754415"))
find_venue <- function(id_type = c("openalex",
                                   "issn_l",
                                   "mag",
                                   "issn"),
                       id){

    path <- paste0("http://api.openalex.org/venues/",
                   id_type, ":", id)

    venue_info <- purrr::map(path, openalex_api)

    venue_info_df <- purrr::map_df(venue_info, clean_venue_info)

    return(venue_info_df)
}


#' Clean Venue Info
#'
#' @param venue_info list from find_venue function
#'
#' @return tibble with venue information
#' @export
#'
#' @examples
clean_venue_info <- function(venue_info){

  venue_info_df <- tibble::tibble(open_alex_id = venue_info[["id"]],
                                  issn_l = venue_info[["issn_l"]],
                                  issn = venue_info[["issn"]],
                                  display_name = venue_info[["display_name"]],
                                  publisher = venue_info[["publisher"]],
                                  total_works_count = venue_info[["works_count"]],
                                  total_cited_by_count = venue_info[["cited_by_count"]],
                                  open_access = venue_info[["is_oa"]],
                                  doaj = venue_info[["is_in_doaj"]],
                                  mag = venue_info[["ids"]][["mag"]],
                                  citation_counts_year = list(tibble::tibble(
                                   year =  venue_info[["counts_by_year"]][["year"]],
                                   works_count = venue_info[["counts_by_year"]][["works_count"]],
                                   cited_by_count = venue_info[["counts_by_year"]][["cited_by_count"]]
                                  )),
                                  concepts = list(tibble::tibble(
                                    concepts_id = venue_info[["x_concepts"]][["id"]],
                                    concepts_wikidata = venue_info[["x_concepts"]][["wikidata"]],
                                    concepts_name = venue_info[["x_concepts"]][["display_name"]],
                                    concepts_level = venue_info[["x_concepts"]][["level"]],
                                    concepts_score = venue_info[["x_concepts"]][["score"]]
                                  )),
                                  url_all_works = venue_info[["works_api_url"]],
                                  updated_date = venue_info[["updated_date"]])

}
