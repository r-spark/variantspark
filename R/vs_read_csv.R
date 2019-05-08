#' Reading a CSV file
#'
#' The \code{vs_read_csv()} reads a CSV file format and returns a \code{jobj} 
#' object from \code{CsvFeatureSource} scala class. 
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
#' hipster_labels <- vs_read_csv(vsc, "data/hipster_labels.txt")
#' 
#' hipster_labels 
#' }
#'
#' @export
vs_read_csv <- function(vsc, path){
  default_csv_format <- sparklyr::invoke_new(vsc$connection,
                                             "au.csiro.variantspark.input.DefaultCSVFormatSpec")
  sparklyr::invoke(vsc, "importCSV", path, default_csv_format)
}