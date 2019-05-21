#' Reading labels
#' 
#' This function reads only the label column of a CSV file and returns a \code{jobj} 
#' object from \code{CsvLabelSource} scala class.
#'
#' @param vsc A variantspark connection.
#' @param path The file's path.
#' @param label A string with the label column name.
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
#' labels <- vs_read_labels(vsc, "inst/extdata/hipster_labels.txt")
#' labels 
#' }
#' @export
vs_read_labels <- function(vsc, path, label = "label"){
  sparklyr::invoke(vsc, "loadLabel", path, label)
}
