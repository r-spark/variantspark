#' Importance Analysis
#' 
#' This function performs an Importance Analysis using random forest algorithm.
#' For more details, please look at
#' \href{https://variantspark.readthedocs.io/en/latest/overview.html#importance-analysis}{here}.
#' 
#' @param vsc A variantspark connection.
#' @param vcf_source An object with \code{VCFFeatureSource} class, usually the 
#' output of the \code{vs_read_vcf()}.
#' @param labels An object with \code{CsvLabelSource}  class, usually the output 
#' of the \code{vs_read_labels()}.
#' @param n_trees The number of trees using in the random forest.
#' 
#' @return spark_jobj, shell_jobj
#' 
#' @examples 
#' \dontrun{
#' library(sparklyr)
#' sc <- spark_connect(master = "local", version = "2.2.0")
#' vsc <- vs_connect(sc)
#' 
#' hipster_vcf <- vs_read_vcf(vsc, "data/hipster.vcf.bz2")
#' labels <- vs_read_labels(vsc, "data/hipster_labels.txt")
#' 
#' vs_importance_analysis(vsc, hipster_vcf, labels, 10)
#' }
#'
#' @export
vs_importance_analysis <- function(vsc, vcf_source, labels, n_trees){
  rf_param <- invoke_static(vsc$connection, 
                            "au.csiro.variantspark.api.ImportanceAnalysis",
                            "defaultRFParams")
  
  sparklyr::invoke_new(vsc$connection, 
                       "au.csiro.variantspark.api.ImportanceAnalysis",
                       invoke(vsc, "sqlContext"),
                       vcf_source, labels,
                       rf_param, as.integer(n_trees), 100L, 3L)
}