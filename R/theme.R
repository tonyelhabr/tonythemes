
#' Tony's theme
#'
#' Tony's theme.
#' @export
#' @importFrom ggplot2 theme_minimal theme element_text element_blank element_line margin element_rect update_geom_defaults
#' @importFrom ggplot2 theme_minimal theme element_text element_blank element_line margin element_rect update_geom_defaults
theme_tony <- function() {
  font <- 'Karla'
  gray_light <- 'gray80'
  gray_mid <- 'gray50'
  gray_dark <- 'gray20'
  ggplot2::theme_minimal() +
    ggplot2::theme(
      text = ggplot2::element_text(family = font),
      title = ggplot2::element_text(font, size = 14, color = gray_dark),
      plot.title = ggplot2::element_text(font, face = 'bold', size = 18, color = gray_dark),
      plot.title.position = 'plot',
      plot.subtitle = ggplot2::element_text(font, face = 'bold', size = 14, color = gray_dark),
      axis.text = ggplot2::element_text(font, size = 14),
      axis.title = ggplot2::element_text(size = 14, face = 'bold', hjust = 0.99),
      axis.line = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(color = gray_light),
      panel.grid.minor = ggplot2::element_line(color = gray_light),
      panel.grid.minor.x = ggplot2::element_blank(),
      panel.grid.minor.y = ggplot2::element_blank(),
      plot.margin = ggplot2::margin(10, 10, 10, 10),
      plot.background = ggplot2::element_rect(fill = 'white', color = NA),
      plot.caption = ggplot2::element_text(font, size = 12, color = gray_dark, hjust = 1),
      plot.caption.position = 'plot',
      plot.tag = ggplot2::element_text(font, size = 12, color = gray_dark, hjust = 0),
      plot.tag.position = c(.01, 0.02),

      legend.text = ggplot2::element_text(size = 14),
      strip.text = ggplot2::element_text(color = gray_dark, size = 14),
      strip.background = ggplot2::element_blank(),
      panel.background = ggplot2::element_rect(fill = 'white', color = NA)
    )
}

#' Set Tony's theme globally
#'
#' Set Tony's theme gloablly.
#' @export
#' @importFrom extrafont loadfonts
#' @importFrom ggplot2 theme_set update_geom_defaults
#' @importFrom extrafont loadfonts
#' @importFrom ggplot2 theme_set update_geom_defaults
theme_set_tony <- function() {
  extrafont::loadfonts('win', quiet = TRUE)
  font <- 'Karla'
  ggplot2::theme_set(theme_tony())
  ggplot2::update_geom_defaults('text', list(family = font, size = 4))
}
