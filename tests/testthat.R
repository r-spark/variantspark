Sys.setenv("R_TESTS" = "")
library(testthat)
library(variantspark)
library(sparklyr)

if (identical(Sys.getenv("NOT_CRAN"), "true")) {
  # enforce all configuration settings are described
  options(sparklyr.test.enforce.config = TRUE)
}

if (!grepl("WINDOWS", Sys.getenv("SystemRoot"))){
  spark_install(version = "2.4.0")
  spark_install(version = "2.3.2")
  spark_install(version = "2.2.1")
  test_check("variantspark")
}


