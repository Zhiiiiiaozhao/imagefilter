# ------------------------------------------------------------------
# apply_filter.R
# Function that applies a colour filter to every pixel of a bitmap image.
# The bitmap is a three-dimensional raw object where the first
# dimension holds the red, green and blue channels and the other
# two dimensions are the x and y axes of the image.
# ------------------------------------------------------------------


#' Apply a Colour Filter to Every Pixel of a Bitmap
#'
#' Goes through a bitmap image pixel by pixel and applies the
#' provided filter function to the RGB values of each pixel.
#'
#' @param bitmap A three-dimensional raw object (channels x width x
#' height), as obtained by subsetting the object returned from
#' \code{image_read()}, e.g. \code{my_bitmap <- my_object[[1]]}.
#'
#' @param filter_fun A function that takes a raw vector of length
#' three (one pixel) and returns a raw vector of length three with
#' the converted colour, e.g. \code{grey_filter} or \code{red_filter}.
#'
#' @return The filtered bitmap, a three-dimensional raw object of the
#' same dimensions as the input.
#'
#' @examples
#' \dontrun{
#' image_path <- system.file(
#'   "extdata",
#'   "test_image.jpg",
#'   package = "imagefilter"
#' )
#' my_object <- magick::image_read(image_path)
#' my_bitmap <- my_object[[1]]
#' grey_bitmap <- apply_filter(my_bitmap, grey_filter)
#' plot(magick::image_read(grey_bitmap))
#' }
#'
#' @export

apply_filter <- function(bitmap, filter_fun) {
  # Check if the input has correct structure
  stopifnot(
    is.raw(bitmap),
    length(dim(bitmap)) == 3
  )

  # Loop over the x and y axes; the first dimension (the three
  # colour channels) is passed to the filter as one raw vector
  for (y in seq_len(dim(bitmap)[3])) {
    for (x in seq_len(dim(bitmap)[2])) {
      bitmap[, x, y] <- filter_fun(bitmap[, x, y])
    }
  }

  # Return the filtered bitmap
  bitmap
}
