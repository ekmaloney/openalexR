#' Get Authors Papers
#'
#' @param id_type the type of id you are using to locate the author: must be either orcid
#' or openalex
#' @param id the id for the author that matches the type selected initially
#'
#' @return dataframe with all papers from that author, includes variables:
#' id: openalex id of the paper
#' display_name: title of the paper
#' publication date: date of publication in YYYY-MM-DD form
#' relevance score: ?Not sure what this is, all NA for me atm
#' authorships: nested dataframe of all authors in the paper (includes author.id,
#' author_position, author.display_name, and author.orcid)
#' concepts: nested dataframe of the concepts associated with the paper (includes openalex's
#' id of the concept, display.name of the concept, score of the concept, level of the
#' concept in the concept hierarchy, and wikidata of the concept)
#' alternate_host_venues: ?Not sure what this is either, will need to check on openalex's page
#' cited_by_count: number of other papers that have cited the paper
#' publication_year: int
#' cited_by_api_url: openalex api url for the papers that have cited this paper
#' doi: doi of the paper
#' type: type of paper (e.g. proceedings-article, journal-article, book-chapter,
#' posted-content)
#' is_paratext: ?Not sure what this is either, will need to check on openalex's page
#' is_retracted: TRUE/FALSE whether paper has been retracted
#' referenced_works: list of all works referenced in paper (with openalex urls :) )
#' related_works: similar works? not sure how these are found
#'
#' @export
#'
#' @examples get_authors_papers(id_type = "openalex", id = "A2941293769")
get_authors_papers <- function(id_type = c("orcid", "openalex",
                                           "scopus", "mag"),
                               id){

    #construct path specific to the author
    author_path <- dplyr::case_when(id_type == "orcid" ~ paste0("author.orcid:", id),
                             id_type == "openalex" ~ paste0("author.id:", id))

    #paste that to the rest of the url
    entire_path <- paste0("https://api.openalex.org/works?filter=", author_path)

    #get the total number of pages with their info
    all_links <- get_links_for_each_page(page1_path = entire_path)

    #get data
    res <- purrr::map(all_links, openalex_api)
    res_df <- purrr::map_df(res, clean_all_author_results)

  return(res_df)

}

clean_all_author_results <- function(res_list){
 res_df <- tibble::tibble(id = res_list[["results"]][["id"]],
                          doi = res_list[["results"]][["ids"]][["doi"]],
                          mag = res_list[["results"]][["ids"]][["mag"]],
                          openalex = res_list[["results"]][["ids"]][["openalex"]],
                          pmid = res_list[["results"]][["ids"]][["pmid"]],
                          title = res_list[["results"]][["display_name"]],
                          publication_date = res_list[["results"]][["publication_date"]],
                          relevance_score = res_list[["results"]][["relevance_score"]],
                          host_venue_id = res_list[["results"]][["host_venue"]][["id"]],
                          host_venue_name = res_list[["results"]][["host_venue"]][["display_name"]],
                          host_venue_publisher = res_list[["results"]][["host_venue"]][["publisher"]],
                          host_venue_issn = res_list[["results"]][["host_venue"]][["issn"]],
                          host_venue_iss_l = res_list[["results"]][["host_venue"]][["issn_l"]],
                          host_venue_type = res_list[["results"]][["host_venue"]][["type"]],
                          host_venue_url = res_list[["results"]][["host_venue"]][["url"]],
                          host_venue_oa = res_list[["results"]][["host_venue"]][["is_oa"]],
                          host_venue_version = res_list[["results"]][["host_venue"]][["version"]],
                          host_venue_license = res_list[["results"]][["host_venue"]][["license"]],
                          authorships = res_list[["results"]][["authorships"]],
                          concepts = res_list[["results"]][["concepts"]],
                          alternate_host_venues = res_list[["results"]][["alternate_host_venues"]],
                          cited_by_count = res_list[["results"]][["cited_by_count"]],
                          publication_year = res_list[["results"]][["publication_year"]],
                          cited_by_url = res_list[["results"]][["cited_by_api_url"]],
                          type = res_list[["results"]][["type"]],
                          paratext = res_list[["results"]][["is_paratext"]],
                          retracted = res_list[["results"]][["is_retracted"]],
                          referenced_works = res_list[["results"]][["referenced_works"]],
                          related_works = res_list[["results"]][["related_works"]])

 return(res_df)
}


unnest_authorship <- function(authorships_list){

  institutions_flattened <- purrr::flatten(authorships_list$institutions)

  authorships_tibble <- tibble::tibble(author_id = authorships_list$author$id,
                                       author_name = authorships_list$author$display_name,
                                       author_orcid = authorships_list$author$orcid,
                                       institution_id = institutions_flattened[["id"]],
                                       institution_name = institutions_flattened[["display_name"]],
                                       institution_ror = institutions_flattened[["ror"]],
                                       institution_country_code = institutions_flattened[["country_code"]],
                                       institution_type = institutions_flattened[["type"]],
                                       author_position = authorships_list$author_position,
                                       author_raw_affiliation = authorships_list$raw_affiliation_string)

  return(authorships_tibble)
}

