#' Find Institution
#'
#' @param id_type the type of ids, should be one of: openalex, ror, mag, grid,
#' wikipedia, or wikidata
#' @param id one or more ids for finding
#'
#' @return tibble of institution info
#' @export
#'
#' @examples find_institution(id_type = "openalex", id = c("I170897317", "I114027177"))
find_institution <- function(id_type = c("openalex",
                                         "ror",
                                         "mag",
                                         "grid",
                                         "wikipedia",
                                         "wikidata"),
                             id){

  path <- paste0("http://api.openalex.org/instutions/",
                 id_type, ":", id)

  inst_info <- purrr::map(path, openalex_api)

  inst_info_df <- purrr::map_df(inst_info, clean_institution_data)

  return(inst_info_df)

}


clean_institution_data <- function(inst_info){

  inst_info_df <- tibble::tibble(oa_id = inst_info[["id"]],
                                 ror = inst_info[["ror"]],
                                 institution_name = inst_info[["display_name"]],
                                 country_code = inst_info[["country_code"]],
                                 type = inst_info[["type"]],
                                 homepage_url = inst_info[["homepage_url"]],
                                 image_url = inst_info[["image_url"]],
                                 inst_name_acronym = list(inst_info[["display_name_acronyms"]]),
                                 inst_name_alternatives = list(inst_info[["display_name_alternatives"]]),
                                 total_works_counts = inst_info[["works_count"]],
                                 total_cited_by_counts = inst_info[["cited_by_count"]],
                                 grid_id = inst_info[["ids"]][["grid"]],
                                 wikipedia_id = inst_info[["ids"]][["wikipedia"]],
                                 wikidata_id = inst_info[["ids"]][["wikidata"]],
                                 mag = inst_info[["ids"]][["mag"]],
                                 city = inst_info[["geo"]][["city"]],
                                 city_id = inst_info[["geo"]][["geonames_city_id"]],
                                 region = inst_info[["geo"]][["region"]],
                                 country = inst_info[["geo"]][["country"]],
                                 latitude = inst_info[["geo"]][["latitude"]],
                                 longitude = inst_info[["geo"]][["longitude"]],
                                 international_names = list(inst_info[["international"]][["display_name"]]),
                                 associated_institutions = list(
                                   tibble::tibble(associated_oa_id = inst_info[["associated_institutions"]][["id"]],
                                                  associated_ror = inst_info[["associated_institutions"]][["ror"]],
                                                  associated_type = inst_info[["associated_institutions"]][["type"]],
                                                  associated_relationship = inst_info[["associated_institutions"]][["relationship"]])),
                                 citation_counts_year = list(
                                   tibble::tibble(year = inst_info[["counts_by_year"]][["year"]],
                                                  works_count = inst_info[["counts_by_year"]][["works_count"]],
                                                  cited_by_count = inst_info[["counts_by_year"]][["cited_by_count"]])),

                                 concepts = list(
                                   tibble::tibble(concepts_id = inst_info[["x_concepts"]],
                                                  concepts_wikidata = inst_info[["x_concepts"]][["wikidata"]],
                                                  concepts_name = inst_info[["x_concepts"]][["display_name"]],
                                                  concepts_level = inst_info[["x_concepts"]][["level"]],
                                                  concepts_score = inst_info[["x_concepts"]][["score"]])),
                                url_all_works = inst_info[["works_api_url"]],
                                updated_date = inst_info[["updated_date"]])

  return(inst_info_df)

}
