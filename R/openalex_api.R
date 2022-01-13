#' openalex_api
#'
#' Baseline function for calling the API and parsing results
#'
#' @param path the url path to use in the GET request to the openalex API
#'
#' @return list of parsed JSON returned from the API
#' @export
#'
#' @examples openalex_api(path = "https://api.openalex.org/works/W2741809807")
openalex_api <- function(path){

  resp <- httr::GET(path)

  #checking that we are getting JSON
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  #indicating to user if there's an issue with the API request
  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "OpenAlex API request failed [%s]\n%s\n<%s>",
        httr::status_code(resp),
        parsed$message,
        parsed$documentation_url
      ),
      call. = FALSE
    )
  }


  parsed <- jsonlite::fromJSON(httr::content(resp, "text", encoding = "UTF-8"))

  if(stringr::str_detect(path, "author")){
    if(parsed$meta$count == 0){
      stop(
        sprintf(
          "No records were found in the OpenAlex Database matching that author id."
        )
      )
    }
  }



  return(parsed)

}

