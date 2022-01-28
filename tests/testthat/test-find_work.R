test_that("id for results from work matches initial id", {

  work_df <- find_work(id_type = "doi", id = "https://doi.org/10.7717/peerj.4375")

  expect_equal("https://doi.org/10.7717/peerj.4375",
               work_df$doi)
})

test_that("returns tibble", {
  expect_true(tibble::is_tibble(find_work(id_type = "doi", id = "https://doi.org/10.7717/peerj.4375")))
})
