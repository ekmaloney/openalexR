
<!-- README.md is generated from README.Rmd. Please edit that file -->

# openalexR

<!-- badges: start -->
<!-- badges: end -->

The goal of openalexR is to …

## Installation

You can install the development version of openalexR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ekmaloney/openalexR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(openalexR)
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
#> ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
#> ✓ tibble  3.1.6     ✓ dplyr   1.0.7
#> ✓ tidyr   1.1.4     ✓ stringr 1.4.0
#> ✓ readr   2.1.1     ✓ forcats 0.5.1
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()

#find a paper in the openalex database: 

#Example: "Analysis of the glottal excitation of emotionally styled and stressed speech,"
#one of my mother's publications when she was an electrical engineer at Georgia Tech
#I will use the doi to retrieve it: 

paper_info <- find_paper(id_type = "doi", 
                         id = "https://doi.org/10.1121/1.413664",
                         variable_unnest = "authors")

glimpse(paper_info)
#> Rows: 2
#> Columns: 17
#> $ id                   <chr> "https://openalex.org/W2062207950", "https://open…
#> $ title                <chr> "Analysis of the glottal excitation of emotionall…
#> $ publication_date     <chr> "1995-07-01", "1995-07-01"
#> $ openalexid           <chr> "https://openalex.org/W2062207950", "https://open…
#> $ doi                  <chr> "https://doi.org/10.1121/1.413664", "https://doi.…
#> $ pmid                 <chr> "https://pubmed.ncbi.nlm.nih.gov/7608410", "https…
#> $ mag                  <int> 2062207950, 2062207950
#> $ host_venue_info      <list> [<tbl_df[3 x 7]>], [<tbl_df[3 x 7]>]
#> $ works_type           <chr> "journal-article", "journal-article"
#> $ open_access          <lgl> FALSE, FALSE
#> $ open_access_status   <chr> "closed", "closed"
#> $ authors              <tibble[,3]> <tbl_df[2 x 3]>
#> $ citation_count       <int> 97, 97
#> $ concepts             <list> [<data.frame[7 x 5]>], [<data.frame[7 x 5]>]
#> $ referenced_works     <list> [], []
#> $ related_works        <list> <"https://openalex.org/W2109138290", "https://ope…
#> $ citation_counts_year <list> [<data.frame[10 x 2]>], [<data.frame[10 x 2]>]
```

From the paper info, you can also find all papers by an author:

``` r
mom_oa_id <- paper_info$authors$author_id[1]

all_papers <- get_authors_papers(id_type = "openalex",
                                 id = mom_oa_id)


glimpse(all_papers)
#> Rows: 10
#> Columns: 21
#> $ id                      <chr> "https://openalex.org/W2050783745", "https://o…
#> $ display_name            <chr> "Analysis of the glottal excitation of intoxic…
#> $ publication_date        <chr> "1996-04-01", "1995-07-01", "1995-05-09", "199…
#> $ relevance_score         <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA
#> $ host_venue              <df[,10]> <data.frame[10 x 10]>
#> $ authorships             <list> [<data.frame[3 x 4]>], [<data.frame[2 x 4]>], …
#> $ concepts                <list> [<data.frame[8 x 5]>], [<data.frame[7 x 5]…
#> $ alternate_host_venues   <list> [], [], [], [], [], [], [], [], [], []
#> $ open_access             <df[,3]> <data.frame[10 x 3]>
#> $ cited_by_count          <int> 0, 97, 3, 0, 2, 16, 13, 0, 33, 7
#> $ ids                     <df[,4]> <data.frame[10 x 4]>
#> $ publication_year        <int> 1996, 1995, 1995, 1994, 1994, 1993, 1992, 199…
#> $ cited_by_api_url        <chr> "https://api.openalex.org/works?filter=cites:…
#> $ doi                     <chr> "https://doi.org/10.1121/1.415167", "https://…
#> $ type                    <chr> "journal-article", "journal-article", "proc…
#> $ is_paratext             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALS…
#> $ is_retracted            <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, F…
#> $ referenced_works        <list> <>, <>, <"https://openalex.org/W2051535326", "…
#> $ related_works           <list> <"https://openalex.org/W1994886694", "https://…
#> $ biblio                  <df[,4]> <data.frame[10 x 4]>
#> $ abstract_inverted_index <df[,538]> <data.frame[10 x 538]>
```
