#' merge all lidar raster
#' @param lidar_dir a file.path to a directory containing tiled lidar rasters
#' @importFrom magrittr %>%
#' @export
merge_lidar_rasters <- function(lidar_dir = file.path("G:/USGS_lidar")){
	path <- xmin <- xmax <- ymin <- ymax <- NULL
	out_dir <- file.path(lidar_dir, "out")
	if (!dir.exists(out_dir)) dir.create(out_dir)
	raster_paths <- list.files(lidar_dir, full.names = TRUE, pattern = ".tif")
	rasters <- lapply(raster_paths, raster::raster)
	xt <- lapply(rasters, function(r){
		xt <- raster::extent(r)
		data.frame(xmin = xt@xmin, xmax = xt@xmax, ymin = xt@ymin, ymax = xt@ymax)
	}) %>% 
		dplyr::bind_rows() %>%
		dplyr::summarize(xmin = min(xmin), xmax = max(xmax), ymin = min(ymin), ymax = max(ymax)) %>%
		as.numeric()
	template <- raster::raster(raster::extent(xt))
	raster::projection(template) <- as.character(raster::crs(rasters[[1]]))
	out_path <- file.path(out_dir, paste0("lidar_raster.tif"))
	raster::writeRaster(template, file = out_path, format = "GTiff", overwrite = TRUE)
	gdalUtils::mosaic_rasters(gdalfile = raster_paths, dst_dataset = out_path, of = "GTiff")
}