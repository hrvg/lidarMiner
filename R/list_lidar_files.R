#' Provides a list of all lidar files in a given dir
#' @param dir file.path
#' @return A list of files in dir
#' @export
list_lidar_files <- function(dir = "./data/"){
	lf <- list.files(dir, pattern = ".xml", recursive = TRUE, full.names = TRUE)
	return(lf)
}