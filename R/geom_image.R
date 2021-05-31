
#' @importFrom ggimage geom_image
#' @importFrom ggplot2 annotate
annotate_img <- function(..., .name) {
  path <- system.file('extdata', sprintf('%s.png', .name), package = 'tonythemes', mustWork = TRUE)
  list(
    ggimage::geom_image(
      image = path,
      ...
    )
  )
}

#' Annotate Nick Wan
#'
#' Annotate Nick Wan on ggplot
#' @export
annotate_nickwan <- function(...) {
  annotate_img(..., .name = 'nick-wan')
}

#' Annotate Meg Risdal
#'
#' Annotate Meg Risdal on ggplot
#' @export
annotate_megrisdal <- function(...) {
  annotate_img(..., .name = 'meg-risdal')
}
