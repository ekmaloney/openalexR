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
  num_pages <- get_number_of_pages(page1_path = entire_path)

  #get data
  res <- get_all_data_for_query(base_page_path = entire_path,
                                number_of_pages = num_pages)

  return(res)

}
