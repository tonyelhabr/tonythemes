
#' @seealso \url{https://github.com/hrbrmstr/hrbrthemes/blob/master/R/zzz.r}
.onAttach <- function(libname, pkgname) {
  if (.Platform$OS.type == 'windows')  { # nocov start
    if (interactive()) {
      packageStartupMessage('Registering Windows fonts with R')
    }
    extrafont::loadfonts('win', quiet = TRUE)
  }
}
