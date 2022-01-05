test_that("number of pages is correct", {
  expect_equal(get_number_of_pages("https://api.openalex.org/concepts?filter=level:1"),
               1)
})

test_that("Get data function is returning something", {
  expect_false(is.null(get_data_from_page("https://api.openalex.org/concepts?filter=level:1")))
})

test_that("Get all data for query returns something", {
  expect_false(is.null(get_all_data_for_query("https://api.openalex.org/concepts?filter=level:1",
                                              1)))
})
