#' Get Coauthors
#'
#' @param id_type the type of id for the ego author you are using, should be one of: orcid, openalex, scopus, or mag
#' @param id the id matching the author you want to retrieve the coauthors for
#'
#' @return a tibble with 5 columns: paper_id, ego_author_id, ego_author_name, alter_author_id, and alter_author_name
#' @export
#'
#' @examples get_coauthors(id_type = "openalex", id = "A2941293769")
get_coauthors <- function(id_type = c("orcid", "openalex",
                                      "scopus", "mag"),
                          id){


  coauthorship_edgelist <- purrr::map2_df(id_type,
                                  id,
                                  inner_coauth_function)

  ego_authors <- find_author(id_type, id)
  ego_authors <- ego_authors %>%
                 dplyr::mutate(ego_author_name = name,
                               ego_author = stringr::str_remove(openalex_id, "https://openalex.org/")) %>%
                  dplyr::select(ego_author_name, ego_author)

  coauthorship_edgelist <- dplyr::left_join(coauthorship_edgelist, ego_authors)



    return(coauthorship_edgelist)


}


inner_coauth_function <- function(id_type, id){
  #get all papers and unnest authorships
  papers <- get_authors_papers(id_type, id) %>%
    tidyr::unnest(authorships, names_sep = "_")

  #make edgelist
  papers_authors <- tibble::tibble(paper_id = papers$id,
                                   ego_author = stringr::str_remove(id, "https://openalex.org/"),
                                   alter_author = stringr::str_remove(papers$authorships_author$id,
                                                                      "https://openalex.org/"),
                                   alter_author_name = papers$authorships_author$display_name) %>%
                    dplyr::filter(ego_author != alter_author)

  return(papers_authors)
}
