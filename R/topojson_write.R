#' Write TopoJSON from various inputs
#' 
#' `topojson_write()` is temporarily defunct; check back later
#'
#' @export
#' @inheritParams geojson_write
#' @param object_name (character) name to give to the TopoJSON object created.
#' Default: "foo"
#' @param quantization (numeric) quantization parameter, use this to
#' quantize geometry prior to computing topology. Typical values are powers of 
#' ten (`1e4`, `1e5`, ...), default is `0` to not perform quantization.
#' For more information about quantization, see this by Mike Bostock
#' https://stackoverflow.com/questions/18900022/topojson-quantization-vs-simplification/18921214#18921214
#' @return A `topojson_write` class, with two elements:
#' 
#' - path: path to the file with the TopoJSON
#' - type: type of object the TopoJSON came from, e.g., SpatialPoints
#' 
#' @seealso [geojson_write()], [topojson_read()]
#' @details Under the hood we simply wrap [geojson_write()], then
#' take the GeoJSON output of that operation, then convert to TopoJSON with
#' [geo2topo()], then write to disk.
#'
#' Unfortunately, this process requires a number of round trips to disk, so
#' speed ups will hopefully come soon.
#'
#' Any intermediate geojson files are cleaned up (deleted).
topojson_write <- function(input, lat = NULL, lon = NULL, geometry = "point",
                           group = NULL, file = "myfile.topojson",
                           overwrite = TRUE, precision = NULL,
                           convert_wgs84 = FALSE, crs = NULL, 
                           object_name = "foo", quantization = 0, ...) {
  # UseMethod("topojson_write")
  .Defunct(msg = "topojson_write is temporarily defunct; check back later")
}

topojson_write.default <- function(input, lat = NULL, lon = NULL, geometry = "point",
                                           group = NULL, file = "myfile.topojson",
                                           overwrite = TRUE, precision = NULL,
                                           convert_wgs84 = FALSE, crs = NULL, 
                                           object_name = "foo", quantization = 0, ...) {
  stop("no 'topojson_write' method for ", class(input), call. = FALSE)
}

topojson_write.SpatialPolygons <- function(input, lat = NULL, lon = NULL, geometry = "point",
                                           group = NULL, file = "myfile.topojson",
                                           overwrite = TRUE, precision = NULL,
                                           convert_wgs84 = FALSE, crs = NULL, 
                                           object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialPolygons", object_name = object_name,
            quantization = quantization, ...)
}

topojson_write.SpatialPolygonsDataFrame <- function(input, lat = NULL, lon = NULL, geometry = "point",
                                                    group = NULL, file = "myfile.topojson",
                                                    overwrite = TRUE, precision = NULL,
                                                    convert_wgs84 = FALSE, crs = NULL, 
                                                    object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialPolygonsDataFrame", object_name = object_name, 
            quantization = quantization, ...)
}

topojson_write.SpatialPoints <- function(input, lat = NULL, lon = NULL, geometry = "point",
                                         group = NULL, file = "myfile.topojson",
                                         overwrite = TRUE, precision = NULL,
                                         convert_wgs84 = FALSE, crs = NULL, 
                                         object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialPoints", object_name = object_name, 
            quantization = quantization, ...)
}

topojson_write.SpatialPointsDataFrame <- function(input, lat = NULL, lon = NULL, geometry = "point",
                                                  group = NULL, file = "myfile.topojson",
                                                  overwrite = TRUE, precision = NULL,
                                                  convert_wgs84 = FALSE, crs = NULL, 
                                                  object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialPointsDataFrame", object_name = object_name,
            quantization = quantization, ...)
}

topojson_write.SpatialLines <- function(input, lat = NULL, lon = NULL, geometry = "point",
                                        group = NULL, file = "myfile.topojson",
                                        overwrite = TRUE, precision = NULL,
                                        convert_wgs84 = FALSE, crs = NULL, 
                                        object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialLines", object_name = object_name,
            quantization = quantization, ...)
}

topojson_write.SpatialLinesDataFrame <- function(input, lat = NULL, lon = NULL, geometry = "point",
                                                 group = NULL, file = "myfile.topojson",
                                                 overwrite = TRUE, precision = NULL,
                                                 convert_wgs84 = FALSE, crs = NULL, 
                                                 object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialLinesDataFrame", object_name = object_name, 
            quantization = quantization, ...)
}

