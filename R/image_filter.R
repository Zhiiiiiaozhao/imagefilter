# ------------------------------------------------------------------
# filters.R
# Filter functions for the image filter lab.
# Each function takes a single pixel (a raw vector of length three,
# holding the red, green and blue values) and returns the converted
# pixel as a raw vector of length three.
# ------------------------------------------------------------------


#' Convert an RGB Pixel to Greyscale
#'
#' Converts a single RGB pixel to greyscale using the weighted red,
#' green and blue values that the human eye interprets as grey
#' (R * 0.299, G * 0.587, B * 0.114).
#'
#' @param pixel A raw vector of length three containing the red,
#' green and blue values of one pixel.
#'
#' @return A raw vector of length three containing the greyscale
#' value for the red, green and blue channels.
#'
#' @examples
#' grey_filter(as.raw(c(50, 120, 10)))
#'
#' @export
grey_filter <- function(pixel) {
  # Convert the raw RGB values to integers
  red   <- as.integer(pixel[1])
  green <- as.integer(pixel[2])
  blue  <- as.integer(pixel[3])

  # Calculate the weighted greyscale value
  grey <- round(red * 0.299 + green * 0.587 + blue * 0.114)

  # Return the same greyscale value for all three colour channels
  as.raw(c(grey, grey, grey))
}


#' Convert an RGB Pixel to Red
#'
#' Converts a single RGB pixel by keeping the greyscale value in the
#' red channel and setting the green and blue channels to zero.
#'
#' @param pixel A raw vector of length three containing the red,
#' green and blue values of one pixel.
#'
#' @return A raw vector of length three with only the red channel set.
#'
#' @examples
#' red_filter(as.raw(c(50, 120, 10)))
#'
#' @export
red_filter <- function(pixel) {
  # Reuse the grey conversion so the weighting is defined only once
  grey <- grey_filter(pixel)

  # Keep the greyscale value in the red channel, zero the rest
  as.raw(c(as.integer(grey[1]), 0, 0))
}


#' Convert an RGB Pixel to Green
#'
#' Converts a single RGB pixel by keeping the greyscale value in the
#' green channel and setting the red and blue channels to zero.
#'
#' @param pixel A raw vector of length three containing the red,
#' green and blue values of one pixel.
#'
#' @return A raw vector of length three with only the green channel set.
#'
#' @examples
#' green_filter(as.raw(c(50, 120, 10)))
#'
#' @export
green_filter <- function(pixel) {
  # Reuse the grey conversion so the weighting is defined only once
  grey <- grey_filter(pixel)

  # Keep the greyscale value in the green channel, zero the rest
  as.raw(c(0, as.integer(grey[2]), 0))
}


#' Convert an RGB Pixel to Blue
#'
#' Converts a single RGB pixel by keeping the greyscale value in the
#' blue channel and setting the red and green channels to zero.
#'
#' @param pixel A raw vector of length three containing the red,
#' green and blue values of one pixel.
#'
#' @return A raw vector of length three with only the blue channel set.
#'
#' @examples
#' blue_filter(as.raw(c(50, 120, 10)))
#'
#' @export
blue_filter <- function(pixel) {
  # Reuse the grey conversion so the weighting is defined only once
  grey <- grey_filter(pixel)

  # Keep the greyscale value in the blue channel, zero the rest
  as.raw(c(0, 0, as.integer(grey[3])))
}


#' Apply a Black and Magenta Cut-off to an RGB Pixel
#'
#' Converts a single RGB pixel to greyscale and applies a colour
#' cut-off. Pixels with a greyscale value below the cut-off become
#' magenta, while pixels equal to or above the cut-off become black.
#'
#' @param pixel A raw vector of length three containing the red,
#' green and blue values of one pixel.
#'
#' @param cutoff A numeric greyscale cut-off value. The default is 128.
#'
#' @return A raw RGB vector representing either black or magenta.
#'
#' @examples
#' cutoff_filter(as.raw(c(50, 50, 50)))
#' cutoff_filter(as.raw(c(200, 200, 200)))
#'
#' @export
cutoff_filter <- function(pixel, cutoff = 128) {
  # Convert the pixel to greyscale
  grey_pixel <- grey_filter(pixel)
  grey_value <- as.integer(grey_pixel[1])

  # Apply the cut-off
  if (grey_value < cutoff) {
    # Magenta: #FF00FF
    as.raw(c(255, 0, 255))
  } else {
    # Black: #000000
    as.raw(c(0, 0, 0))
  }
}
