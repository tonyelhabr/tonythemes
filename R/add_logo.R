
#' Add logo
#'
#' Add logo to a plot saved as a file
#' @param path_viz,path_logo Paths of the original plot (e.g. png) and the logo
#' @param idx_x,idx_y How much to offset the log from the top-right corner of the original plot (0 to 1)
#' @param logo_scale Size of the logo relative to the plot (0 to 1)
#' @param adjust_x,adjust_y Whether to adjust for the borders of the plot
#' @param path_suffix When saving the new plot, the suffix to add to the original filename (`path_viz`)
#' @param delete Whether to delete the prior plot's png
add_logo <-
  function(path_viz,
           path_logo,
           idx_x,
           idx_y,
           logo_scale = 0.1,
           adjust_x = TRUE,
           adjust_y = TRUE,
           path_suffix = '_w_logo',
           delete = TRUE) {
    plot <- magick::image_read(path_viz)
    logo_raw <- magick::image_read(path_logo)

    plot_height <- magick::image_info(plot)$height
    plot_width <- magick::image_info(plot)$width

    logo <- magick::image_scale(logo_raw, as.character(round(plot_width * logo_scale)))

    info <- magick::image_info(logo)
    logo_width <- info$width
    logo_height <- info$height

    x_pos <- plot_width - idx_x * plot_width
    y_pos <- plot_height - idx_y * plot_height

    if(adjust_x) {
      x_pos <- x_pos - logo_width
    }

    if(adjust_y) {
      y_pos <- y_pos - logo_height
    }

    offset <- paste0('+', x_pos, '+', y_pos)

    viz <- magick::image_composite(plot, logo, offset = offset)
    ext <- tools::file_ext(path_viz)
    rgx_ext <- sprintf('[.]%s$', ext)

    res <-
      magick::image_write(
        viz,
        gsub(rgx_ext, sprintf('%s.%s', path_suffix, ext), path_viz)
      )
    res

    if(!delete) {
      return(res)
    }
    unlink(path_viz, recursive = TRUE, force = TRUE)
    res
  }

add_logo_img <- function(..., .name) {
  add_logo(
    path_logo = system.file('extdata', sprintf('%s.png', .name), package = 'tonythemes', mustWork = TRU),
    ...
  )
}

#' @export
add_logo_epl <- function(...) {
  add_logo_img(..., .name = 'epl')
}
