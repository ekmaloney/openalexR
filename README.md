
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

#find a paper in the openalex database: 

#Example: "Analysis of the glottal excitation of emotionally styled and stressed speech,"
#one of my mother's publications when she was an electrical engineer at Georgia Tech
#I will use the doi to retrieve it: 

paper_info <- find_paper(id_type = "doi", 
                         id = "https://doi.org/10.1121/1.413664")

str(paper_info)
#> List of 24
#>  $ id                     : chr "https://openalex.org/W2062207950"
#>  $ doi                    : chr "https://doi.org/10.1121/1.413664"
#>  $ display_name           : chr "Analysis of the glottal excitation of emotionally styled and stressed speech."
#>  $ title                  : chr "Analysis of the glottal excitation of emotionally styled and stressed speech."
#>  $ publication_year       : int 1995
#>  $ publication_date       : chr "1995-07-01"
#>  $ ids                    :List of 4
#>   ..$ openalex: chr "https://openalex.org/W2062207950"
#>   ..$ doi     : chr "https://doi.org/10.1121/1.413664"
#>   ..$ pmid    : chr "https://pubmed.ncbi.nlm.nih.gov/7608410"
#>   ..$ mag     : int 2062207950
#>  $ host_venue             :List of 10
#>   ..$ id          : chr "https://openalex.org/V11296630"
#>   ..$ issn_l      : chr "0001-4966"
#>   ..$ issn        : chr [1:3] "1520-8524" "0001-4966" "1520-9024"
#>   ..$ display_name: chr "Journal of the Acoustical Society of America"
#>   ..$ publisher   : chr "Acoustical Society of America"
#>   ..$ type        : chr "publisher"
#>   ..$ url         : chr "https://doi.org/10.1121/1.413664"
#>   ..$ is_oa       : logi FALSE
#>   ..$ version     : NULL
#>   ..$ license     : NULL
#>  $ type                   : chr "journal-article"
#>  $ open_access            :List of 3
#>   ..$ is_oa    : logi FALSE
#>   ..$ oa_status: chr "closed"
#>   ..$ oa_url   : NULL
#>  $ authorships            :'data.frame': 2 obs. of  4 variables:
#>   ..$ author_position       : chr [1:2] "first" "last"
#>   ..$ author                :'data.frame':   2 obs. of  3 variables:
#>   .. ..$ id          : chr [1:2] "https://openalex.org/A2109682146" "https://openalex.org/A2155267845"
#>   .. ..$ display_name: chr [1:2] "K.E. Cummings" "Mark A. Clements"
#>   .. ..$ orcid       : logi [1:2] NA NA
#>   ..$ institutions          :List of 2
#>   .. ..$ :'data.frame':  1 obs. of  5 variables:
#>   .. .. ..$ id          : chr "https://openalex.org/I130701444"
#>   .. .. ..$ display_name: chr "Georgia Institute of Technology"
#>   .. .. ..$ ror         : chr "https://ror.org/01zkghx44"
#>   .. .. ..$ country_code: chr "US"
#>   .. .. ..$ type        : chr "education"
#>   .. ..$ :'data.frame':  0 obs. of  0 variables
#>   ..$ raw_affiliation_string: chr [1:2] "School of Electrical and Computer Engineering, Georgia Institute of Technology, Atlanta, 30332-0250, USA" NA
#>  $ cited_by_count         : int 97
#>  $ biblio                 :List of 4
#>   ..$ volume    : chr "98"
#>   ..$ issue     : chr "1"
#>   ..$ first_page: chr "88"
#>   ..$ last_page : chr "98"
#>  $ is_retracted           : logi FALSE
#>  $ is_paratext            : logi FALSE
#>  $ concepts               :'data.frame': 7 obs. of  5 variables:
#>   ..$ id          : chr [1:7] "https://openalex.org/C24890656" "https://openalex.org/C15744967" "https://openalex.org/C43617652" "https://openalex.org/C548259974" ...
#>   ..$ wikidata    : chr [1:7] "https://www.wikidata.org/wiki/Q82811" "https://www.wikidata.org/wiki/Q9418" "https://www.wikidata.org/wiki/Q7575399" "https://www.wikidata.org/wiki/Q569965" ...
#>   ..$ display_name: chr [1:7] "Acoustics" "Psychology" "Speech production" "Audiology" ...
#>   ..$ level       : int [1:7] 1 0 2 1 2 3 3
#>   ..$ score       : num [1:7] 0.614 0.38 0.371 0.356 0.347 ...
#>  $ mesh                   :'data.frame': 10 obs. of  5 variables:
#>   ..$ is_major_topic : logi [1:10] TRUE TRUE TRUE TRUE TRUE FALSE ...
#>   ..$ descriptor_ui  : chr [1:10] "D004644" "D005931" "D011595" "D013060" ...
#>   ..$ descriptor_name: chr [1:10] "Emotions" "Glottis" "Psychomotor Agitation" "Speech" ...
#>   ..$ qualifier_ui   : chr [1:10] "Q000502" "Q000502" NA "Q000502" ...
#>   ..$ qualifier_name : chr [1:10] "physiology" "physiology" NA "physiology" ...
#>  $ alternate_host_venues  : list()
#>  $ referenced_works       : list()
#>  $ related_works          : chr [1:20] "https://openalex.org/W2109138290" "https://openalex.org/W2132290247" "https://openalex.org/W2137639365" "https://openalex.org/W1964469912" ...
#>  $ abstract_inverted_index:List of 93
#>   ..$ The             : int [1:4] 0 60 91 131
#>   ..$ problems        : int 1
#>   ..$ of              : int [1:12] 2 5 8 15 26 35 47 55 83 97 ...
#>   ..$ automatic       : int 3
#>   ..$ recognition     : int 4
#>   ..$ and             : int [1:6] 6 68 89 105 125 150
#>   ..$ synthesis       : int 7
#>   ..$ multistyle      : int 9
#>   ..$ speech          : int [1:6] 10 39 84 98 122 128
#>   ..$ have            : int [1:2] 11 99
#>   ..$ become          : int 12
#>   ..$ important       : int 13
#>   ..$ topics          : int 14
#>   ..$ research        : int 16
#>   ..$ in              : int [1:5] 17 31 120 126 135
#>   ..$ recent          : int 18
#>   ..$ years.          : int 19
#>   ..$ This            : int 20
#>   ..$ paper           : int 21
#>   ..$ reports         : int 22
#>   ..$ an              : int 23
#>   ..$ extensive       : int 24
#>   ..$ investigation   : int 25
#>   ..$ the             : int [1:7] 27 32 56 76 80 114 117
#>   ..$ variations      : int 28
#>   ..$ that            : int 29
#>   ..$ occur           : int 30
#>   ..$ glottal         : int [1:5] 33 77 92 118 137
#>   ..$ excitation      : int 34
#>   ..$ eleven          : int [1:3] 36 57 81
#>   ..$ commonly        : int 37
#>   ..$ encountered     : int 38
#>   ..$ styles.         : int [1:2] 40 59
#>   ..$ Glottal         : int 41
#>   ..$ waveforms       : int [1:5] 42 62 78 93 138
#>   ..$ were            : int [1:3] 43 63 85
#>   ..$ extracted       : int [1:2] 44 61
#>   ..$ from            : int [1:4] 45 79 94 108
#>   ..$ utterances      : int 46
#>   ..$ non‐nasalized   : int 48
#>   ..$ vowels          : int 49
#>   ..$ for             : int [1:2] 50 53
#>   ..$ two             : int [1:2] 51 69
#>   ..$ speakers        : int 52
#>   ..$ each            : int [1:2] 54 95
#>   ..$ speaking        : int 58
#>   ..$ parametrized    : int 64
#>   ..$ into            : int 65
#>   ..$ four            : int 66
#>   ..$ duration‐related: int 67
#>   ..$ slope‐related   : int 70
#>   ..$ values.         : int 71
#>   ..$ Using           : int 72
#>   ..$ these           : int 73
#>   ..$ six             : int 74
#>   ..$ parameters,     : int 75
#>   ..$ styles          : int 82
#>   ..$ analyzed        : int 86
#>   ..$ both            : int 87
#>   ..$ qualitatively   : int 88
#>   ..$ quantitatively. : int 90
#>   ..$ style           : int [1:2] 96 123
#>   ..$ been            : int [1:2] 100 140
#>   ..$ shown           : int [1:2] 101 141
#>   ..$ to              : int [1:2] 102 142
#>   ..$ be              : int [1:2] 103 143
#>   ..$ significantly   : int 104
#>   ..$ identifiably    : int 106
#>   ..$ different       : int 107
#>   ..$ all             : int 109
#>   ..$ other           : int 110
#>   ..$ styles,         : int 111
#>   ..$ thereby         : int 112
#>   ..$ confirming      : int 113
#>   ..$ importance      : int 115
#>   ..$ waveform        : int [1:2] 119 129
#>   ..$ conveying       : int 121
#>   ..$ information     : int 124
#>   ..$ causing         : int 127
#>   ..$ variations.     : int 130
#>   ..$ degree          : int 132
#>   ..$ variation       : int 134
#>   ..$ styled          : int 136
#>   ..$ has             : int 139
#>   ..$ consistent      : int 144
#>   ..$ when            : int 145
#>   ..$ trained         : int 146
#>   ..$ on              : int 147
#>   ..$ one             : int 148
#>   ..$ speaker         : int 149
#>   ..$ compared        : int 151
#>   ..$ with            : int 152
#>   ..$ another.        : int 153
#>  $ counts_by_year         :'data.frame': 10 obs. of  2 variables:
#>   ..$ year          : int [1:10] 2021 2020 2019 2018 2017 2016 2015 2014 2013 2012
#>   ..$ cited_by_count: int [1:10] 1 3 6 2 2 2 6 7 8 4
#>  $ cited_by_api_url       : chr "https://api.openalex.org/works?filter=cites:W2062207950"
#>  $ updated_date           : chr "2021-12-23T00:40:26.238174"
```

From the paper info, you can also find all papers by an author:

``` r
mom_oa_id <- paper_info$authorships$author$id[1]

all_papers <- get_authors_papers(id_type = "openalex",
                                 id = mom_oa_id)


