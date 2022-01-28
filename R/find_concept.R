#' Find Concept
#'
#' @param id_type
#' @param id
#'
#' @return
#' @export
#'
#' @examples
find_concept <- function(id_type = c("openalex",
                                     "wikidata",
                                     "mag",
                                     "wikipedia",
                                     "umls_aui",
                                     "umls_cui"),
                         id){

  path <- paste0("http://api.openalex.org/instutions/",
                 id_type, ":", id)

  concept_info <- purrr::map(path, openalex_api)

  concept_info_df <- purrr::map_df(concept_info, clean_concept_info)


}

clean_concept_info <- function(concept_info){

  concept_info_df <- tibble::tibble(concept_oa_id = concept_info[["id"]],
                                    wikidata_id = concept_info[["wikidata"]],
                                    concept_name = concept_info[["display_name"]],
                                    concept_level = concept_info[["level"]],
                                    concept_description = concept_info[["description"]],
                                    works_count = concept_info[["works_count"]],
                                    cited_by_count = concept_info[["cited_by_count"]],
                                    wikipedia_id = concept_info[["ids"]][["wikipedia"]],
                                    umls_aui_id = list(concept_info[["ids"]][["umls_aui"]]),
                                    umls_cui_id = list(concept_info[["ids"]][["umls_cui"]]),
                                    mag = concept_info[["ids"]][["mag"]],
                                    image_url = concept_info[["image_url"]],
                                    international_names = list(concept_info[["international"]][["display_name"]]),
                                    international_descriptions = list(concept_info[["international"]][["description"]]),
                                    concept_ancestors = list(
                                      tibble::tibble(concept_id = concept_info[["ancestors"]][["id"]],
                                                     concept_wikidata = concept_info[["ancestors"]][["wikidata"]],
                                                     concept_name = concept_info[["ancestors"]][["display_name"]],
                                                     concept_level = concept_info[["ancestors"]][["level"]])
                                    ),
                                    related_concepts = list(
                                      tibble::tibble(concept_id = concept_info[["related_concepts"]][["id"]],
                                                     concept_wikidata = concept_info[["related_concepts"]][["wikidata"]],
                                                     concept_name = concept_info[["related_concepts"]][["display_name"]],
                                                     concept_level = concept_info[["related_concepts"]][["level"]],
                                                     concept_score = concept_info[["related_concepts"]][["score"]])
                                    ),
                                    citation_counts_year = list(
                                      tibble::tibble(year = concept_info[["counts_by_year"]][["year"]],
                                                     works_count = concept_info[["counts_by_year"]][["works_count"]],
                                                     cited_by_count = concept_info[["counts_by_year"]][["cited_by_count"]])
                                    ),
                                    url_all_works = concept_info[["works_api_url"]],
                                    updated_date = concept_info[["updated_date"]])

  return(concept_info_df)

}
