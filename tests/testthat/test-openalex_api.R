test_that("API function fails when bad call", {
  expect_error(openalex_api("https://api.openalex.org/works?filter=concepts.id=C121955636&group_by=is_retracted"))
})

test_that("API function fails when bad call", {
  expect_error(openalex_api("https://api.openalex.org/works?filter=author.id:A1111111111"))
})

