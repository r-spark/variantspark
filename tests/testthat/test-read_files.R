context("Read files")

installed_versions <- nrow(sparklyr::spark_installed_versions())
if (installed_versions != 0){
  # create connection for the tests
  sc <- sparklyr::spark_connect(master = "local")
  vsc <- vs_connect(sc)
}

test_that("Read VCF", {
  skip_on_cran()
  skip_if(installed_versions == 0)
  
  hipster_vcf <- vs_read_vcf(vsc, 
                             system.file("extdata/hipster.vcf.bz2",
                                         package = "variantspark"))

  vcf_class <- invoke(hipster_vcf, "toString")

  expect_true(grepl("VCFFeatureSource",vcf_class))
})

test_that("Read CSV", {
  skip_on_cran()
  skip_if(installed_versions == 0)

  hipster_labels <- vs_read_csv(vsc, 
                                system.file("extdata/hipster_labels.txt",
                                            package = "variantspark"))
  
  csv_class <- invoke(hipster_labels, "toString")
  
  expect_true(grepl("CsvFeatureSource",csv_class))
})

test_that("Read labels", {
  skip_on_cran()
  skip_if(installed_versions == 0)

  labels <- vs_read_labels(vsc, 
                           system.file("extdata/hipster_labels.txt",
                                            package = "variantspark")) 
  label_class <- invoke(labels, "toString")
  
  expect_true(grepl("CsvLabelSource",label_class))
})
