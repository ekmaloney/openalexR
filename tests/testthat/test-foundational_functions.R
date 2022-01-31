test_that("number of pages is correct", {

  res <- openalex_api("https://api.openalex.org/concepts?filter=level:0")

  expect_equal(get_number_of_pages(res),
               1)
})

test_that("Get data function is returning something", {
  expect_false(is.null(get_data_from_page("https://api.openalex.org/concepts?filter=level:0")))
})

