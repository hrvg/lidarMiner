#' Provide a list of all lidar files in a given dir
list_lidar_files <- function(dir = "./data/"){
	lf <- list.files(dir, pattern = ".xml", recursive = TRUE, full.names = TRUE)
	return(lf)
}