head(all_papers)
#>                                 id
#> 1 https://openalex.org/W2050783745
#> 2 https://openalex.org/W2062207950
#> 3 https://openalex.org/W1590551706
#> 4 https://openalex.org/W2058733683
#> 5 https://openalex.org/W2030850814
#> 6 https://openalex.org/W2098831047
#>                                                                                          display_name
#> 1              Analysis of the glottal excitation of intoxicated versus sober speech: A first report.
#> 2                       Analysis of the glottal excitation of emotionally styled and stressed speech.
#> 3                                    Modelling speech production using Yee's finite difference method
#> 4                                       Modeling speech production using finite difference techniques
#> 5                                          Synthesizing multistyle speech using the Klatt synthesizer
#> 6 Application of the analysis of glottal excitation of stressed speech to speaking style modification
#>   publication_date relevance_score                  host_venue.id
#> 1       1996-04-01              NA https://openalex.org/V11296630
#> 2       1995-07-01              NA https://openalex.org/V11296630
#> 3       1995-05-09              NA                           <NA>
#> 4       1994-05-01              NA https://openalex.org/V11296630
#> 5       1994-05-01              NA https://openalex.org/V11296630
#> 6       1993-04-27              NA                           <NA>
#>                                                host_venue.display_name
#> 1                         Journal of the Acoustical Society of America
#> 2                         Journal of the Acoustical Society of America
#> 3 international conference on acoustics, speech, and signal processing
#> 4                         Journal of the Acoustical Society of America
#> 5                         Journal of the Acoustical Society of America
#> 6 international conference on acoustics, speech, and signal processing
#>            host_venue.publisher                 host_venue.issn
#> 1 Acoustical Society of America 1520-8524, 0001-4966, 1520-9024
#> 2 Acoustical Society of America 1520-8524, 0001-4966, 1520-9024
#> 3                          IEEE                            NULL
#> 4 Acoustical Society of America 1520-8524, 0001-4966, 1520-9024
#> 5 Acoustical Society of America 1520-8524, 0001-4966, 1520-9024
#> 6                          IEEE                            NULL
#>   host_venue.issn_l host_venue.type                             host_venue.url
#> 1         0001-4966       publisher           https://doi.org/10.1121/1.415167
#> 2         0001-4966       publisher           https://doi.org/10.1121/1.413664
#> 3              <NA>       publisher https://doi.org/10.1109/icassp.1995.479687
#> 4         0001-4966       publisher           https://doi.org/10.1121/1.409209
#> 5         0001-4966       publisher           https://doi.org/10.1121/1.408950
#> 6              <NA>       publisher https://doi.org/10.1109/icassp.1993.319270
#>   host_venue.is_oa host_venue.version host_venue.license
#> 1            FALSE                 NA                 NA
#> 2            FALSE                 NA                 NA
#> 3            FALSE                 NA                 NA
#> 4            FALSE                 NA                 NA
#> 5            FALSE                 NA                 NA
#> 6            FALSE                 NA                 NA
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                        authorships
#> 1                                                                                                                                                                                                                                                                                 https://openalex.org/A2109682146, https://openalex.org/A2551298750, https://openalex.org/A276177325, K.E. Cummings, Steven B. Chin, David B. Pisoni, NA, NA, NA, first, middle, last, NA, NA, NA
#> 2                                                                                                                               https://openalex.org/A2109682146, https://openalex.org/A2155267845, K.E. Cummings, Mark A. Clements, NA, NA, https://openalex.org/I130701444, Georgia Institute of Technology, https://ror.org/01zkghx44, US, education, first, last, School of Electrical and Computer Engineering, Georgia Institute of Technology, Atlanta, 30332-0250, USA, NA
#> 3                                                                                           https://openalex.org/A2109682146, https://openalex.org/A3187785956, https://openalex.org/A2155267845, K.E. Cummings, J.G. Maloney, Mark A. Clements, NA, NA, NA, https://openalex.org/I130701444, Georgia Institute of Technology, https://ror.org/01zkghx44, US, education, first, middle, last, Sch. of Electr. & Computer Eng., Georgia Inst. of Technol., Atlanta, GA, USA, NA, NA
#> 4                                                                                                                                                                                                                                                                                                                                                 https://openalex.org/A2109682146, https://openalex.org/A2155267845, K.E. Cummings, Mark A. Clements, NA, NA, first, last, NA, NA
#> 5                                                                                                                                                                                                          https://openalex.org/A2033724151, https://openalex.org/A2109682146, https://openalex.org/A2468631398, https://openalex.org/A2155267845, Daniel Lambert, K.E. Cummings, Janet C. Rutledge, Mark A. Clements, NA, NA, NA, NA, first, middle, middle, last, NA, NA, NA, NA
#> 6 https://openalex.org/A2109682146, https://openalex.org/A2155267845, K.E. Cummings, Mark A. Clements, NA, NA, https://openalex.org/I130701444, Georgia Institute of Technology, https://ror.org/01zkghx44, US, education, https://openalex.org/I130701444, Georgia Institute of Technology, https://ror.org/01zkghx44, US, education, first, last, Sch. of Electr. Eng., Georgia Inst. of Tech., Atlanta, GA, USA, Sch. of Electr. Eng., Georgia Inst. of Tech., Atlanta, GA, USA
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            concepts
#> 1 https://openalex.org/C24890656, https://openalex.org/C28490314, https://openalex.org/C43617652, https://openalex.org/C47401133, https://openalex.org/C15744967, https://openalex.org/C173988693, https://openalex.org/C41008148, https://openalex.org/C2780336059, Acoustics, Speech recognition, Speech production, Vocal tract, Psychology, Phonation, Computer science, Vocal folds, 0.556448, 0.36068, 0.355867, 0.35119, 0.332051, 0.324015, 0.323845, 0.322795, 1, 1, 2, 2, 0, 2, 0, 3, https://www.wikidata.org/wiki/Q82811, https://www.wikidata.org/wiki/Q189436, https://www.wikidata.org/wiki/Q7575399, https://www.wikidata.org/wiki/Q748953, https://www.wikidata.org/wiki/Q9418, https://www.wikidata.org/wiki/Q678132, https://www.wikidata.org/wiki/Q21198, https://www.wikidata.org/wiki/Q215558
#> 2                                                                                                              https://openalex.org/C24890656, https://openalex.org/C15744967, https://openalex.org/C43617652, https://openalex.org/C548259974, https://openalex.org/C173988693, https://openalex.org/C2780336059, https://openalex.org/C158215666, Acoustics, Psychology, Speech production, Audiology, Phonation, Vocal folds, Formant, 0.613581, 0.380382, 0.371205, 0.356322, 0.346941, 0.327369, 0.323697, 1, 0, 2, 1, 2, 3, 3, https://www.wikidata.org/wiki/Q82811, https://www.wikidata.org/wiki/Q9418, https://www.wikidata.org/wiki/Q7575399, https://www.wikidata.org/wiki/Q569965, https://www.wikidata.org/wiki/Q678132, https://www.wikidata.org/wiki/Q215558, https://www.wikidata.org/wiki/Q1414685
#> 3                                                                                                                                                                     https://openalex.org/C41008148, https://openalex.org/C205951836, https://openalex.org/C33923547, https://openalex.org/C181330731, https://openalex.org/C135628077, https://openalex.org/C28826006, Computer science, Finite difference method, Mathematics, Finite difference, Finite element method, Applied mathematics, 0.511396, 0.440172, 0.414074, 0.40849, 0.392604, 0.389048, 0, 2, 0, 2, 2, 1, https://www.wikidata.org/wiki/Q21198, https://www.wikidata.org/wiki/Q1147751, https://www.wikidata.org/wiki/Q395, https://www.wikidata.org/wiki/Q2068418, https://www.wikidata.org/wiki/Q220184, https://www.wikidata.org/wiki/Q33521
#> 4                                                                                                                                                                                https://openalex.org/C41008148, https://openalex.org/C43617652, https://openalex.org/C28490314, https://openalex.org/C24890656, https://openalex.org/C158215666, https://openalex.org/C60048801, Computer science, Speech production, Speech recognition, Acoustics, Formant, Intelligibility (philosophy), 0.620054, 0.451224, 0.446691, 0.44127, 0.354566, 0.351002, 0, 2, 1, 1, 3, 2, https://www.wikidata.org/wiki/Q21198, https://www.wikidata.org/wiki/Q7575399, https://www.wikidata.org/wiki/Q189436, https://www.wikidata.org/wiki/Q82811, https://www.wikidata.org/wiki/Q1414685, https://www.wikidata.org/wiki/Q1433889
#> 5                                                                                                                                                                                   https://openalex.org/C41008148, https://openalex.org/C14999030, https://openalex.org/C24890656, https://openalex.org/C158215666, https://openalex.org/C28490314, https://openalex.org/C60048801, Computer science, Speech synthesis, Acoustics, Formant, Speech recognition, Intelligibility (philosophy), 0.645643, 0.521459, 0.426788, 0.426319, 0.421204, 0.35107, 0, 2, 1, 3, 1, 2, https://www.wikidata.org/wiki/Q21198, https://www.wikidata.org/wiki/Q16346, https://www.wikidata.org/wiki/Q82811, https://www.wikidata.org/wiki/Q1414685, https://www.wikidata.org/wiki/Q189436, https://www.wikidata.org/wiki/Q1433889
#> 6                                                                                                                                                                                                                                                                                                                                                                                                 https://openalex.org/C28490314, https://openalex.org/C41008148, https://openalex.org/C24890656, https://openalex.org/C43617652, Speech recognition, Computer science, Acoustics, Speech production, 0.509508, 0.459376, 0.427878, 0.374031, 1, 0, 1, 2, https://www.wikidata.org/wiki/Q189436, https://www.wikidata.org/wiki/Q21198, https://www.wikidata.org/wiki/Q82811, https://www.wikidata.org/wiki/Q7575399
#>   alternate_host_venues open_access.is_oa open_access.oa_status
#> 1                  NULL             FALSE                closed
#> 2                  NULL             FALSE                closed
#> 3                  NULL             FALSE                closed
#> 4                  NULL             FALSE                closed
#> 5                  NULL             FALSE                closed
#> 6                  NULL             FALSE                closed
#>   open_access.oa_url cited_by_count                                    ids.doi
#> 1                 NA              0           https://doi.org/10.1121/1.415167
#> 2                 NA             97           https://doi.org/10.1121/1.413664
#> 3                 NA              3 https://doi.org/10.1109/icassp.1995.479687
#> 4                 NA              0           https://doi.org/10.1121/1.409209
#> 5                 NA              2           https://doi.org/10.1121/1.408950
#> 6                 NA             16 https://doi.org/10.1109/icassp.1993.319270
#>      ids.mag                     ids.openalex
#> 1 2050783745 https://openalex.org/W2050783745
#> 2 2062207950 https://openalex.org/W2062207950
#> 3 1590551706 https://openalex.org/W1590551706
#> 4 2058733683 https://openalex.org/W2058733683
#> 5 2030850814 https://openalex.org/W2030850814
#> 6 2098831047 https://openalex.org/W2098831047
#>                                  ids.pmid publication_year
#> 1                                    <NA>             1996
#> 2 https://pubmed.ncbi.nlm.nih.gov/7608410             1995
#> 3                                    <NA>             1995
#> 4                                    <NA>             1994
#> 5                                    <NA>             1994
#> 6                                    <NA>             1993
#>                                          cited_by_api_url
#> 1 https://api.openalex.org/works?filter=cites:W2050783745
#> 2 https://api.openalex.org/works?filter=cites:W2062207950
#> 3 https://api.openalex.org/works?filter=cites:W1590551706
#> 4 https://api.openalex.org/works?filter=cites:W2058733683
#> 5 https://api.openalex.org/works?filter=cites:W2030850814
#> 6 https://api.openalex.org/works?filter=cites:W2098831047
#>                                          doi                type is_paratext
#> 1           https://doi.org/10.1121/1.415167     journal-article       FALSE
#> 2           https://doi.org/10.1121/1.413664     journal-article       FALSE
#> 3 https://doi.org/10.1109/icassp.1995.479687 proceedings-article       FALSE
#> 4           https://doi.org/10.1121/1.409209     journal-article       FALSE
#> 5           https://doi.org/10.1121/1.408950     journal-article       FALSE
#> 6 https://doi.org/10.1109/icassp.1993.319270 proceedings-article       FALSE
#>   is_retracted
#> 1        FALSE
#> 2        FALSE
#> 3        FALSE
#> 4        FALSE
#> 5        FALSE
#> 6        FALSE
#>                                                                                                                                                                                                                                                                                                                                     referenced_works
#> 1                                                                                                                                                                                                                                                                                                                                                   
#> 2                                                                                                                                                                                                                                                                                                                                                   
#> 3 https://openalex.org/W2051535326, https://openalex.org/W2142063750, https://openalex.org/W2148560576, https://openalex.org/W2065925624, https://openalex.org/W2098831047, https://openalex.org/W2007723911, https://openalex.org/W2130677581, https://openalex.org/W2126931998, https://openalex.org/W2484318754, https://openalex.org/W2142023355
#> 4                                                                                                                                                                                                                                                                                                                                                   
#> 5                                                                                                                                                                                                                                                                                                                                                   
#> 6                                                                      https://openalex.org/W181056519, https://openalex.org/W2051535326, https://openalex.org/W2484318754, https://openalex.org/W2022554507, https://openalex.org/W1623080549, https://openalex.org/W2147562090, https://openalex.org/W2038875793, https://openalex.org/W2130677581
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            related_works
#> 1     https://openalex.org/W1994886694, https://openalex.org/W2022507570, https://openalex.org/W2138311467, https://openalex.org/W70052435, https://openalex.org/W1986901063, https://openalex.org/W2079811011, https://openalex.org/W341316883, https://openalex.org/W2780125920, https://openalex.org/W2153612201, https://openalex.org/W2079057923, https://openalex.org/W127137150, https://openalex.org/W2065925624, https://openalex.org/W2085464700, https://openalex.org/W1993339965, https://openalex.org/W1973490648, https://openalex.org/W2086651919, https://openalex.org/W2026547904, https://openalex.org/W2104553907, https://openalex.org/W2043124154, https://openalex.org/W1999749725
#> 2  https://openalex.org/W2109138290, https://openalex.org/W2132290247, https://openalex.org/W2137639365, https://openalex.org/W1964469912, https://openalex.org/W2032254851, https://openalex.org/W2118789253, https://openalex.org/W2021320575, https://openalex.org/W2054941444, https://openalex.org/W2103011877, https://openalex.org/W1535122738, https://openalex.org/W1575712594, https://openalex.org/W2113396990, https://openalex.org/W1994295036, https://openalex.org/W1973378890, https://openalex.org/W1560013842, https://openalex.org/W2003547693, https://openalex.org/W2123861288, https://openalex.org/W175750906, https://openalex.org/W1976725440, https://openalex.org/W2051457717
#> 3 https://openalex.org/W2136745999, https://openalex.org/W2529721738, https://openalex.org/W2015760010, https://openalex.org/W1595041183, https://openalex.org/W2029096514, https://openalex.org/W2112328598, https://openalex.org/W2086013542, https://openalex.org/W3150825132, https://openalex.org/W2024909341, https://openalex.org/W2000486936, https://openalex.org/W2163805564, https://openalex.org/W2027962052, https://openalex.org/W2106580022, https://openalex.org/W1868598582, https://openalex.org/W1994640735, https://openalex.org/W2152482722, https://openalex.org/W2120735291, https://openalex.org/W2154499670, https://openalex.org/W1535855622, https://openalex.org/W2055081058
#> 4 https://openalex.org/W2789232962, https://openalex.org/W2345781070, https://openalex.org/W2049328091, https://openalex.org/W2989944837, https://openalex.org/W3100174995, https://openalex.org/W2131332703, https://openalex.org/W2404836908, https://openalex.org/W2094636564, https://openalex.org/W2150243332, https://openalex.org/W2768338075, https://openalex.org/W2541167357, https://openalex.org/W1513415696, https://openalex.org/W2520934613, https://openalex.org/W1973162890, https://openalex.org/W1538350890, https://openalex.org/W2079627269, https://openalex.org/W2540651536, https://openalex.org/W2024290394, https://openalex.org/W2742977893, https://openalex.org/W1509765217
#> 5    https://openalex.org/W328263290, https://openalex.org/W3032966423, https://openalex.org/W1549274509, https://openalex.org/W2050631214, https://openalex.org/W2151444118, https://openalex.org/W280018729, https://openalex.org/W1523526183, https://openalex.org/W1951338938, https://openalex.org/W2022718166, https://openalex.org/W174761674, https://openalex.org/W2125453152, https://openalex.org/W2007232380, https://openalex.org/W2395091023, https://openalex.org/W2433276473, https://openalex.org/W1875478928, https://openalex.org/W2562142358, https://openalex.org/W2076856276, https://openalex.org/W1966856647, https://openalex.org/W2158758373, https://openalex.org/W2991417167
#> 6 https://openalex.org/W2811386568, https://openalex.org/W3015689673, https://openalex.org/W2803550782, https://openalex.org/W2090305066, https://openalex.org/W2018913061, https://openalex.org/W1515194102, https://openalex.org/W3161611084, https://openalex.org/W2116470432, https://openalex.org/W2137639365, https://openalex.org/W2077328047, https://openalex.org/W2131408606, https://openalex.org/W2132290247, https://openalex.org/W2062207950, https://openalex.org/W2103011877, https://openalex.org/W2023157423, https://openalex.org/W2297346279, https://openalex.org/W3184757502, https://openalex.org/W2030670342, https://openalex.org/W2902221167, https://openalex.org/W2051535326
#>   biblio.issue biblio.first_page biblio.volume biblio.last_page
#> 1            4              2549            99             2574
#> 2            1                88            98               98
#> 3         <NA>               672             1              675
#> 4            5              2923            95             2923
#> 5            5              2979            95             2979
#> 6         <NA>               207             2              210
#>   abstract_inverted_index.The abstract_inverted_index.objective
#> 1                           0                                 1
#> 2              0, 60, 91, 131                              NULL
#> 3                 52, 83, 105                              NULL
#> 4                 59, 88, 113                                89
#> 5                     74, 147                              NULL
#> 6                        NULL                              NULL
#>                             abstract_inverted_index.of
#> 1                           2, 12, 16, 27, 41, 92, 146
#> 2        2, 5, 8, 15, 26, 35, 47, 55, 83, 97, 116, 133
#> 3             5, 55, 58, 63, 74, 79, 85, 108, 117, 128
#> 4                  1, 24, 30, 43, 52, 81, 94, 107, 110
#> 5 8, 59, 77, 86, 95, 102, 109, 124, 126, 137, 151, 163
#> 6                                     2, 9, 11, 66, 79
#>                                  abstract_inverted_index.the
#> 1                   3, 13, 25, 31, 35, 39, 47, 100, 105, 147
#> 2                               27, 32, 56, 76, 80, 114, 117
#> 3                                    16, 64, 86, 92, 96, 126
#> 4           22, 28, 31, 56, 82, 100, 128, 137, 142, 145, 151
#> 5 30, 34, 60, 78, 84, 107, 121, 127, 138, 144, 159, 164, 175
#> 6                                          6, 35, 64, 67, 77
#>   abstract_inverted_index.research abstract_inverted_index.reported
#> 1                                4                                5
#> 2                               16                             NULL
#> 3                             NULL                             NULL
#> 4                          35, 119                             NULL
#> 5                                9                             NULL
#> 6                                4                             NULL
#>   abstract_inverted_index.here abstract_inverted_index.was
#> 1                            6                           7
#> 2                         NULL                        NULL
#> 3                         NULL                          28
#> 4                         NULL                        NULL
#> 5                         NULL                         141
#> 6                         NULL                        NULL
#>   abstract_inverted_index.to abstract_inverted_index.perform
#> 1                      8, 23                               9
#> 2                   102, 142                            NULL
#> 3                         95                            NULL
#> 4      68, 98, 102, 126, 144                            NULL
#> 5                         63                            NULL
#> 6  27, 76, 98, 102, 109, 125                            NULL
#>   abstract_inverted_index.an abstract_inverted_index.analysis
#> 1                         10                               11
#> 2                         23                             NULL
#> 3                       NULL                             NULL
#> 4                       NULL                            7, 64
#> 5                          5                             NULL
#> 6                         31                               10
#>   abstract_inverted_index.voicing abstract_inverted_index.characteristics
#> 1                              14                                      15
#> 2                            NULL                                    NULL
#> 3                            NULL                                    NULL
#> 4                            NULL                                    NULL
#> 5                            NULL                                    NULL
#> 6                            NULL                                    NULL
#>   abstract_inverted_index.sober abstract_inverted_index.and
#> 1                   17, 74, 110     18, 43, 75, 90, 94, 111
#> 2                          NULL    6, 68, 89, 105, 125, 150
#> 3                          NULL         34, 42, 50, 77, 119
#> 4                          NULL        6, 27, 104, 131, 141
#> 5                          NULL    29, 56, 66, 93, 132, 181
#> 6                          NULL         14, 51, 73, 91, 106
#>   abstract_inverted_index.intoxicated abstract_inverted_index.speech
#> 1                         19, 76, 112               20, 32, 101, 113
#> 2                                NULL       10, 39, 84, 98, 122, 128
#> 3                                NULL                     6, 59, 109
#> 4                                NULL            9, 44, 95, 108, 152
#> 5                                NULL                      2, 19, 41
#> 6                                NULL          13, 80, 101, 108, 121
#>   abstract_inverted_index.in abstract_inverted_index.order
#> 1  21, 68, 72, 115, 119, 131                            22
#> 2      17, 31, 120, 126, 135                          NULL
#> 3            15, 39, 47, 114                          NULL
#> 4         3, 55, 73, 90, 121                          NULL
#> 5               10, 113, 143                          NULL
#> 6                     70, 74                          NULL
#>   abstract_inverted_index.assess abstract_inverted_index.possibility
#> 1                             24                                  26
#> 2                           NULL                                NULL
#> 3                           NULL                                NULL
#> 4                           NULL                                NULL
#> 5                           NULL                                NULL
#> 6                           NULL                                NULL
#>   abstract_inverted_index.detecting abstract_inverted_index.intoxication
#> 1                                28                                   29
#> 2                              NULL                                 NULL
#> 3                              NULL                                 NULL
#> 4                              NULL                                 NULL
#> 5                              NULL                                 NULL
#> 6                              NULL                                 NULL
#>   abstract_inverted_index.from abstract_inverted_index.signal.
#> 1              30, 65, 99, 144                              33
#> 2              45, 79, 94, 108                            NULL
#> 3                         NULL                            NULL
#> 4                         NULL                            NULL
#> 5                         NULL                            NULL
#> 6                         NULL                            NULL
#>   abstract_inverted_index.Because abstract_inverted_index.glottal
#> 1                              34                         36, 140
#> 2                            NULL            33, 77, 92, 118, 137
#> 3                            NULL                             131
#> 4                               0                            NULL
#> 5                            NULL           31, 79, 110, 122, 160
#> 6                            NULL                      15, 33, 68
#>   abstract_inverted_index.excitation abstract_inverted_index.is
#> 1                             37, 61                         38
#> 2                                 34                       NULL
#> 3                               NULL                         88
#> 4                                143       47, 78, 97, 115, 124
#> 5              32, 80, 111, 123, 161                        130
#> 6                                 69                         25
#>   abstract_inverted_index.result abstract_inverted_index.complicated
#> 1                             40                                  42
#> 2                           NULL                                NULL
#> 3                           NULL                                NULL
#> 4                           NULL                                  75
#> 5                           NULL                                NULL
#> 6                           NULL                                NULL
#>   abstract_inverted_index.intricate abstract_inverted_index.motions
#> 1                                44                              45
#> 2                              NULL                            NULL
#> 3                              NULL                            NULL
#> 4                              NULL                            NULL
#> 5                              NULL                            NULL
#> 6                              NULL                            NULL
#>   abstract_inverted_index.by abstract_inverted_index.vocal
#> 1                 46, 55, 78                            48
#> 2                       NULL                          NULL
#> 3                     31, 90                            17
#> 4                       NULL          32, 57, 83, 138, 146
#> 5                    24, 156                          NULL
#> 6                       NULL                          NULL
#>   abstract_inverted_index.folds, abstract_inverted_index.it
#> 1                             49                         50
#> 2                           NULL                       NULL
#> 3                           NULL                       NULL
#> 4                           NULL                        123
#> 5                           NULL                       NULL
#> 6                           NULL                       NULL
#>   abstract_inverted_index.should abstract_inverted_index.be
#> 1                             51                         52
#> 2                           NULL                   103, 143
#> 3                           NULL                       NULL
#> 4                           NULL                       NULL
#> 5                           NULL                         64
#> 6                           NULL                38, 54, 123
#>   abstract_inverted_index.significantly abstract_inverted_index.affected
#> 1                                    53                               54
#> 2                                   104                             NULL
#> 3                                  NULL                             NULL
#> 4                                  NULL                             NULL
#> 5                                   131                             NULL
#> 6                                   127                             NULL
#>   abstract_inverted_index.alcohol abstract_inverted_index.use.
#> 1                              56                           57
#> 2                            NULL                         NULL
#> 3                            NULL                         NULL
#> 4                            NULL                         NULL
#> 5                            NULL                         NULL
#> 6                            NULL                         NULL
#>   abstract_inverted_index.In abstract_inverted_index.this
#> 1                         58                           59
#> 2                       NULL                         NULL
#> 3                       NULL                           56
#> 4                       NULL                           92
#> 5                         13                      14, 152
#> 6                        112                         NULL
#>   abstract_inverted_index.study, abstract_inverted_index.parameters
#> 1                             60                       62, 116, 134
#> 2                           NULL                               NULL
#> 3                           NULL                               NULL
#> 4                           NULL                               NULL
#> 5                           NULL                                162
#> 6                           NULL                               NULL
#>   abstract_inverted_index.were abstract_inverted_index.extracted
#> 1        63, 96, 114, 127, 142                       64, 97, 143
#> 2                   43, 63, 85                            44, 61
#> 3                         NULL                              NULL
#> 4                         NULL                              NULL
#> 5                     154, 179                              NULL
#> 6                         NULL                              NULL
#>   abstract_inverted_index.non‐nasalized abstract_inverted_index.vowels
#> 1                                    66                             67
#> 2                                    48                             49
#> 3                                  NULL                           NULL
#> 4                                  NULL                           NULL
#> 5                                  NULL                           NULL
#> 6                                  NULL                           NULL
#>   abstract_inverted_index.eight abstract_inverted_index.utterances
#> 1                            69                                 70
#> 2                          NULL                                 46
#> 3                          NULL                               NULL
#> 4                          NULL                               NULL
#> 5                          NULL                               NULL
#> 6                          NULL                               NULL
#>   abstract_inverted_index.spoken abstract_inverted_index.both
#> 1                             71                           73
#> 2                           NULL                           87
#> 3                           NULL                           48
#> 4                           NULL                         NULL
#> 5                           NULL                         NULL
#> 6                           NULL                         NULL
#>   abstract_inverted_index.conditions abstract_inverted_index.four
#> 1                                 77                           79
#> 2                               NULL                           66
#> 3                               NULL                         NULL
#> 4                                133                         NULL
#> 5                               NULL                         NULL
#> 6                               NULL                         NULL
#>   abstract_inverted_index.speakers. abstract_inverted_index.Fifteen
#> 1                                80                              81
#> 2                              NULL                            NULL
#> 3                              NULL                            NULL
#> 4                              NULL                            NULL
#> 5                              NULL                            NULL
#> 6                              NULL                            NULL
#>   abstract_inverted_index.parameters, abstract_inverted_index.including
#> 1                                  82                                83
#> 2                                  75                              NULL
#> 3                                NULL                           61, 122
#> 4                                NULL                              NULL
#> 5                                NULL                              NULL
#> 6                                NULL                              NULL
#>   abstract_inverted_index.pitch, abstract_inverted_index.pitch
#> 1                             84                       85, 121
#> 2                           NULL                          NULL
#> 3                           NULL                          NULL
#> 4                           NULL                          NULL
#> 5                             26                          NULL
#> 6                           NULL                          NULL
#>   abstract_inverted_index.contour, abstract_inverted_index.rms
#> 1                               86                          87
#> 2                             NULL                        NULL
#> 3                             NULL                        NULL
#> 4                             NULL                        NULL
#> 5                             NULL                        NULL
#> 6                             NULL                        NULL
#>   abstract_inverted_index.intensity abstract_inverted_index.measures,
#> 1                                88                                89
#> 2                              NULL                              NULL
#> 3                              NULL                              NULL
#> 4                              NULL                              NULL
#> 5                              NULL                              NULL
#> 6                              NULL                              NULL
#>   abstract_inverted_index.measures abstract_inverted_index.shimmer
#> 1                               91                              93
#> 2                             NULL                            NULL
#> 3                             NULL                            NULL
#> 4                             NULL                            NULL
#> 5                             NULL                            NULL
#> 6                             NULL                            NULL
#>   abstract_inverted_index.jitter, abstract_inverted_index.directly
#> 1                              95                               98
#> 2                            NULL                             NULL
#> 3                            NULL                             NULL
#> 4                            NULL                             NULL
#> 5                            NULL                             NULL
#> 6                            NULL                             NULL
#>   abstract_inverted_index.waveform. abstract_inverted_index.As
#> 1                               102                        103
#> 2                              NULL                       NULL
#> 3                              NULL                       NULL
#> 4                              NULL                       NULL
#> 5                              NULL                       NULL
#> 6                              NULL                       NULL
#>   abstract_inverted_index.expected, abstract_inverted_index.most
#> 1                          104, 125                          106
#> 2                              NULL                         NULL
#> 3                              NULL                         NULL
#> 4                              NULL                         NULL
#> 5                              NULL                         NULL
#> 6                              NULL                         NULL
#>   abstract_inverted_index.significant abstract_inverted_index.differences
#> 1                            107, 129                            108, 130
#> 2                                NULL                                NULL
#> 3                                NULL                                NULL
#> 4                                NULL                                NULL
#> 5                                NULL                                NULL
#> 6                                NULL                                NULL
#>   abstract_inverted_index.between abstract_inverted_index.measuring
#> 1                             109                               117
#> 2                            NULL                              NULL
#> 3                            NULL                              NULL
#> 4                            NULL                              NULL
#> 5                            NULL                              NULL
#> 6                            NULL                              NULL
#>   abstract_inverted_index.perturbations abstract_inverted_index.adjacent
#> 1                                   118                              120
#> 2                                  NULL                             NULL
#> 3                                  NULL                             NULL
#> 4                                  NULL                             NULL
#> 5                                  NULL                             NULL
#> 6                                  NULL                             NULL
#>   abstract_inverted_index.periods. abstract_inverted_index.Also
#> 1                              122                          123
#> 2                             NULL                         NULL
#> 3                             NULL                         NULL
#> 4                             NULL                         NULL
#> 5                             NULL                         NULL
#> 6                             NULL                         NULL
#>   abstract_inverted_index.as abstract_inverted_index.there
#> 1                   124, 136                           126
#> 2                       NULL                          NULL
#> 3                        133                          NULL
#> 4              117, 134, 136                          NULL
#> 5                       NULL                          NULL
#> 6                         48                          NULL
#>   abstract_inverted_index.no abstract_inverted_index.more
#> 1                        128                          132
#> 2                       NULL                         NULL
#> 3                       NULL                         NULL
#> 4                       NULL                       40, 79
#> 5                       NULL                         NULL
#> 6                       NULL                     104, 128
#>   abstract_inverted_index.global abstract_inverted_index.such
#> 1                            133                          135
#> 2                           NULL                         NULL
#> 3                           NULL                         NULL
#> 4                           NULL                         NULL
#> 5                           NULL                         NULL
#> 6                           NULL                           47
#>   abstract_inverted_index.average abstract_inverted_index.pitch.
#> 1                             137                            138
#> 2                            NULL                           NULL
#> 3                            NULL                           NULL
#> 4                            NULL                           NULL
#> 5                            NULL                           NULL
#> 6                            NULL                           NULL
#>   abstract_inverted_index.Additionally, abstract_inverted_index.waveforms
#> 1                                   139                               141
#> 2                                  NULL               42, 62, 78, 93, 138
#> 3                                  NULL                              NULL
#> 4                                  NULL                              NULL
#> 5                                  NULL                              NULL
#> 6                                  NULL                              NULL
#>   abstract_inverted_index.two abstract_inverted_index....
#> 1                         145                         148
#> 2                      51, 69                        NULL
#> 3                        NULL                        NULL
#> 4                        NULL                        NULL
#> 5                        NULL                        NULL
#> 6                        NULL                        NULL
#>   abstract_inverted_index.problems abstract_inverted_index.automatic
#> 1                             NULL                              NULL
#> 2                                1                                 3
#> 3                             NULL                              NULL
#> 4                             NULL                              NULL
#> 5                             NULL                              NULL
#> 6                             NULL                              NULL
#>   abstract_inverted_index.recognition abstract_inverted_index.synthesis
#> 1                                NULL                              NULL
#> 2                                   4                                 7
#> 3                                NULL                              NULL
#> 4                                NULL                              NULL
#> 5                                NULL                              NULL
#> 6                                  23                              NULL
#>   abstract_inverted_index.multistyle abstract_inverted_index.have
#> 1                               NULL                         NULL
#> 2                                  9                       11, 99
#> 3                               NULL                         NULL
#> 4                               NULL                           12
#> 5                                  1                           21
#> 6                               NULL                           88
#>   abstract_inverted_index.become abstract_inverted_index.important
#> 1                           NULL                              NULL
#> 2                             12                                13
#> 3                           NULL                              NULL
#> 4                           NULL                              NULL
#> 5                           NULL                                 6
#> 6                           NULL                              NULL
#>   abstract_inverted_index.topics abstract_inverted_index.recent
#> 1                           NULL                           NULL
#> 2                             14                             18
#> 3                           NULL                           NULL
#> 4                           NULL                           NULL
#> 5                           NULL                             11
#> 6                           NULL                           NULL
#>   abstract_inverted_index.years. abstract_inverted_index.This
#> 1                           NULL                         NULL
#> 2                             19                           20
#> 3                           NULL                        0, 25
#> 4                           NULL                           34
#> 5                             12                         NULL
#> 6                           NULL                         NULL
#>   abstract_inverted_index.paper abstract_inverted_index.reports
#> 1                          NULL                            NULL
#> 2                            21                              22
#> 3                             1                            NULL
#> 4                          NULL                            NULL
#> 5                          NULL                            NULL
#> 6                          NULL                            NULL
#>   abstract_inverted_index.extensive abstract_inverted_index.investigation
#> 1                              NULL                                  NULL
#> 2                                24                                    25
#> 3                              NULL                                  NULL
#> 4                              NULL                                  NULL
#> 5                              NULL                                  NULL
#> 6                              NULL                                  NULL
#>   abstract_inverted_index.variations abstract_inverted_index.that
#> 1                               NULL                         NULL
#> 2                                 28                           29
#> 3                               NULL                          124
#> 4                               NULL              17, 46, 77, 149
#> 5                                 76                105, 120, 174
#> 6                               NULL                          119
#>   abstract_inverted_index.occur abstract_inverted_index.eleven
#> 1                          NULL                           NULL
#> 2                            30                     36, 57, 81
#> 3                          NULL                           NULL
#> 4                          NULL                           NULL
#> 5                          NULL                       128, 176
#> 6                          NULL                           NULL
#>   abstract_inverted_index.commonly abstract_inverted_index.encountered
#> 1                             NULL                                NULL
#> 2                               37                                  38
#> 3                             NULL                                NULL
#> 4                             NULL                                NULL
#> 5                               17                                  18
#> 6                             NULL                                NULL
#>   abstract_inverted_index.styles. abstract_inverted_index.Glottal
#> 1                            NULL                            NULL
#> 2                          40, 59                              41
#> 3                            NULL                            NULL
#> 4                            NULL                            NULL
#> 5                            NULL                            NULL
#> 6                            NULL                            NULL
#>   abstract_inverted_index.for abstract_inverted_index.speakers
#> 1                        NULL                             NULL
#> 2                      50, 53                               52
#> 3                     11, 100                             NULL
#> 4                          70                             NULL
#> 5                        NULL                             NULL
#> 6                        NULL                             NULL
#>   abstract_inverted_index.each abstract_inverted_index.speaking
#> 1                         NULL                             NULL
#> 2                       54, 95                               58
#> 3                         NULL                             NULL
#> 4                         NULL                             NULL
#> 5                          125                             NULL
#> 6                         NULL                               84
#>   abstract_inverted_index.parametrized abstract_inverted_index.into
#> 1                                 NULL                         NULL
#> 2                                   64                           65
#> 3                                 NULL                         NULL
#> 4                                 NULL                         NULL
#> 5                                 NULL                         NULL
#> 6                                 NULL                            5
#>   abstract_inverted_index.duration‐related
#> 1                                     NULL
#> 2                                       67
#> 3                                     NULL
#> 4                                     NULL
#> 5                                     NULL
#> 6                                     NULL
#>   abstract_inverted_index.slope‐related abstract_inverted_index.values.
#> 1                                  NULL                            NULL
#> 2                                    70                              71
#> 3                                  NULL                            NULL
#> 4                                  NULL                            NULL
#> 5                                  NULL                            NULL
#> 6                                  NULL                            NULL
#>   abstract_inverted_index.Using abstract_inverted_index.these
#> 1                          NULL                          NULL
#> 2                            72                            73
#> 3                          NULL                          NULL
#> 4                          NULL                          NULL
#> 5                          NULL                          NULL
#> 6                          NULL                           131
#>   abstract_inverted_index.six abstract_inverted_index.styles
#> 1                        NULL                           NULL
#> 2                          74                             82
#> 3                        NULL                           NULL
#> 4                        NULL                           NULL
#> 5                        NULL      20, 42, 61, 129, 150, 178
#> 6                        NULL                             46
#>   abstract_inverted_index.analyzed abstract_inverted_index.qualitatively
#> 1                             NULL                                  NULL
#> 2                               86                                    88
#> 3                             NULL                                  NULL
#> 4                             NULL                                  NULL
#> 5                             NULL                                  NULL
#> 6                             NULL                                  NULL
#>   abstract_inverted_index.quantitatively. abstract_inverted_index.style
#> 1                                    NULL                          NULL
#> 2                                      90                       96, 123
#> 3                                    NULL                          NULL
#> 4                                    NULL                          NULL
#> 5                                    NULL                          NULL
#> 6                                    NULL                        36, 85
#>   abstract_inverted_index.been abstract_inverted_index.shown
#> 1                         NULL                          NULL
#> 2                     100, 140                      101, 141
#> 3                          112                          NULL
#> 4                         NULL                          NULL
#> 5                        4, 22                          NULL
#> 6                           89                          NULL
#>   abstract_inverted_index.identifiably abstract_inverted_index.different
#> 1                                 NULL                              NULL
#> 2                                  106                               107
#> 3                                 NULL                              NULL
#> 4                                 NULL                              NULL
#> 5                             133, 182                              NULL
#> 6                                 NULL                              NULL
#>   abstract_inverted_index.all abstract_inverted_index.other
#> 1                        NULL                          NULL
#> 2                         109                           110
#> 3                        NULL                          NULL
#> 4                        NULL                          NULL
#> 5                        NULL                           148
#> 6                        NULL                          NULL
#>   abstract_inverted_index.styles, abstract_inverted_index.thereby
#> 1                            NULL                            NULL
#> 2                             111                             112
#> 3                            NULL                            NULL
#> 4                            NULL                            NULL
#> 5                            NULL                            NULL
#> 6                            NULL                            NULL
#>   abstract_inverted_index.confirming abstract_inverted_index.importance
#> 1                               NULL                               NULL
#> 2                                113                                115
#> 3                               NULL                               NULL
#> 4                               NULL                               NULL
#> 5                               NULL                                108
#> 6                               NULL                                 65
#>   abstract_inverted_index.waveform abstract_inverted_index.conveying
#> 1                             NULL                              NULL
#> 2                         119, 129                               121
#> 3                             NULL                              NULL
#> 4                             NULL                              NULL
#> 5                             NULL                              NULL
#> 6                             NULL                                71
#>   abstract_inverted_index.information abstract_inverted_index.causing
#> 1                                NULL                            NULL
#> 2                                 124                             127
#> 3                                NULL                            NULL
#> 4                                NULL                            NULL
#> 5                                NULL                            NULL
#> 6                                NULL                            NULL
#>   abstract_inverted_index.variations. abstract_inverted_index.degree
#> 1                                NULL                           NULL
#> 2                                 130                            132
#> 3                                NULL                           NULL
#> 4                                NULL                           NULL
#> 5                                NULL                           NULL
#> 6                                NULL                           NULL
#>   abstract_inverted_index.variation abstract_inverted_index.styled
#> 1                              NULL                           NULL
#> 2                               134                            136
#> 3                              NULL                           NULL
#> 4                              NULL                           NULL
#> 5                              NULL                        68, 114
#> 6                              NULL                       100, 120
#>   abstract_inverted_index.has abstract_inverted_index.consistent
#> 1                        NULL                               NULL
#> 2                         139                                144
#> 3                         111                               NULL
#> 4                          36                               NULL
#> 5                           3                               NULL
#> 6                        NULL                               NULL
#>   abstract_inverted_index.when abstract_inverted_index.trained
#> 1                         NULL                            NULL
#> 2                          145                             146
#> 3                         NULL                            NULL
#> 4                         NULL                            NULL
#> 5                         NULL                            NULL
#> 6                         NULL                            NULL
#>   abstract_inverted_index.on abstract_inverted_index.one
#> 1                       NULL                        NULL
#> 2                        147                         148
#> 3                          9                        NULL
#> 4                     14, 49                        NULL
#> 5                 33, 70, 83                        NULL
#> 6                       NULL                         113
#>   abstract_inverted_index.speaker abstract_inverted_index.compared
#> 1                            NULL                             NULL
#> 2                             149                              151
#> 3                            NULL                             NULL
#> 4                            NULL                             NULL
#> 5                            NULL                             NULL
#> 6                            NULL                             NULL
#>   abstract_inverted_index.with abstract_inverted_index.another.
#> 1                         NULL                             NULL
#> 2                          152                              153
#> 3                         NULL                             NULL
#> 4                         NULL                             NULL
#> 5                          170                             NULL
#> 6                  41, 57, 130                             NULL
#>   abstract_inverted_index.describes abstract_inverted_index.a
#> 1                              NULL                      NULL
#> 2                              NULL                      NULL
#> 3                                 2       3, 20, 36, 101, 115
#> 4                              NULL           38, 62, 74, 118
#> 5                              NULL                      NULL
#> 6                              NULL                        20
#>   abstract_inverted_index.model abstract_inverted_index.production
#> 1                          NULL                               NULL
#> 2                          NULL                               NULL
#> 3            4, 57, 75, 87, 107                             7, 110
#> 4               42, 60, 93, 114                        45, 96, 109
#> 5                          NULL                               NULL
#> 6                          NULL                               NULL
#>   abstract_inverted_index.based abstract_inverted_index.solving
#> 1                          NULL                            NULL
#> 2                          NULL                            NULL
#> 3                             8                              10
#> 4                            48                            NULL
#> 5                        69, 82                            NULL
#> 6                          NULL                            NULL
#>   abstract_inverted_index.acoustic abstract_inverted_index.wave
#> 1                             NULL                         NULL
#> 2                             NULL                         NULL
#> 3                           12, 66                       13, 67
#> 4                             NULL                       53, 71
#> 5                             NULL                         NULL
#> 6                             NULL                         NULL
#>   abstract_inverted_index.propagation abstract_inverted_index.tract
#> 1                                NULL                          NULL
#> 2                                NULL                          NULL
#> 3                                  14                            18
#> 4                              54, 72                       84, 139
#> 5                                NULL                          NULL
#> 6                                NULL                          NULL
#>   abstract_inverted_index.using abstract_inverted_index.finite-difference
#> 1                          NULL                                      NULL
#> 2                          NULL                                      NULL
#> 3                            19                                        21
#> 4                          NULL                                      NULL
#> 5                          NULL                                      NULL
#> 6                          NULL                                      NULL
#>   abstract_inverted_index.time-domain abstract_inverted_index.(FDTD)
#> 1                                NULL                           NULL
#> 2                                NULL                           NULL
#> 3                                  22                             23
#> 4                                NULL                           NULL
#> 5                                NULL                           NULL
#> 6                                NULL                           NULL
#>   abstract_inverted_index.technique. abstract_inverted_index.FDTD
#> 1                               NULL                         NULL
#> 2                               NULL                         NULL
#> 3                                 24                  26, 93, 106
#> 4                               NULL                         NULL
#> 5                               NULL                         NULL
#> 6                               NULL                         NULL
#>   abstract_inverted_index.technique abstract_inverted_index.first
#> 1                              NULL                          NULL
#> 2                              NULL                          NULL
#> 3                                27                            29
#> 4                              NULL                          NULL
#> 5                              NULL                          NULL
#> 6                              NULL                          NULL
#>   abstract_inverted_index.developed abstract_inverted_index.Yee
#> 1                              NULL                        NULL
#> 2                              NULL                        NULL
#> 3                                30                          32
#> 4                                37                        NULL
#> 5                              NULL                        NULL
#> 6                                90                        NULL
#>   abstract_inverted_index.(1966) abstract_inverted_index.utilizes
#> 1                           NULL                             NULL
#> 2                           NULL                             NULL
#> 3                             33                               35
#> 4                           NULL                             NULL
#> 5                           NULL                             NULL
#> 6                           NULL                             NULL
#>   abstract_inverted_index.discretization abstract_inverted_index.scheme
#> 1                                   NULL                           NULL
#> 2                                   NULL                           NULL
#> 3                                 37, 62                             38
#> 4                                   NULL                           NULL
#> 5                                   NULL                           NULL
#> 6                                   NULL                           NULL
#>   abstract_inverted_index.which abstract_inverted_index.pressure
#> 1                          NULL                             NULL
#> 2                          NULL                             NULL
#> 3                            40                               41
#> 4                           122                             NULL
#> 5                          NULL                             NULL
#> 6                          NULL                             NULL
#>   abstract_inverted_index.velocity abstract_inverted_index.components
#> 1                             NULL                               NULL
#> 2                             NULL                               NULL
#> 3                               43                                 44
#> 4                             NULL                               NULL
#> 5                             NULL                               NULL
#> 6                             NULL                               NULL
#>   abstract_inverted_index.are abstract_inverted_index.interleaved
#> 1                        NULL                                NULL
#> 2                        NULL                                NULL
#> 3                 45, 81, 135                                  46
#> 4                        NULL                                NULL
#> 5                          81                                NULL
#> 6                  17, 92, 96                                NULL
#>   abstract_inverted_index.space abstract_inverted_index.time.
#> 1                          NULL                          NULL
#> 2                          NULL                          NULL
#> 3                            49                            51
#> 4                          NULL                          NULL
#> 5                          NULL                          NULL
#> 6                          NULL                          NULL
#>   abstract_inverted_index.specific abstract_inverted_index.implementation
#> 1                             NULL                                   NULL
#> 2                             NULL                                   NULL
#> 3                               53                                     54
#> 4                             NULL                                   NULL
#> 5                             NULL                                   NULL
#> 6                             NULL                                   NULL
#>   abstract_inverted_index.production, abstract_inverted_index.coupled
#> 1                                NULL                            NULL
#> 2                                NULL                            NULL
#> 3                                  60                              65
#> 4                                NULL                            NULL
#> 5                                NULL                            NULL
#> 6                                NULL                            NULL
#>   abstract_inverted_index.equations, abstract_inverted_index.boundary
#> 1                               NULL                             NULL
#> 2                               NULL                             NULL
#> 3                                 68                               69
#> 4                               NULL                              132
#> 5                               NULL                             NULL
#> 6                               NULL                             NULL
#>   abstract_inverted_index.conditions, abstract_inverted_index.stability
#> 1                                NULL                              NULL
#> 2                                NULL                              NULL
#> 3                                  70                                71
#> 4                                NULL                              NULL
#> 5                                NULL                              NULL
#> 6                                NULL                              NULL
#>   abstract_inverted_index.criteria, abstract_inverted_index.values
#> 1                              NULL                           NULL
#> 2                              NULL                           NULL
#> 3                                72                             73
#> 4                              NULL                           NULL
#> 5                              NULL                           NULL
#> 6                              NULL                           NULL
#>   abstract_inverted_index.constants, abstract_inverted_index.method
#> 1                               NULL                           NULL
#> 2                               NULL                           NULL
#> 3                                 76                             78
#> 4                               NULL                           NULL
#> 5                               NULL                           NULL
#> 6                               NULL                           NULL
#>   abstract_inverted_index.excitation, abstract_inverted_index.presented.
#> 1                                NULL                               NULL
#> 2                                NULL                               NULL
#> 3                             80, 134                            82, 136
#> 4                                NULL                               NULL
#> 5                                NULL                               NULL
#> 6                                NULL                                 18
#>   abstract_inverted_index.accuracy abstract_inverted_index.verified
#> 1                             NULL                             NULL
#> 2                             NULL                             NULL
#> 3                               84                               89
#> 4                             NULL                             NULL
#> 5                             NULL                             NULL
#> 6                               58                             NULL
#>   abstract_inverted_index.comparing abstract_inverted_index.results
#> 1                              NULL                            NULL
#> 2                              NULL                            NULL
#> 3                                91                          94, 99
#> 4                              NULL                            NULL
#> 5                              NULL                              85
#> 6                              NULL                              62
#>   abstract_inverted_index.theoretically abstract_inverted_index.expected
#> 1                                  NULL                             NULL
#> 2                                  NULL                             NULL
#> 3                                    97                               98
#> 4                                  NULL                             NULL
#> 5                                  NULL                             NULL
#> 6                                  NULL                             NULL
#>   abstract_inverted_index.well-known abstract_inverted_index.acoustics
#> 1                               NULL                              NULL
#> 2                               NULL                              NULL
#> 3                                102                               103
#> 4                               NULL                              NULL
#> 5                               NULL                              NULL
#> 6                               NULL                              NULL
#>   abstract_inverted_index.problem. abstract_inverted_index.used
#> 1                             NULL                         NULL
#> 2                             NULL                         NULL
#> 3                              104                          113
#> 4                             NULL                         NULL
#> 5                             NULL                         NULL
#> 6                             NULL                           26
#>   abstract_inverted_index.variety abstract_inverted_index.experiments,
#> 1                            NULL                                 NULL
#> 2                            NULL                                 NULL
#> 3                             116                                  118
#> 4                            NULL                                 NULL
#> 5                            NULL                                 NULL
#> 6                            NULL                                 NULL
#>   abstract_inverted_index.several abstract_inverted_index.results,
#> 1                            NULL                             NULL
#> 2                            NULL                             NULL
#> 3                        120, 129                              121
#> 4                             155                             NULL
#> 5                            NULL                             NULL
#> 6                              83                             NULL
#>   abstract_inverted_index.those abstract_inverted_index.compare
#> 1                          NULL                            NULL
#> 2                          NULL                            NULL
#> 3                           123                             125
#> 4                          NULL                        105, 150
#> 5                          NULL                            NULL
#> 6                          NULL                            NULL
#>   abstract_inverted_index.use abstract_inverted_index.common
#> 1                        NULL                           NULL
#> 2                        NULL                           NULL
#> 3                         127                            130
#> 4                        NULL                           NULL
#> 5                        NULL                           NULL
#> 6                        NULL                           NULL
#>   abstract_inverted_index.models abstract_inverted_index.limitations
#> 1                           NULL                                NULL
#> 2                           NULL                                NULL
#> 3                            132                                NULL
#> 4                             16                                   2
#> 5                           NULL                                NULL
#> 6                           NULL                                NULL
#>   abstract_inverted_index.computing abstract_inverted_index.resources
#> 1                              NULL                              NULL
#> 2                              NULL                              NULL
#> 3                              NULL                              NULL
#> 4                                 4                                 5
#> 5                              NULL                              NULL
#> 6                              NULL                              NULL
#>   abstract_inverted_index.methods, abstract_inverted_index.processing
#> 1                             NULL                               NULL
#> 2                             NULL                               NULL
#> 3                             NULL                               NULL
#> 4                                8                                 10
#> 5                             NULL                               NULL
#> 6                             NULL                               NULL
#>   abstract_inverted_index.techniques abstract_inverted_index.relied
#> 1                               NULL                           NULL
#> 2                               NULL                           NULL
#> 3                               NULL                           NULL
#> 4                                 11                             13
#> 5                               NULL                           NULL
#> 6                               NULL                           NULL
#>   abstract_inverted_index.linear abstract_inverted_index.make
#> 1                           NULL                         NULL
#> 2                           NULL                         NULL
#> 3                           NULL                         NULL
#> 4                             15                           18
#> 5                           NULL                         NULL
#> 6                           NULL                         NULL
#>   abstract_inverted_index.simplifying abstract_inverted_index.assumptions
#> 1                                NULL                                NULL
#> 2                                NULL                                NULL
#> 3                                NULL                                NULL
#> 4                                  19                                  20
#> 5                                NULL                                NULL
#> 6                                NULL                                NULL
#>   abstract_inverted_index.about abstract_inverted_index.manner
#> 1                          NULL                           NULL
#> 2                          NULL                           NULL
#> 3                          NULL                           NULL
#> 4                            21                             23
#> 5                          NULL                           NULL
#> 6                          NULL                           NULL
#>   abstract_inverted_index.propagation, abstract_inverted_index.losses,
#> 1                                 NULL                            NULL
#> 2                                 NULL                            NULL
#> 3                                 NULL                            NULL
#> 4                                   25                              26
#> 5                                 NULL                            NULL
#> 6                                 NULL                            NULL
#>   abstract_inverted_index.geometry abstract_inverted_index.tract.
#> 1                             NULL                           NULL
#> 2                             NULL                           NULL
#> 3                             NULL                           NULL
#> 4                      29, 76, 140                    33, 58, 147
#> 5                             NULL                           NULL
#> 6                             NULL                           NULL
#>   abstract_inverted_index.new, abstract_inverted_index.sophisticated
#> 1                         NULL                                  NULL
#> 2                         NULL                                  NULL
#> 3                         NULL                                  NULL
#> 4                           39                                    41
#> 5                         NULL                                  NULL
#> 6                         NULL                                  NULL
#>   abstract_inverted_index.numerical abstract_inverted_index.simulation
#> 1                              NULL                               NULL
#> 2                              NULL                               NULL
#> 3                              NULL                               NULL
#> 4                            50, 63                                 51
#> 5                              NULL                               NULL
#> 6                              NULL                               NULL
#>   abstract_inverted_index.uses abstract_inverted_index.technique,
#> 1                         NULL                               NULL
#> 2                         NULL                               NULL
#> 3                         NULL                               NULL
#> 4                           61                                 65
#> 5                         NULL                               NULL
#> 6                         NULL                               NULL
#>   abstract_inverted_index.finite abstract_inverted_index.differencing,
#> 1                           NULL                                  NULL
#> 2                           NULL                                  NULL
#> 3                           NULL                                  NULL
#> 4                             66                                    67
#> 5                           NULL                                  NULL
#> 6                           NULL                                  NULL
#>   abstract_inverted_index.solve abstract_inverted_index.representative
#> 1                          NULL                                   NULL
#> 2                          NULL                                   NULL
#> 3                          NULL                                   NULL
#> 4                            69                                     80
#> 5                          NULL                                   NULL
#> 6                          NULL                                   NULL
#>   abstract_inverted_index.than abstract_inverted_index.previous
#> 1                         NULL                             NULL
#> 2                         NULL                             NULL
#> 3                         NULL                             NULL
#> 4                           85                               86
#> 5                         NULL                             NULL
#> 6                         NULL                                3
#>   abstract_inverted_index.models. abstract_inverted_index.developing
#> 1                            NULL                               NULL
#> 2                            NULL                               NULL
#> 3                            NULL                               NULL
#> 4                              87                                 91
#> 5                            NULL                               NULL
#> 6                            NULL                               NULL
#>   abstract_inverted_index.enable abstract_inverted_index.researcher
#> 1                           NULL                               NULL
#> 2                           NULL                               NULL
#> 3                           NULL                               NULL
#> 4                             99                                101
#> 5                           NULL                               NULL
#> 6                           NULL                               NULL
#>   abstract_inverted_index.investigate abstract_inverted_index.theories
#> 1                                NULL                             NULL
#> 2                                NULL                             NULL
#> 3                                NULL                             NULL
#> 4                                 103                              106
#> 5                                NULL                             NULL
#> 6                                NULL                             NULL
#>   abstract_inverted_index.varying abstract_inverted_index.complexity.
#> 1                            NULL                                NULL
#> 2                            NULL                                NULL
#> 3                            NULL                                NULL
#> 4                             111                                 112
#> 5                              25                                NULL
#> 6                            NULL                                NULL
#>   abstract_inverted_index.designed abstract_inverted_index.tool
#> 1                             NULL                         NULL
#> 2                             NULL                         NULL
#> 3                             NULL                         NULL
#> 4                              116                          120
#> 5                             NULL                         NULL
#> 6                             NULL                         NULL
#>   abstract_inverted_index.possible abstract_inverted_index.vary
#> 1                             NULL                         NULL
#> 2                             NULL                         NULL
#> 3                             NULL                         NULL
#> 4                              125                          127
#> 5                             NULL                         NULL
#> 6                             NULL                         NULL
#>   abstract_inverted_index.driving abstract_inverted_index.equations
#> 1                            NULL                              NULL
#> 2                            NULL                              NULL
#> 3                            NULL                              NULL
#> 4                             129                               130
#> 5                            NULL                              NULL
#> 6                            NULL                              NULL
#>   abstract_inverted_index.well abstract_inverted_index.Simulations
#> 1                         NULL                                NULL
#> 2                         NULL                                NULL
#> 3                         NULL                                NULL
#> 4                          135                                 148
#> 5                         NULL                                NULL
#> 6                         NULL                                NULL
#>   abstract_inverted_index.produced abstract_inverted_index.given
#> 1                             NULL                          NULL
#> 2                             NULL                          NULL
#> 3                             NULL                          NULL
#> 4                              153                           154
#> 5                             NULL                          NULL
#> 6                             NULL                            30
#>   abstract_inverted_index.different... abstract_inverted_index.Synthesizing
#> 1                                 NULL                                 NULL
#> 2                                 NULL                                 NULL
#> 3                                 NULL                                 NULL
#> 4                                  156                                 NULL
#> 5                                 NULL                                    0
#> 6                                 NULL                                 NULL
#>   abstract_inverted_index.topic abstract_inverted_index.research,
#> 1                          NULL                              NULL
#> 2                          NULL                              NULL
#> 3                          NULL                              NULL
#> 4                          NULL                              NULL
#> 5                             7                                15
#> 6                          NULL                              NULL
#>   abstract_inverted_index.11 abstract_inverted_index.synthesized
#> 1                       NULL                                NULL
#> 2                       NULL                                NULL
#> 3                       NULL                                NULL
#> 4                       NULL                                NULL
#> 5                     16, 40                        23, 142, 155
#> 6                       NULL                                NULL
#>   abstract_inverted_index.duration, abstract_inverted_index.intensity,
#> 1                              NULL                               NULL
#> 2                              NULL                               NULL
#> 3                              NULL                               NULL
#> 4                              NULL                               NULL
#> 5                                27                                 28
#> 6                              NULL                               NULL
#>   abstract_inverted_index.Klatt abstract_inverted_index.Synthesizer
#> 1                          NULL                                NULL
#> 2                          NULL                                NULL
#> 3                          NULL                                NULL
#> 4                          NULL                                NULL
#> 5                            35                                  36
#> 6                          NULL                                NULL
#>   abstract_inverted_index.88, abstract_inverted_index.KLSYN88.
#> 1                        NULL                             NULL
#> 2                        NULL                             NULL
#> 3                        NULL                             NULL
#> 4                        NULL                             NULL
#> 5                          37                               38
#> 6                        NULL                             NULL
#>   abstract_inverted_index.These abstract_inverted_index.include
#> 1                          NULL                            NULL
#> 2                          NULL                            NULL
#> 3                          NULL                            NULL
#> 4                          NULL                            NULL
#> 5                       39, 116                              43
#> 6                        61, 94                            NULL
#>   abstract_inverted_index.angry, abstract_inverted_index.clear,
#> 1                           NULL                           NULL
#> 2                           NULL                           NULL
#> 3                           NULL                           NULL
#> 4                           NULL                           NULL
#> 5                             44                             45
#> 6                             49                           NULL
#>   abstract_inverted_index.50% abstract_inverted_index.tasking,
#> 1                        NULL                             NULL
#> 2                        NULL                             NULL
#> 3                        NULL                             NULL
#> 4                        NULL                             NULL
#> 5                          46                           47, 49
#> 6                        NULL                             NULL
#>   abstract_inverted_index.70% abstract_inverted_index.fast,
#> 1                        NULL                          NULL
#> 2                        NULL                          NULL
#> 3                        NULL                          NULL
#> 4                        NULL                          NULL
#> 5                          48                            50
#> 6                        NULL                          NULL
#>   abstract_inverted_index.Lombard, abstract_inverted_index.loud,
#> 1                             NULL                          NULL
#> 2                             NULL                          NULL
#> 3                             NULL                          NULL
#> 4                             NULL                          NULL
#> 5                               51                            52
#> 6                             NULL                            50
#>   abstract_inverted_index.normal, abstract_inverted_index.question,
#> 1                            NULL                              NULL
#> 2                            NULL                              NULL
#> 3                            NULL                              NULL
#> 4                            NULL                              NULL
#> 5                              53                                54
#> 6                            NULL                              NULL
#>   abstract_inverted_index.slow, abstract_inverted_index.soft.
#> 1                          NULL                          NULL
#> 2                          NULL                          NULL
#> 3                          NULL                          NULL
#> 4                          NULL                          NULL
#> 5                            55                            57
#> 6                          NULL                          NULL
#>   abstract_inverted_index.All abstract_inverted_index.proved
#> 1                        NULL                           NULL
#> 2                        NULL                           NULL
#> 3                        NULL                           NULL
#> 4                        NULL                           NULL
#> 5                          58                             62
#> 6                        NULL                           NULL
#>   abstract_inverted_index.intelligible abstract_inverted_index.appropriately
#> 1                                 NULL                                  NULL
#> 2                                 NULL                                  NULL
#> 3                                 NULL                                  NULL
#> 4                                 NULL                                  NULL
#> 5                                   65                                    67
#> 6                                 NULL                                  NULL
#>   abstract_inverted_index.subjective abstract_inverted_index.listening
#> 1                               NULL                              NULL
#> 2                               NULL                              NULL
#> 3                               NULL                              NULL
#> 4                               NULL                              NULL
#> 5                                 71                           72, 168
#> 6                                115                               116
#>   abstract_inverted_index.tests. abstract_inverted_index.parameter
#> 1                           NULL                              NULL
#> 2                           NULL                              NULL
#> 3                           NULL                              NULL
#> 4                           NULL                              NULL
#> 5                             73                                75
#> 6                           NULL                              NULL
#>   abstract_inverted_index.statistical abstract_inverted_index.analyses
#> 1                                NULL                             NULL
#> 2                                NULL                             NULL
#> 3                                NULL                             NULL
#> 4                                NULL                             NULL
#> 5                             87, 117                          88, 118
#> 6                                NULL                             NULL
#>   abstract_inverted_index.[K. abstract_inverted_index.Cummings,
#> 1                        NULL                              NULL
#> 2                        NULL                              NULL
#> 3                        NULL                              NULL
#> 4                        NULL                              NULL
#> 5                          89                                90
#> 6                        NULL                              NULL
#>   abstract_inverted_index.Analysis, abstract_inverted_index.Syn.,
#> 1                              NULL                          NULL
#> 2                              NULL                          NULL
#> 3                              NULL                          NULL
#> 4                              NULL                          NULL
#> 5                                91                            92
#> 6                              NULL                          NULL
#>   abstract_inverted_index.Rec. abstract_inverted_index.Stressed
#> 1                         NULL                             NULL
#> 2                         NULL                             NULL
#> 3                         NULL                             NULL
#> 4                         NULL                             NULL
#> 5                           94                               96
#> 6                         NULL                             NULL
#>   abstract_inverted_index.Speech, abstract_inverted_index.Ph.D
#> 1                            NULL                         NULL
#> 2                            NULL                         NULL
#> 3                            NULL                         NULL
#> 4                            NULL                         NULL
#> 5                              97                           98
#> 6                            NULL                         NULL
#>   abstract_inverted_index.thesis, abstract_inverted_index.Georgia
#> 1                            NULL                            NULL
#> 2                            NULL                            NULL
#> 3                            NULL                            NULL
#> 4                            NULL                            NULL
#> 5                              99                             100
#> 6                            NULL                            NULL
#>   abstract_inverted_index.Inst. abstract_inverted_index.Tech.,
#> 1                          NULL                           NULL
#> 2                          NULL                           NULL
#> 3                          NULL                           NULL
#> 4                          NULL                           NULL
#> 5                           101                            103
#> 6                          NULL                           NULL
#>   abstract_inverted_index.1992] abstract_inverted_index.demonstrated
#> 1                          NULL                                 NULL
#> 2                          NULL                                 NULL
#> 3                          NULL                                 NULL
#> 4                          NULL                                 NULL
#> 5                           104                        106, 119, 173
#> 6                          NULL                                 NULL
#>   abstract_inverted_index.changes abstract_inverted_index.speech.
#> 1                            NULL                            NULL
#> 2                            NULL                            NULL
#> 3                            NULL                            NULL
#> 4                            NULL                            NULL
#> 5                             112                             115
#> 6                            NULL                            NULL
#>   abstract_inverted_index.different. abstract_inverted_index.One
#> 1                               NULL                        NULL
#> 2                               NULL                        NULL
#> 3                               NULL                        NULL
#> 4                               NULL                        NULL
#> 5                           134, 183                         135
#> 6                               NULL                        NULL
#>   abstract_inverted_index.utterance abstract_inverted_index.work
#> 1                              NULL                         NULL
#> 2                              NULL                         NULL
#> 3                              NULL                         NULL
#> 4                              NULL                         NULL
#> 5                               136                          139
#> 6                              NULL                         NULL
#>   abstract_inverted_index.‘‘hot’’ abstract_inverted_index.normal
#> 1                            NULL                           NULL
#> 2                            NULL                           NULL
#> 3                            NULL                           NULL
#> 4                            NULL                           NULL
#> 5                             140                       145, 165
#> 6                            NULL                  105, 107, 129
#>   abstract_inverted_index.style. abstract_inverted_index.ten
#> 1                           NULL                        NULL
#> 2                           NULL                        NULL
#> 3                           NULL                        NULL
#> 4                           NULL                        NULL
#> 5                            146                         149
#> 6                           NULL                        NULL
#>   abstract_inverted_index.word abstract_inverted_index.changing
#> 1                         NULL                             NULL
#> 2                         NULL                             NULL
#> 3                         NULL                             NULL
#> 4                         NULL                             NULL
#> 5                          153                              157
#> 6                         NULL                             NULL
#>   abstract_inverted_index.only abstract_inverted_index.utterance.
#> 1                         NULL                               NULL
#> 2                         NULL                               NULL
#> 3                         NULL                               NULL
#> 4                         NULL                               NULL
#> 5                          158                                166
#> 6                         NULL                               NULL
#>   abstract_inverted_index.Subjective abstract_inverted_index.tests
#> 1                               NULL                          NULL
#> 2                               NULL                          NULL
#> 3                               NULL                          NULL
#> 4                               NULL                          NULL
#> 5                                167                           169
#> 6                               NULL                           117
#>   abstract_inverted_index.untrained abstract_inverted_index.subjects
#> 1                              NULL                             NULL
#> 2                              NULL                             NULL
#> 3                              NULL                             NULL
#> 4                              NULL                             NULL
#> 5                               171                              172
#> 6                              NULL                             NULL
#>   abstract_inverted_index.synthetic abstract_inverted_index.perceivably
#> 1                              NULL                                NULL
#> 2                              NULL                                NULL
#> 3                              NULL                                NULL
#> 4                              NULL                                NULL
#> 5                               177                                 180
#> 6                              NULL                                NULL
#>   abstract_inverted_index.Two abstract_inverted_index.extensions
#> 1                        NULL                               NULL
#> 2                        NULL                               NULL
#> 3                        NULL                               NULL
#> 4                        NULL                               NULL
#> 5                        NULL                               NULL
#> 6                           0                                  1
#>   abstract_inverted_index.combined abstract_inverted_index.areas
#> 1                             NULL                          NULL
#> 2                             NULL                          NULL
#> 3                             NULL                          NULL
#> 4                             NULL                          NULL
#> 5                             NULL                          NULL
#> 6                                7                             8
#>   abstract_inverted_index.stressed abstract_inverted_index.modeling
#> 1                             NULL                             NULL
#> 2                             NULL                             NULL
#> 3                             NULL                             NULL
#> 4                             NULL                             NULL
#> 5                             NULL                             NULL
#> 6                               12                               16
#>   abstract_inverted_index.First, abstract_inverted_index.simple
#> 1                           NULL                           NULL
#> 2                           NULL                           NULL
#> 3                           NULL                           NULL
#> 4                           NULL                           NULL
#> 5                           NULL                           NULL
#> 6                             19                             21
#>   abstract_inverted_index.pattern abstract_inverted_index.principle
#> 1                            NULL                              NULL
#> 2                            NULL                              NULL
#> 3                            NULL                              NULL
#> 4                            NULL                              NULL
#> 5                            NULL                              NULL
#> 6                              22                                24
#>   abstract_inverted_index.show abstract_inverted_index.that,
#> 1                         NULL                          NULL
#> 2                         NULL                          NULL
#> 3                         NULL                          NULL
#> 4                         NULL                          NULL
#> 5                         NULL                          NULL
#> 6                           28                            29
#>   abstract_inverted_index.unknown abstract_inverted_index.waveform,
#> 1                            NULL                              NULL
#> 2                            NULL                              NULL
#> 3                            NULL                              NULL
#> 4                            NULL                              NULL
#> 5                            NULL                              NULL
#> 6                              32                                34
#>   abstract_inverted_index.can abstract_inverted_index.correctly
#> 1                        NULL                              NULL
#> 2                        NULL                              NULL
#> 3                        NULL                              NULL
#> 4                        NULL                              NULL
#> 5                        NULL                              NULL
#> 6                 37, 53, 122                            39, 55
#>   abstract_inverted_index.identified abstract_inverted_index.roughly
#> 1                               NULL                            NULL
#> 2                               NULL                            NULL
#> 3                               NULL                            NULL
#> 4                               NULL                            NULL
#> 5                               NULL                            NULL
#> 6                             40, 56                              42
#>   abstract_inverted_index.90% abstract_inverted_index.accuracy.
#> 1                        NULL                              NULL
#> 2                        NULL                              NULL
#> 3                        NULL                              NULL
#> 4                        NULL                              NULL
#> 5                        NULL                              NULL
#> 6                          43                                44
#>   abstract_inverted_index.Deviant abstract_inverted_index.soft
#> 1                            NULL                         NULL
#> 2                            NULL                         NULL
#> 3                            NULL                         NULL
#> 4                            NULL                         NULL
#> 5                            NULL                         NULL
#> 6                              45                           52
#>   abstract_inverted_index.approaching abstract_inverted_index.100%.
#> 1                                NULL                          NULL
#> 2                                NULL                          NULL
#> 3                                NULL                          NULL
#> 4                                NULL                          NULL
#> 5                                NULL                          NULL
#> 6                                  59                            60
#>   abstract_inverted_index.confirm abstract_inverted_index.stress
#> 1                            NULL                           NULL
#> 2                            NULL                           NULL
#> 3                            NULL                           NULL
#> 4                            NULL                           NULL
#> 5                            NULL                           NULL
#> 6                              63                             72
#>   abstract_inverted_index.contributing abstract_inverted_index.variability
#> 1                                 NULL                                NULL
#> 2                                 NULL                                NULL
#> 3                                 NULL                                NULL
#> 4                                 NULL                                NULL
#> 5                                 NULL                                NULL
#> 6                                   75                                  78
#>   abstract_inverted_index.waveforms. abstract_inverted_index.Second,
#> 1                               NULL                            NULL
#> 2                               NULL                            NULL
#> 3                               NULL                            NULL
#> 4                               NULL                            NULL
#> 5                               NULL                            NULL
#> 6                                 81                              82
#>   abstract_inverted_index.modification abstract_inverted_index.algorithms
#> 1                                 NULL                               NULL
#> 2                                 NULL                               NULL
#> 3                                 NULL                               NULL
#> 4                                 NULL                               NULL
#> 5                                 NULL                               NULL
#> 6                                   86                             87, 95
#>   abstract_inverted_index.reported. abstract_inverted_index.able
#> 1                              NULL                         NULL
#> 2                              NULL                         NULL
#> 3                              NULL                         NULL
#> 4                              NULL                         NULL
#> 5                              NULL                         NULL
#> 6                                93                           97
#>   abstract_inverted_index.modify abstract_inverted_index.sound
#> 1                           NULL                          NULL
#> 2                           NULL                          NULL
#> 3                           NULL                          NULL
#> 4                           NULL                          NULL
#> 5                           NULL                          NULL
#> 6                             99                 103, 110, 126
#>   abstract_inverted_index.styled. abstract_inverted_index.example,
#> 1                            NULL                             NULL
#> 2                            NULL                             NULL
#> 3                            NULL                             NULL
#> 4                            NULL                             NULL
#> 5                            NULL                             NULL
#> 6                             111                              114
#>   abstract_inverted_index.demonstrate abstract_inverted_index.modified
#> 1                                NULL                             NULL
#> 2                                NULL                             NULL
#> 3                                NULL                             NULL
#> 4                                NULL                             NULL
#> 5                                NULL                             NULL
#> 6                                 118                              124
#>   abstract_inverted_index.algorithms. abstract_inverted_index.>
#> 1                                NULL                      NULL
#> 2                                NULL                      NULL
#> 3                                NULL                      NULL
#> 4                                NULL                      NULL
#> 5                                NULL                      NULL
#> 6                                 132                       133
#>   abstract_inverted_index.A abstract_inverted_index.continuation
#> 1                      NULL                                 NULL
#> 2                      NULL                                 NULL
#> 3                      NULL                                 NULL
#> 4                      NULL                                 NULL
#> 5                      NULL                                 NULL
#> 6                      NULL                                 NULL
#>   abstract_inverted_index.authors' abstract_inverted_index.(1990)
#> 1                             NULL                           NULL
#> 2                             NULL                           NULL
#> 3                             NULL                           NULL
#> 4                             NULL                           NULL
#> 5                             NULL                           NULL
#> 6                             NULL                           NULL
#>   abstract_inverted_index.area abstract_inverted_index.emotionally
#> 1                         NULL                                NULL
#> 2                         NULL                                NULL
#> 3                         NULL                                NULL
#> 4                         NULL                                NULL
#> 5                         NULL                                NULL
#> 6                         NULL                                NULL
#>   abstract_inverted_index.defined abstract_inverted_index.which,
#> 1                            NULL                           NULL
#> 2                            NULL                           NULL
#> 3                            NULL                           NULL
#> 4                            NULL                           NULL
#> 5                            NULL                           NULL
#> 6                            NULL                           NULL
#>   abstract_inverted_index.many abstract_inverted_index.An
#> 1                         NULL                       NULL
#> 2                         NULL                       NULL
#> 3                         NULL                       NULL
#> 4                         NULL                       NULL
#> 5                         NULL                       NULL
#> 6                         NULL                       NULL
#>   abstract_inverted_index.algorithm abstract_inverted_index.automatically
#> 1                              NULL                                  NULL
#> 2                              NULL                                  NULL
#> 3                              NULL                                  NULL
#> 4                              NULL                                  NULL
#> 5                              NULL                                  NULL
#> 6                              NULL                                  NULL
#>   abstract_inverted_index.decouples abstract_inverted_index.segment
#> 1                              NULL                            NULL
#> 2                              NULL                            NULL
#> 3                              NULL                            NULL
#> 4                              NULL                            NULL
#> 5                              NULL                            NULL
#> 6                              NULL                            NULL
#>   abstract_inverted_index.Several abstract_inverted_index.applications
#> 1                            NULL                                 NULL
#> 2                            NULL                                 NULL
#> 3                            NULL                                 NULL
#> 4                            NULL                                 NULL
#> 5                            NULL                                 NULL
#> 6                            NULL                                 NULL
#>   abstract_inverted_index.decoupling abstract_inverted_index.discussed.
#> 1                               NULL                               NULL
#> 2                               NULL                               NULL
#> 3                               NULL                               NULL
#> 4                               NULL                               NULL
#> 5                               NULL                               NULL
#> 6                               NULL                               NULL
#>   abstract_inverted_index.particular, abstract_inverted_index.formant
#> 1                                NULL                            NULL
#> 2                                NULL                            NULL
#> 3                                NULL                            NULL
#> 4                                NULL                            NULL
#> 5                                NULL                            NULL
#> 6                                NULL                            NULL
#>   abstract_inverted_index.tracking abstract_inverted_index.superior
#> 1                             NULL                             NULL
#> 2                             NULL                             NULL
#> 3                             NULL                             NULL
#> 4                             NULL                             NULL
#> 5                             NULL                             NULL
#> 6                             NULL                             NULL
#>   abstract_inverted_index.traditional abstract_inverted_index.procedures
#> 1                                NULL                               NULL
#> 2                                NULL                               NULL
#> 3                                NULL                               NULL
#> 4                                NULL                               NULL
#> 5                                NULL                               NULL
#> 6                                NULL                               NULL
#>   abstract_inverted_index.described. abstract_inverted_index.Also,
#> 1                               NULL                          NULL
#> 2                               NULL                          NULL
#> 3                               NULL                          NULL
#> 4                               NULL                          NULL
#> 5                               NULL                          NULL
#> 6                               NULL                          NULL
#>   abstract_inverted_index.modifying abstract_inverted_index.removing
#> 1                              NULL                             NULL
#> 2                              NULL                             NULL
#> 3                              NULL                             NULL
#> 4                              NULL                             NULL
#> 5                              NULL                             NULL
#> 6                              NULL                             NULL
#>   abstract_inverted_index.some abstract_inverted_index.effects
#> 1                         NULL                            NULL
#> 2                         NULL                            NULL
#> 3                         NULL                            NULL
#> 4                         NULL                            NULL
#> 5                         NULL                            NULL
#> 6                         NULL                            NULL
#>   abstract_inverted_index.Abstract abstract_inverted_index.:
#> 1                             NULL                      NULL
#> 2                             NULL                      NULL
#> 3                             NULL                      NULL
#> 4                             NULL                      NULL
#> 5                             NULL                      NULL
#> 6                             NULL                      NULL
#>   abstract_inverted_index.document abstract_inverted_index.body
#> 1                             NULL                         NULL
#> 2                             NULL                         NULL
#> 3                             NULL                         NULL
#> 4                             NULL                         NULL
#> 5                             NULL                         NULL
#> 6                             NULL                         NULL
#>   abstract_inverted_index.conducted abstract_inverted_index.purpose
#> 1                              NULL                            NULL
#> 2                              NULL                            NULL
#> 3                              NULL                            NULL
#> 4                              NULL                            NULL
#> 5                              NULL                            NULL
#> 6                              NULL                            NULL
#>   abstract_inverted_index.improving abstract_inverted_index.performance
#> 1                              NULL                                NULL
#> 2                              NULL                                NULL
#> 3                              NULL                                NULL
#> 4                              NULL                                NULL
#> 5                              NULL                                NULL
#> 6                              NULL                                NULL
#>   abstract_inverted_index.(ASR) abstract_inverted_index.systems
#> 1                          NULL                            NULL
#> 2                          NULL                            NULL
#> 3                          NULL                            NULL
#> 4                          NULL                            NULL
#> 5                          NULL                            NULL
#> 6                          NULL                            NULL
#>   abstract_inverted_index.noisy, abstract_inverted_index.stressful
#> 1                           NULL                              NULL
#> 2                           NULL                              NULL
#> 3                           NULL                              NULL
#> 4                           NULL                              NULL
#> 5                           NULL                              NULL
#> 6                           NULL                              NULL
#>   abstract_inverted_index.environments. abstract_inverted_index.To
#> 1                                  NULL                       NULL
#> 2                                  NULL                       NULL
#> 3                                  NULL                       NULL
#> 4                                  NULL                       NULL
#> 5                                  NULL                       NULL
#> 6                                  NULL                       NULL
#>   abstract_inverted_index.accomplish abstract_inverted_index.this,
#> 1                               NULL                          NULL
#> 2                               NULL                          NULL
#> 3                               NULL                          NULL
#> 4                               NULL                          NULL
#> 5                               NULL                          NULL
#> 6                               NULL                          NULL
#>   abstract_inverted_index.avenues abstract_inverted_index.basic
#> 1                            NULL                          NULL
#> 2                            NULL                          NULL
#> 3                            NULL                          NULL
#> 4                            NULL                          NULL
#> 5                            NULL                          NULL
#> 6                            NULL                          NULL
#>   abstract_inverted_index.investigated. abstract_inverted_index.novel
#> 1                                  NULL                          NULL
#> 2                                  NULL                          NULL
#> 3                                  NULL                          NULL
#> 4                                  NULL                          NULL
#> 5                                  NULL                          NULL
#> 6                                  NULL                          NULL
#>   abstract_inverted_index.noise abstract_inverted_index.reduction
#> 1                          NULL                              NULL
#> 2                          NULL                              NULL
#> 3                          NULL                              NULL
#> 4                          NULL                              NULL
#> 5                          NULL                              NULL
#> 6                          NULL                              NULL
#>   abstract_inverted_index.developed. abstract_inverted_index.three
#> 1                               NULL                          NULL
#> 2                               NULL                          NULL
#> 3                               NULL                          NULL
#> 4                               NULL                          NULL
#> 5                               NULL                          NULL
#> 6                               NULL                          NULL
#>   abstract_inverted_index.robust abstract_inverted_index.removal,
#> 1                           NULL                             NULL
#> 2                           NULL                             NULL
#> 3                           NULL                             NULL
#> 4                           NULL                             NULL
#> 5                           NULL                             NULL
#> 6                           NULL                             NULL
#>   abstract_inverted_index.another abstract_inverted_index.least
#> 1                            NULL                          NULL
#> 2                            NULL                          NULL
#> 3                            NULL                          NULL
#> 4                            NULL                          NULL
#> 5                            NULL                          NULL
#> 6                            NULL                          NULL
#>   abstract_inverted_index.squares abstract_inverted_index.system
#> 1                            NULL                           NULL
#> 2                            NULL                           NULL
#> 3                            NULL                           NULL
#> 4                            NULL                           NULL
#> 5                            NULL                           NULL
#> 6                            NULL                           NULL
#>   abstract_inverted_index.identification, abstract_inverted_index.third
#> 1                                    NULL                          NULL
#> 2                                    NULL                          NULL
#> 3                                    NULL                          NULL
#> 4                                    NULL                          NULL
#> 5                                    NULL                          NULL
#> 6                                    NULL                          NULL
#>   abstract_inverted_index.distance abstract_inverted_index.measures.
#> 1                             NULL                              NULL
#> 2                             NULL                              NULL
#> 3                             NULL                              NULL
#> 4                             NULL                              NULL
#> 5                             NULL                              NULL
#> 6                             NULL                              NULL
#>   abstract_inverted_index.Third, abstract_inverted_index.methods
#> 1                           NULL                            NULL
#> 2                           NULL                            NULL
#> 3                           NULL                            NULL
#> 4                           NULL                            NULL
#> 5                           NULL                            NULL
#> 6                           NULL                            NULL
#>   abstract_inverted_index.characterizing abstract_inverted_index.parametrically
#> 1                                   NULL                                   NULL
#> 2                                   NULL                                   NULL
#> 3                                   NULL                                   NULL
#> 4                                   NULL                                   NULL
#> 5                                   NULL                                   NULL
#> 6                                   NULL                                   NULL
#>   abstract_inverted_index.Among abstract_inverted_index.descriptors
#> 1                          NULL                                NULL
#> 2                          NULL                                NULL
#> 3                          NULL                                NULL
#> 4                          NULL                                NULL
#> 5                          NULL                                NULL
#> 6                          NULL                                NULL
#>   abstract_inverted_index.various abstract_inverted_index.prosodic
#> 1                            NULL                             NULL
#> 2                            NULL                             NULL
#> 3                            NULL                             NULL
#> 4                            NULL                             NULL
#> 5                            NULL                             NULL
#> 6                            NULL                             NULL
#>   abstract_inverted_index.features, abstract_inverted_index.spectral
#> 1                              NULL                             NULL
#> 2                              NULL                             NULL
#> 3                              NULL                             NULL
#> 4                              NULL                             NULL
#> 5                              NULL                             NULL
#> 6                              NULL                             NULL
#>   abstract_inverted_index.characteristics. abstract_inverted_index.Fourth,
#> 1                                     NULL                            NULL
#> 2                                     NULL                            NULL
#> 3                                     NULL                            NULL
#> 4                                     NULL                            NULL
#> 5                                     NULL                            NULL
#> 6                                     NULL                            NULL
#>   abstract_inverted_index.improve abstract_inverted_index.ASR
#> 1                            NULL                        NULL
#> 2                            NULL                        NULL
#> 3                            NULL                        NULL
#> 4                            NULL                        NULL
#> 5                            NULL                        NULL
#> 6                            NULL                        NULL
#>   abstract_inverted_index.noisy abstract_inverted_index.or
#> 1                          NULL                       NULL
#> 2                          NULL                       NULL
#> 3                          NULL                       NULL
#> 4                          NULL                       NULL
#> 5                          NULL                       NULL
#> 6                          NULL                       NULL
#>   abstract_inverted_index.conditions. abstract_inverted_index.Results
#> 1                                NULL                            NULL
#> 2                                NULL                            NULL
#> 3                                NULL                            NULL
#> 4                                NULL                            NULL
#> 5                                NULL                            NULL
#> 6                                NULL                            NULL
#>   abstract_inverted_index.study abstract_inverted_index.derived
#> 1                          NULL                            NULL
#> 2                          NULL                            NULL
#> 3                          NULL                            NULL
#> 4                          NULL                            NULL
#> 5                          NULL                            NULL
#> 6                          NULL                            NULL
#>   abstract_inverted_index.general abstract_inverted_index.goal
#> 1                            NULL                         NULL
#> 2                            NULL                         NULL
#> 3                            NULL                         NULL
#> 4                            NULL                         NULL
#> 5                            NULL                         NULL
#> 6                            NULL                         NULL
#>   abstract_inverted_index.across abstract_inverted_index.inverse
#> 1                           NULL                            NULL
#> 2                           NULL                            NULL
#> 3                           NULL                            NULL
#> 4                           NULL                            NULL
#> 5                           NULL                            NULL
#> 6                           NULL                            NULL
#>   abstract_inverted_index.filtering abstract_inverted_index.tailored
#> 1                              NULL                             NULL
#> 2                              NULL                             NULL
#> 3                              NULL                             NULL
#> 4                              NULL                             NULL
#> 5                              NULL                             NULL
#> 6                              NULL                             NULL
#>   abstract_inverted_index.specifically abstract_inverted_index.under
#> 1                                 NULL                          NULL
#> 2                                 NULL                          NULL
#> 3                                 NULL                          NULL
#> 4                                 NULL                          NULL
#> 5                                 NULL                          NULL
#> 6                                 NULL                          NULL
#>   abstract_inverted_index.voiced abstract_inverted_index.performed.
#> 1                           NULL                               NULL
#> 2                           NULL                               NULL
#> 3                           NULL                               NULL
#> 4                           NULL                               NULL
#> 5                           NULL                               NULL
#> 6                           NULL                               NULL
#>   abstract_inverted_index.parameterized abstract_inverted_index.descriptors,
#> 1                                  NULL                                 NULL
#> 2                                  NULL                                 NULL
#> 3                                  NULL                                 NULL
#> 4                                  NULL                                 NULL
#> 5                                  NULL                                 NULL
#> 6                                  NULL                                 NULL
#>   abstract_inverted_index.resulting abstract_inverted_index.database
#> 1                              NULL                             NULL
#> 2                              NULL                             NULL
#> 3                              NULL                             NULL
#> 4                              NULL                             NULL
#> 5                              NULL                             NULL
#> 6                              NULL                             NULL
#>   abstract_inverted_index.allows abstract_inverted_index.very
#> 1                           NULL                         NULL
#> 2                           NULL                         NULL
#> 3                           NULL                         NULL
#> 4                           NULL                         NULL
#> 5                           NULL                         NULL
#> 6                           NULL                         NULL
#>   abstract_inverted_index.good abstract_inverted_index.characterization
#> 1                         NULL                                     NULL
#> 2                         NULL                                     NULL
#> 3                         NULL                                     NULL
#> 4                         NULL                                     NULL
#> 5                         NULL                                     NULL
#> 6                         NULL                                     NULL
#>   abstract_inverted_index.respect abstract_inverted_index.parameters.
#> 1                            NULL                                NULL
#> 2                            NULL                                NULL
#> 3                            NULL                                NULL
#> 4                            NULL                                NULL
#> 5                            NULL                                NULL
#> 6                            NULL                                NULL
#>   abstract_inverted_index.Specifically, abstract_inverted_index.unique
#> 1                                  NULL                           NULL
#> 2                                  NULL                           NULL
#> 3                                  NULL                           NULL
#> 4                                  NULL                           NULL
#> 5                                  NULL                           NULL
#> 6                                  NULL                           NULL
#>   abstract_inverted_index.profile abstract_inverted_index.will
#> 1                            NULL                         NULL
#> 2                            NULL                         NULL
#> 3                            NULL                         NULL
#> 4                            NULL                         NULL
#> 5                            NULL                         NULL
#> 6                            NULL                         NULL
#>   abstract_inverted_index.allow abstract_inverted_index.high
#> 1                          NULL                         NULL
#> 2                          NULL                         NULL
#> 3                          NULL                         NULL
#> 4                          NULL                         NULL
#> 5                          NULL                         NULL
#> 6                          NULL                         NULL
#>   abstract_inverted_index.identification abstract_inverted_index.task.
#> 1                                   NULL                          NULL
#> 2                                   NULL                          NULL
#> 3                                   NULL                          NULL
#> 4                                   NULL                          NULL
#> 5                                   NULL                          NULL
#> 6                                   NULL                          NULL
#>   abstract_inverted_index.iterative abstract_inverted_index.extract
#> 1                              NULL                            NULL
#> 2                              NULL                            NULL
#> 3                              NULL                            NULL
#> 4                              NULL                            NULL
#> 5                              NULL                            NULL
#> 6                              NULL                            NULL
#>   abstract_inverted_index.then abstract_inverted_index.applied
#> 1                         NULL                            NULL
#> 2                         NULL                            NULL
#> 3                         NULL                            NULL
#> 4                         NULL                            NULL
#> 5                         NULL                            NULL
#> 6                         NULL                            NULL
#>   abstract_inverted_index.displaying abstract_inverted_index.speech:
#> 1                               NULL                            NULL
#> 2                               NULL                            NULL
#> 3                               NULL                            NULL
#> 4                               NULL                            NULL
#> 5                               NULL                            NULL
#> 6                               NULL                            NULL
#>   abstract_inverted_index.soft, abstract_inverted_index.task
#> 1                          NULL                         NULL
#> 2                          NULL                         NULL
#> 3                          NULL                         NULL
#> 4                          NULL                         NULL
#> 5                          NULL                         NULL
#> 6                          NULL                         NULL
#>   abstract_inverted_index.loading abstract_inverted_index.while
#> 1                            NULL                          NULL
#> 2                            NULL                          NULL
#> 3                            NULL                          NULL
#> 4                            NULL                          NULL
#> 5                            NULL                          NULL
#> 6                            NULL                          NULL
#>   abstract_inverted_index.talker abstract_inverted_index.presented
#> 1                           NULL                              NULL
#> 2                           NULL                              NULL
#> 3                           NULL                              NULL
#> 4                           NULL                              NULL
#> 5                           NULL                              NULL
#> 6                           NULL                              NULL
#>   abstract_inverted_index.through abstract_inverted_index.headphones
#> 1                            NULL                               NULL
#> 2                            NULL                               NULL
#> 3                            NULL                               NULL
#> 4                            NULL                               NULL
#> 5                            NULL                               NULL
#> 6                            NULL                               NULL
#>   abstract_inverted_index.(Lombard abstract_inverted_index.effect).
#> 1                             NULL                             NULL
#> 2                             NULL                             NULL
#> 3                             NULL                             NULL
#> 4                             NULL                             NULL
#> 5                             NULL                             NULL
#> 6                             NULL                             NULL
#>   abstract_inverted_index.terms abstract_inverted_index.Typical
#> 1                          NULL                            NULL
#> 2                          NULL                            NULL
#> 3                          NULL                            NULL
#> 4                          NULL                            NULL
#> 5                          NULL                            NULL
#> 6                          NULL                            NULL
#>   abstract_inverted_index.examples abstract_inverted_index.waveforms,
#> 1                             NULL                               NULL
#> 2                             NULL                               NULL
#> 3                             NULL                               NULL
#> 4                             NULL                               NULL
#> 5                             NULL                               NULL
#> 6                             NULL                               NULL
#>   abstract_inverted_index.salient abstract_inverted_index.features
#> 1                            NULL                             NULL
#> 2                            NULL                             NULL
#> 3                            NULL                             NULL
#> 4                            NULL                             NULL
#> 5                            NULL                             NULL
#> 6                            NULL                             NULL
#>   abstract_inverted_index.each, abstract_inverted_index.shown,
#> 1                          NULL                           NULL
#> 2                          NULL                           NULL
#> 3                          NULL                           NULL
#> 4                          NULL                           NULL
#> 5                          NULL                           NULL
#> 6                          NULL                           NULL
#>   abstract_inverted_index.qualitative abstract_inverted_index.discussion
#> 1                                NULL                               NULL
#> 2                                NULL                               NULL
#> 3                                NULL                               NULL
#> 4                                NULL                               NULL
#> 5                                NULL                               NULL
#> 6                                NULL                               NULL
#>   abstract_inverted_index.It abstract_inverted_index.concluded
#> 1                       NULL                              NULL
#> 2                       NULL                              NULL
#> 3                       NULL                              NULL
#> 4                       NULL                              NULL
#> 5                       NULL                              NULL
#> 6                       NULL                              NULL
#>   abstract_inverted_index.extracting abstract_inverted_index.filtering,
#> 1                               NULL                               NULL
#> 2                               NULL                               NULL
#> 3                               NULL                               NULL
#> 4                               NULL                               NULL
#> 5                               NULL                               NULL
#> 6                               NULL                               NULL
#>   abstract_inverted_index.time-consuming, abstract_inverted_index.gives
#> 1                                    NULL                          NULL
#> 2                                    NULL                          NULL
#> 3                                    NULL                          NULL
#> 4                                    NULL                          NULL
#> 5                                    NULL                          NULL
#> 6                                    NULL                          NULL
#>   abstract_inverted_index.reasonable abstract_inverted_index.results.
#> 1                               NULL                             NULL
#> 2                               NULL                             NULL
#> 3                               NULL                             NULL
#> 4                               NULL                             NULL
#> 5                               NULL                             NULL
#> 6                               NULL                             NULL
#>   abstract_inverted_index.utterances, abstract_inverted_index.waveshape
#> 1                                NULL                              NULL
#> 2                                NULL                              NULL
#> 3                                NULL                              NULL
#> 4                                NULL                              NULL
#> 5                                NULL                              NULL
#> 6                                NULL                              NULL
#>   abstract_inverted_index.present
#> 1                            NULL
#> 2                            NULL
#> 3                            NULL
#> 4                            NULL
#> 5                            NULL
#> 6                            NULL
```
