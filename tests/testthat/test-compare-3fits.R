test_that("Compare3ProperRocFits", {
  
  skip_on_cran()
  skip_on_travis()
  
  fn <- paste0(test_path(), '/goodValues/Compare3ProperRocFits01.rds')
  good_vals <- readRDS(fn)
  test_vals <- Compare3ProperRocFits(1,1,reAnalyze = TRUE)
  expect_equal(good_vals,test_vals,tolerance=0.00001)
  
  fn <- paste0(test_path(), '/goodValues/Compare3ProperRocFits02.rds')
  good_vals <- readRDS(fn)
  test_vals <- Compare3ProperRocFits(3,3,reAnalyze = TRUE)
  expect_equal(good_vals,test_vals,tolerance=0.00001)

})

