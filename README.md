# imagefilter

Author: Lei Zhao

An R package developed for the image filter course exam. It converts
RGB images into greyscale, red, green, blue, and black-and-magenta versions.

## Installation

Download and unzip the project, then open its `.Rproj` file in RStudio.
Install the package from the project directory:

```r
install.packages("devtools") # Only needed if not already installed
devtools::install()
```

## Functions

- `grey_filter()`: converts one RGB pixel to greyscale using the weights
  0.299 for red, 0.587 for green, and 0.114 for blue.
- `red_filter()`, `green_filter()`, `blue_filter()`: place the greyscale
  value in the selected colour channel and set the other channels to zero.
- `cutoff_filter()`: converts pixels below the default greyscale cut-off
  of 128 to magenta, and pixels equal to or above it to black.
- `apply_filter()`: applies a pixel filter to every pixel of an RGB bitmap.
- `apply_image_filter()`: converts the first frame of a magick image to a
  bitmap, calls `apply_filter()`, and converts the result back to an image.

## Example

Load the package and read the included example image:

```r
library(imagefilter)

image_path <- system.file(
  "extdata",
  "test_image.jpg",
  package = "imagefilter"
)

my_object <- magick::image_read(image_path)
```

Run each line separately to view the different filters:

```r
plot(apply_image_filter(my_object, grey_filter))
plot(apply_image_filter(my_object, red_filter))
plot(apply_image_filter(my_object, green_filter))
plot(apply_image_filter(my_object, blue_filter))
plot(apply_image_filter(my_object, cutoff_filter))
```

To use your own image:

```r
my_object <- magick::image_read("path/to/your/image.jpg")
plot(apply_image_filter(my_object, grey_filter))
```

The functions expect three RGB channels. 

## Documentation

```r
help("imagefilter-package", package = "imagefilter")
?apply_image_filter
?apply_filter
?grey_filter
?cutoff_filter
```

## License

MIT License. See LICENSE and LICENSE.md.