topojson_write.SpatialGrid <- function(input, lat = NULL, lon = NULL, geometry = "point",
  group = NULL, file = "myfile.topojson", overwrite = TRUE, precision = NULL,
  convert_wgs84 = FALSE, crs = NULL, object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialGrid", object_name = object_name, 
            quantization = quantization, ...)
}

topojson_write.SpatialGridDataFrame <- function(input, lat = NULL, lon = NULL,
  geometry = "point", group = NULL, file = "myfile.topojson",
  overwrite = TRUE, precision = NULL, convert_wgs84 = FALSE, crs = NULL, 
  object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialGridDataFrame", object_name = object_name, 
            quantization = quantization, ...)
}

topojson_write.SpatialPixels <- function(input, lat = NULL, lon = NULL, geometry = "point",
                                        group = NULL, file = "myfile.topojson",
                                        overwrite = TRUE, precision = NULL,
                                        convert_wgs84 = FALSE, crs = NULL, 
                                        object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialPixelsDataFrame", object_name = object_name, 
            quantization = quantization, ...)
}

topojson_write.SpatialPixelsDataFrame <- function(input, lat = NULL, lon = NULL, geometry = "point",
                                                 group = NULL, file = "myfile.topojson",
                                                 overwrite = TRUE, precision = NULL,
                                                 convert_wgs84 = FALSE, crs = NULL, 
                                                 object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialPixelsDataFrame", object_name = object_name, quantization = quantization, ...)
}

## spatial classes from rgeos -----------------
topojson_write.SpatialRings <- function(input, lat = NULL, lon = NULL, geometry = "point",
                                       group = NULL, file = "myfile.topojson",
                                       overwrite = TRUE, precision = NULL,
                                       convert_wgs84 = FALSE, crs = NULL, 
                                       object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialRings", object_name = object_name, quantization = quantization, ...)
}

topojson_write.SpatialRingsDataFrame <- function(input, lat = NULL, lon = NULL,
  geometry = "point", group = NULL, file = "myfile.topojson", overwrite = TRUE,
  precision = NULL, convert_wgs84 = FALSE, crs = NULL, object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, precision = precision,
            convert_wgs84 = convert_wgs84, crs = crs,
            class = "SpatialRingsDataFrame", object_name = object_name, quantization = quantization, ...)
}

topojson_write.SpatialCollections <- function(input, lat = NULL, lon = NULL,
  geometry = "point", group = NULL, file = "myfile.topojson", overwrite = TRUE,
  precision = NULL, convert_wgs84 = FALSE, crs = NULL, object_name = "foo", quantization = 0, ...) {

  tmp <- suppressMessages(
    geojson_write(input, lat, lon, geometry, group,
                  sub("\\.topojson|\\.json", "\\.geojson", file),
                  overwrite, precision, convert_wgs84, crs, ...))
  structure(lapply(tmp, function(z) {
    on.exit(unlink(z$path), add = TRUE)
    if (!is.null(z)) {
      topo_file(
        write_topojson(
          geo2topo(paste0(readLines(z$path), collapse = ""), object_name, quantization),
          sub("\\.geojson|\\.json", "\\.topojson", z$path)
        ),
        z$type
      )
    }
  }), class = "spatialcoll")
}

## normal R classes -----------------
topojson_write.numeric <- function(input, lat = NULL, lon = NULL, geometry = "point",
  group = NULL, file = "myfile.topojson", overwrite = TRUE, precision = NULL, 
  convert_wgs84 = FALSE, crs = NULL, object_name = "foo", quantization = 0, ...) {

  sp_helper(input, lat = lat, lon = lon, geometry = geometry,
            file = file, precision = precision, overwrite = overwrite,
            class = "numeric", object_name = object_name, quantization = quantization, ...)
}

topojson_write.data.frame <- function(input, lat = NULL, lon = NULL, geometry = "point",
  group = NULL, file = "myfile.topojson", overwrite = TRUE, precision = NULL, 
  convert_wgs84 = FALSE, crs = NULL, object_name = "foo", quantization = 0, ...) {

  sp_helper(input, lat = lat, lon = lon, geometry = geometry, group = group,
            file = file, precision = precision, overwrite = overwrite,
            class = "data.frame", object_name = object_name, quantization = quantization, ...)
}

topojson_write.list <- function(input, lat = NULL, lon = NULL, geometry="point",
  group = NULL, file = "myfile.topojson", overwrite = TRUE, precision = NULL, 
  convert_wgs84 = FALSE, crs = NULL, object_name = "foo", quantization = 0, ...) {

  sp_helper(input, lat = lat, lon = lon, geometry = geometry, group = group,
            file = file, precision = precision, overwrite = overwrite,
            class = "list", object_name = object_name, quantization = quantization, ...)
}

