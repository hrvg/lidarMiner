# `lidarMiner`

## Purpose

Lidar datasets provide topography at high resolution, usually 1-3 meters.
With this increased resolution comes a data management challenge as downloading these datasets is somewhat cumbersome.
In addition, for use at specific locations only, the entire dataset might not be required, only the data nearby the spatial footprint of the studied objects.
The `lidarMiner` package addresses this issues by mining the metadata available from USGS to return the URLs of selected lidar tiles.

## How to install

```
# Install development version from GitHub
devtools::install_github("hrvg/lidarMiner")
```

## How to use

Check out the [package's vignette to get started](articles/getting-started.html).