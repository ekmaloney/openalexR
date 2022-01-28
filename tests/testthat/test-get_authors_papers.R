test_that("Get Authors Papers returns something", {
  expect_false(is.null(get_authors_papers(id_type = "openalex",
                                          id = "A2941293769")))
})

test_that("Get Authors Papers is returning only papers that have that author",{
  q <- get_authors_papers(id_type = "openalex", id = "A2941293769") %>%
    tidyr::unnest(authorships) %>%
    dplyr::group_by(id) %>%
    dplyr::mutate(correct_author = any(author$id == paste0("https://openalex.org/",
                                                    "A2941293769")))

  expect_equal(sum(q$correct_author)/nrow(q), 1)
})

