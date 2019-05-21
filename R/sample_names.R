#' Display sample names
#' 
#' This function display the first N variant names.
#' 
#' @param vcf_source An object with \code{VCFFeatureSource} class, usually the 
#' output of the \code{vs_read_vcf()}.
#' @param n_samples The number os samples to display.
#' 
#' @return spark_jobj, shell_jobj
#' 
#' @examples 
#' \dontrun{
#' library(sparklyr)
#' 
#' sc <- spark_connect(master = "local")
#' vsc <- vs_connect(sc)
#' 
#' hipster_vcf <- vs_read_vcf(vsc, "inst/extdata/hipster.vcf.bz2")
#' sample_names(hipster_vcf, 3)
#' }
#'
#' @export
sample_names <- function(vcf_source, n_samples = NULL){
  names <- sparklyr::invoke(vcf_source, "sampleNames")
  
  if (!is.null(n_samples)){
    names <- sparklyr::invoke(names, "take", as.integer(n_samples))  
  }
  names
}







