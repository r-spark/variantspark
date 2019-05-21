Sys.setenv("R_TESTS" = "")
library(testthat)
library(variantspark)
library(sparklyr)

spark_versions <- spark_available_versions()

if (!any(spark_versions == "2.4")) spark_install(version = "2.4.0")
if (!any(spark_versions == "2.3")) spark_install(version = "2.3.2")
if (!any(spark_versions == "2.2")) spark_install(version = "2.2.1")

test_check("variantspark")
