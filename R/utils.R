inform_startup <- function(msg, ...) {
  if (is.null(msg)) {
    return()
  }
  if (isTRUE(getOption("mRatools.quiet"))) {
    return()
  }

  rlang::inform(msg, ..., class = "packageStartupMessage")
}

#' List all packages in the mRatools
#'
#' @param include_self Include mRatools in the list?
#' @export
#' @examples
#' mRatools_packages()
mRatools_packages <- function(include_self = TRUE) {
  raw <- utils::packageDescription("mRatools")$Imports
  imports <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", imports)
  names <- vapply(strsplit(parsed, "\\s+"), "[[", 1, FUN.VALUE = character(1))

  if (include_self) {
    names <- c(names, "mRatools")
  }

  names
}

invert <- function(x) {
  if (length(x) == 0) return()
  stacked <- utils::stack(x)
  tapply(as.character(stacked$ind), stacked$values, list)
}

# Just for ignoring display errors when developing this package
dummy <- function() {
  grabsampling::prob_accept
  mixingsimulation::compare_alphas
  uneqmixr::AOQL_scenarios
  dilutionrisk::OC_curves_heterogeneous
}

