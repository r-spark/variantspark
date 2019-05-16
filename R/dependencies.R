spark_dependencies <- function(spark_version, scala_version, ...) {
  sparklyr::spark_dependency(
    packages = c("au.csiro.aehrc.variant-spark:variant-spark_2.11:0.2.0-a1"),
    repositories = c(
      "https://mvnrepository.com/artifact/",
      "http://central.maven.org/maven2/"
                     )
  )
}

#' @import sparklyr
.onLoad <- function(libname, pkgname) {
  sparklyr::register_extension(pkgname)
}
