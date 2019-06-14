installed_versions <- function(){
  nrow(sparklyr::spark_installed_versions())
}

