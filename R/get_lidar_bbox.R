#' Extract a SpatialPolygon data.frame from the lidar data.frame.
#' @param lidar_df A data.frame with columns name, networkr, westbc, eastbc, northbc, southbc
#' @return A SpatialPolygonsDataFrame
#' @importFrom magrittr %>%
#' @export
get_lidar_bbox <- function(lidar_df){
	foo <- function(x, y){
		latlong <- "+init=epsg:4326"
		coords <- rbind(
				c(x$eastbc,x$southbc),
				c(x$westbc,x$southbc),
				c(x$westbc,x$northbc),
				c(x$eastbc,x$northbc),
				c(x$eastbc,x$southbc)
		)
		bboxPolygon <- sp::Polygon(coords) 
		bboxPolygons <- sp::Polygons(list(bboxPolygon), ID = x$id)
		bboxSpatialPolygons <- sp::SpatialPolygons(list(bboxPolygons), 
			proj4string = sp::CRS(latlong))
		bboxSpatialPolygons$networkr <- y$networkr
		return(bboxSpatialPolygons)		
	}	
	lidar_bbox <- lidar_df %>% 
		dplyr::mutate(id = row.names(lidar_df)) %>%
		dplyr::group_by(networkr) %>%
		dplyr::group_map(~ foo(.x, .y))
	return(do.call(rbind, lidar_bbox))
}