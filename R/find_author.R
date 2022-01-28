#' Find Author(s)
#'
#' @param id_type the type of ids you are submitting, should be: openalex, orcid,
#' mag, twitter, wikipedia, or scopus
#' @param id one or more ids
#'
#' @return tibble of results from openalex api
#' @export
#'
#' @examples find_author(id_type = "openalex", id = c("A2941293769", "A2296125463"))
find_author <- function(id_type = c("openalex",
                                    "orcid",
                                    "mag",
                                    "twitter",
                                    "wikipedia",
                                    "scopus"),
                        id){

  #set the filtering path based on the id_type
  author_path <- paste0("https://api.openalex.org/authors/filter=", "id.",
                        id_type, ":", id)

  #get all of the results
  author_info <- purrr::map(author_path, openalex_api)

  #make into tibble
  author_info_df <- purrr::map_df(author_info, clean_author_info)

}


#' Clean Author Info
#'
#' @param author_info list of results from find_author
#'
#' @return tibble of results
#' @export
#'
#' @examples
clean_author_info <- function(author_info){

  author_info_df <- tibble::tibble(openalex_id = author_info[["id"]],
                           orcid = author_info[["orcid"]],
                           name = author_info[["display_name"]],
                           total_works = author_info[["works_count"]],
                           total_cited_by_count = author_info[["cited_by_count"]],
                           mag = author_info[["ids"]][["mag"]],
                           last_institution_id = author_info[["last_known_institution"]][["id"]],
                           last_instution_ror = author_info[["last_known_institution"]][["ror"]],
                           last_institution_name = author_info[["last_known_institution"]][["display_name"]],
                           last_instution_country_code = author_info[["last_known_institution"]][["country_code"]],
                           last_institution_type = author_info[["last_known_institution"]][["type"]],
                           citation_by_year = list(tibble::tibble(year = author_info[["counts_by_year"]][["year"]],
                                                     works_count = author_info[["counts_by_year"]][["works_count"]],
                                                     cited_by_count = author_info[["counts_by_year"]][["cited_by_count"]])),
                          concepts = list(tibble::tibble(concepts_id = author_info[["x_concepts"]][["id"]],
                                            concepts_wikidata = author_info[["x_concepts"]][["wikidata"]],
                                            concepts_display_name = author_info[["x_concepts"]][["display_name"]],
                                            concepts_level = author_info[["x_concepts"]][["level"]],
                                            concepts_score = author_info[["x_concepts"]][["score"]])),
                          updated_date = author_info[["updated_date"]],
                          url_all_works = author_info[["works_api_url"]])


}
