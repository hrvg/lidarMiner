context("Checking class")

files_list <- list_lidar_files(system.file("extdata", package = "lidarMiner"))
test_that("files_list is a list of character", {
  expect_is(files_list, "character")
})

lidar_df <- get_lidar_df(files_list)
test_that("lidar_df is a data.frame", {
  expect_is(lidar_df, "data.frame")
})

test_that("lidar_df columns have the right class", {
  expect_equal(unname(sapply(lidar_df, class)), c("character", "character", "numeric", "numeric", "numeric", "numeric"))
})

lidar_bbox <- get_lidar_bbox(lidar_df)
test_that("lidar_bbox is a SpatialPolygonDataFrame", {
  expect_is(lidar_bbox, "SpatialPolygonsDataFrame")
})