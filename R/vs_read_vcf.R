#' Reading a VCF file
#'
#' The Variant Call Format (VCF) specifies the format of a text file used in 
#' bioinformatics for storing gene sequence variations. The format has been developed 
#' with the advent of large-scale genotyping and DNA sequencing projects, such as 
#' the 1000 Genomes Project. The \code{vs_read_vcf()} reads this format and returns
#' a \code{jobj} object from \code{VCFFeatureSource} scala class.
#' 
#' @param vsc A variantspark connection.
#' @param path The file's path.
#' 
#' @return spark_jobj, shell_jobj
#'
#' @examples  
#' \dontrun{
#' library(sparklyr)
#' 
#' sc <- spark_connect(master = "local")
#' vsc <- vs_context(sc)
#' 
#' hipster_vcf <- vs_read_vcf(vsc, "inst/extdata/hipster.vcf.bz2")
#' 
#' hipster_vcf
#' 
#' }
#'
#' @export
vs_read_vcf <- function(vsc, path){
  sparklyr::invoke(vsc, "importVCF", path, 0L)
}