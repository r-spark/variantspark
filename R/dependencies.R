spark_dependencies <- function(spark_version, scala_version, ...) {
  sparklyr::spark_dependency(
    jars = c(
      system.file(
        sprintf("java/hail.comparison-%s-%s.jar", spark_version, scala_version),
        package = "hail.comparison"
      ),
      system.file(
        sprintf("java/variant-spark_2.11-0.2.0-a1.jar"),
        package = "hail.comparison"
      ),
      system.file(
        sprintf("java/scala-csv_2.11-1.2.2.jar"),
        package = "hail.comparison"
        ),
      system.file(
        sprintf("java/htsjdk-2.14.0.jar"),
        package = "hail.comparison"
      ),
      system.file(
        sprintf("java/dsiutils-2.5.4.jar"),
        package = "hail.comparison"
      ),
      system.file(
        sprintf("java/fastutil-7.1.0.jar"),
        package = "hail.comparison"
      )     
    ),
    packages = c(
    )
  )
}

#' @import sparklyr
.onLoad <- function(libname, pkgname) {
  sparklyr::register_extension(pkgname)
}
