Sys.setenv("R_TESTS" = "")
library(testthat)
library(variantspark)
library(sparklyr)

spark_install(version = "2.4.0")
spark_install(version = "2.3.2")
spark_install(version = "2.2.1")

test_check("variantspark")