topojson_write.geo_list <- function(input, lat = NULL, lon = NULL, geometry = "point",
  group = NULL, file = "myfile.topojson", overwrite = TRUE, precision = NULL, 
  convert_wgs84 = FALSE, crs = NULL, object_name = "foo", quantization = 0, ...) {

  sp_helper(input, file = file, overwrite = overwrite, class = "geo_list", 
    object_name = object_name, quantization = quantization, ...)
}

# JSON -----------------
topojson_write.json <- function(input, lat = NULL, lon = NULL, geometry = "point",
  group = NULL, file = "myfile.topojson", overwrite = TRUE, precision = NULL, 
  convert_wgs84 = FALSE, crs = NULL, object_name = "foo", quantization = 0, ...) {

  topo_file(write_topojson(unclass(input), file, ...), "json")
}

## sf classes --------------
topojson_write.sf <- function(input, lat = NULL, lon = NULL, geometry = "point",
                             group = NULL, file = "myfile.topojson",
                             overwrite = TRUE, precision = NULL,
                             convert_wgs84 = FALSE, crs = NULL, 
                             object_name = "foo", quantization = 0, ...) {

  topo_write_sf(input, convert_wgs84, crs, file, overwrite, "sf", 
    object_name, quantization, ...)
}

topojson_write.sfc <- function(input, lat = NULL, lon = NULL, geometry = "point",
                              group = NULL, file = "myfile.topojson",
                              overwrite = TRUE, precision = NULL,
                              convert_wgs84 = FALSE, crs = NULL,
                              object_name = "foo", quantization = 0, ...) {

  topo_write_sf(input, convert_wgs84, crs, file, overwrite, "sfc", 
    object_name, quantization, ...)
}

topojson_write.sfg <- function(input, lat = NULL, lon = NULL, geometry = "point",
                              group = NULL, file = "myfile.topojson",
                              overwrite = TRUE, precision = NULL,
                              convert_wgs84 = FALSE, crs = NULL,
                              object_name = "foo", quantization = 0, ...) {

  topo_write_sf(input, convert_wgs84, crs, file, overwrite, "sfg", 
    object_name, quantization, ...)
}

topo_write_sf <- function(input, convert_wgs84, crs, file, overwrite, 
  class, object_name, quantization, ...) {

  tmp <- suppressMessages(
    geojson_write(input, convert_wgs84 = convert_wgs84,
                  crs = crs, file = tempfile(fileext=".geojson"),
                  overwrite = overwrite, ...))
  on.exit(unlink(tmp$path))
  topo_file(
    write_topojson(
      geo2topo(paste0(readLines(tmp$path, warn = FALSE), collapse = ""), 
        object_name, quantization), file),
    "sfc"
  )
}


# helpers ------------------
write_topojson <- function(x, file, ...) {
  if (is.null(file)) stop("'file' required with character string as input",
                          call. = FALSE)
  file <- path.expand(file)
  fcon <- file(file)
  on.exit(close(fcon))
  writeLines(x, con = fcon)
  message("Success! File at ", file)
  return(file)
}

sp_helper <- function(input, lat = NULL, lon = NULL, geometry = "point",
                      group = NULL, file = "myfile.topojson",
                      overwrite = TRUE, precision = NULL,
                      convert_wgs84 = FALSE, crs = NULL, 
                      class, object_name, quantization, ...) {

  res <- suppressMessages(
    geojson_write(
      input, lat = lat, lon = lon, geometry = geometry, group = group,
      file = sub("\\.topojson|\\.json", "\\.geojson", file),
      overwrite = overwrite, precision = precision,
      convert_wgs84 = convert_wgs84, crs = crs, ...))
  on.exit(unlink(res$path))
  topo_file(
    write_topojson(
      geo2topo(
        paste0(readLines(res$path, warn = FALSE), collapse = ""), 
        object_name, quantization
      ), 
      file
    ),
    class
  )
}

topo_file <- function(path, type) {
  structure(list(path = path, type = type), class = "topojson_file")
}

print.topojson_file <- function(x, ...) {
  cat("<topojson-file>", "\n", sep = "")
  cat("  Path:       ", x$path, "\n", sep = "")
  cat("  From class: ", x$type, "\n", sep = "")
}
