#' Extract the importance data frame
#' 
#' This function extracts the importance data frame from the Importance Analysis 
#' jobj. 
#' 
#' @param importance A jobj from the class \code{ImportanceAnalysis}, usually the 
#' output of \code{vs_importance_analysis()}.
#' @param name The name to assign to the copied table in Spark.
#'
#' @export
importance_tbl <- function(importance, name = "importance_tbl"){
  importance %>% 
    sparklyr::invoke("variableImportance") %>% 
    sparklyr::sdf_register()
}