[![Build Status](https://travis-ci.com/hrvg/lidarMiner.svg?token=Dx1gYTrTiuxgW9Sq3s3q&branch=master)](https://travis-ci.com/hrvg/lidarMiner)

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

It is also likely you'll need to install the latest `terra` or `raster` version which has dependencies on GDAL (>= 3.0.0), GEOS (>= 3.3.0) and Proj.4 (>= 6.0.0).

On Linux, you can do:

```
sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
sudo apt-get -q update
sudo apt-get -y install libgdal-dev libgeos-dev libproj-dev 
```

The `terra` [github page](https://github.com/rspatial/terra) has some insights for other operating systems.

## How to use

Check out the [package's vignette to get started](articles/lidarMiner.html).