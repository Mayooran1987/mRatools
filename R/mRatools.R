#' @keywords internal
"_PACKAGE"
# Suppress R CMD check note
# Namespace in Imports field not imported from: PKG
#   All declared Imports should be used.
ignore_unused_imports <- function() {
}

release_bullets <- function() {
  c(
    '`usethis::use_latest_dependencies(TRUE, "CRAN")`',
    '`mRatools_dependency_dissuade()`'
  )
}
