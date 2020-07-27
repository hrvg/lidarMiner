#' This function extracts the bounding box for each xml files in a list of files
#' @param files_list a list of file.path
#' @return a data.frame with columns name, networkr, westbc, eastbc, northbc, southbc
get_lidar_df <- function(files_list){
	lidar_df <- foreach(f = files_list, .combine = rbind) %do% {
		x <- xml2::read_xml(f)
		attrs <- c("title", "networkr", "westbc", "eastbc", "northbc", "southbc")
		attr_df <- sapply(attrs, function(attr) xml2::xml_find_all(x, paste0(".//", attr)) %>% xml2::xml_text()) %>% t() %>%
		as.data.frame()
		attr_df
	} %>%
	dplyr::mutate_all(~ as.character(.)) %>%
	dplyr::mutate_at(dplyr::vars(dplyr::contains("bc")), as.numeric)
	return(lidar_df)
}
