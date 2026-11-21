#' imagefilter: Apply Colour Filters to Bitmap Images
#'
#' The imagefilter package provides functions for converting RGB
#' bitmap images into greyscale, red, green, blue, and black-and-magenta
#' versions.
#'
#' The filter functions process one RGB pixel at a time. The
#' `apply_filter()` function applies a selected filter to every pixel
#' in a bitmap image.
#'
#' @section Filter functions:
#' `grey_filter()` converts a pixel to greyscale.
#'
#' `red_filter()` converts a pixel to a red version.
#'
#' `green_filter()` converts a pixel to a green version.
#'
#' `blue_filter()` converts a pixel to a blue version.
#'
#' `cutoff_filter()` applies a black-and-magenta cut-off.
#'
#' @section Whole-image functions:
#' `apply_filter()` applies a selected pixel filter to every pixel
#' of a bitmap image and returns the filtered bitmap.
#'
#' `apply_image_filter()` takes a magick image, converts its first
#' frame to a bitmap, calls `apply_filter()`, and converts the
#' filtered bitmap back to a magick image.
#'
#' @section Usage:
#' Read an image with `magick::image_read()`, then pass it to
#' `apply_image_filter()` together with a pixel filter, for example:
#'
#' `plot(apply_image_filter(my_object, grey_filter))`
#'
#'
#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end

## mockable bindings: start
## mockable bindings: end
NULL
