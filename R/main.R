#' @export
vs_context <- function(sc){
  sparklyr::invoke_new(sc, "au.csiro.variantspark.api.VSContext", spark_session(sc))
}

#' @export
vs_read_vcf <- function(vsc, path){
    sparklyr::invoke(vsc, "importVCF", path, 0L)
}

#' @export
vs_read_csv <- function(vsc, path){
  default_csv_format <- sparklyr::invoke_new(vsc$connection,
                                             "au.csiro.variantspark.input.DefaultCSVFormatSpec")
  sparklyr::invoke(vsc, "importCSV", path, default_csv_format)
}

#' @export
sample_names <- function(vcf, n_samples = NULL){
  names <- sparklyr::invoke(vcf, "sampleNames")
  
  if (!is.null(n_samples)){
    names <- sparklyr::invoke(names, "take", as.integer(n_samples))  
  }
  names
}

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

#' @export
importance_tbl <- function(importance, name = "importance_tbl"){
  importance %>% 
    sparklyr::invoke("variableImportance") %>% 
    sparklyr::sdf_register()
}



