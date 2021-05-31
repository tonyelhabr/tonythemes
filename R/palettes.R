
#' Color palette for SLICED
#'
#' Color palette for SLICED
#' @param n Number of different colors in the palette, minimum 3, maximum is 11 (like \code{\link[RColorBrewer]{brewer.pal}} with "PRGn")
#' @export
#' @importFrom RColorBrewer brewer.pal
palette_sliced <- function(n) {
  RColorBrewer::brewer.pal(n, name = 'PRGn')
}
