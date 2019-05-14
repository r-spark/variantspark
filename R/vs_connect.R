#' Creating a variantspark connection
#' 
#' You need to create a variantspark connection to use this extension. To do this, 
#' you pass as argument a spark connection that you can create 
#' using \code{sparklyr::spark_connect()}. 
#' 
#' @param sc A spark connection.
#' 
#' @return A variantspark connection
#' 
#' @examples 
#' \dontrun{
#' library(sparklyr)
#' sc <- spark_connect(master = "local")
#' vsc <- vs_connect(sc)
#' }
#'
#' @export
vs_connect <- function(sc){
  sparklyr::invoke_new(sc, "au.csiro.variantspark.api.VSContext", spark_session(sc))
}