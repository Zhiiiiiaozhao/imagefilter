#' Apply a Filter to a Magick Image
#'
#' Converts the first frame of an image to a bitmap, applies the
#' selected pixel filter, and converts it back to a magick image.
#'
#' @param image A magick image object returned by
#'   magick::image_read().
#' @param filter_fun A function that converts one raw RGB pixel,
#'   such as grey_filter or red_filter.
#'
#' @return A magick image object containing the filtered first frame.
#'
#' @export
apply_image_filter <- function(image, filter_fun) {
  # Extract the bitmap
  bitmap <- image[[1]]

  # Apply the selected filter to every pixel
  filtered_bitmap <- apply_filter(bitmap, filter_fun)

  # Convert the filtered bitmap back to an image
  magick::image_read(filtered_bitmap)
}
