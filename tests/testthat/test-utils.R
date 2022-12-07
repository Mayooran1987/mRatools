test_that("mRatools packages returns character vector of package names", {
  out <- mRatools_packages()
  expect_type(out, "character")
  expect_true("grabsampling" %in% out)
})

