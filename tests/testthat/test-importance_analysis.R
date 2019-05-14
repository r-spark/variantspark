context("importance analysis")

test_that("importance_tbl", {
  skip_on_cran()

  sc <- sparklyr::spark_connect(master = "local")
  vsc <- vs_connect(sc)
  browser()
  
  hipster_vcf <- vs_read_vcf(vsc, 
                             system.file("extdata/hipster.vcf.bz2",
                                         package = "variantspark"))
  
  labels <- vs_read_labels(vsc, 
                           system.file("extdata/hipster_labels.txt",
                                       package = "variantspark"))
  
  importance <- vs_importance_analysis(vsc, hipster_vcf, labels, n_trees = 10)
  importance_tbl <- importance_tbl(importance) 
  df <- sparklyr::collect(importance_tbl)
  
  testthat::expect_equal(c(nrow(df), ncol(df)), c(17010, 2))
})