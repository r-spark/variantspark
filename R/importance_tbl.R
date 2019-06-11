#' Extract the importance data frame
#' 
#' This function extracts the importance data frame from the Importance Analysis 
#' jobj. 
#' 
#' @param importance A jobj from the class \code{ImportanceAnalysis}, usually the 
#' output of \code{vs_importance_analysis()}.
#' @param name The name to assign to the copied table in Spark.
#'
#' @examples 
#' \dontrun{
#' library(sparklyr)
#' sc <- spark_connect(master = "local")
#' vsc <- vs_connect(sc)
#' 
#' hipster_vcf <- vs_read_vcf(vsc, 
#'                            system.file("extdata/hipster.vcf.bz2",
#'                                        package = "variantspark"))
#' labels <- vs_read_labels(vsc, 
#'                          system.file("extdata/hipster_labels.txt",
#'                                       package = "variantspark"))
#' 
#' importance <- vs_importance_analysis(vsc, hipster_vcf, labels, 10)
#' importance_tbl(importance)
#' }
#'
#' @export
importance_tbl <- function(importance, name = "importance_tbl"){
  importance %>% 
    sparklyr::invoke("variableImportance") %>% 
    sparklyr::sdf_register()
}