#' Conflicts between the mRatools and other packages
#'
#' This function lists all the conflicts between packages in the mRatools
#' and other packages that you have loaded.
#'
#' There are no conflicts between the mRatools and other packages at this stage.
#'
#' @export
#' @param only Set this to a character vector to restrict to conflicts only
#'   with these packages.
#' @examples
#' mRatools_conflicts()
mRatools_conflicts <- function(only = NULL) {
}
mRatools_conflict_message <- function(x) {
  conflicted <- paste0(
    cli::col_cyan(cli::symbol$info), " ",
    # cli::format_inline("Use the {.href [conflicted package](http://conflicted.r-lib.org/)} to force all conflicts to become errors"
    cli::format_inline("Welcome to installing mRatools package, there are no conflicts between the mRatools and other packages at this stage."

  ))
  paste0(
    conflicted
  )
}

#' @export
print.mRatools_conflicts <- function(x, ..., startup = FALSE) {
  cli::cat_line(mRatools_conflict_message(x))
  invisible(x)
}

ls_env <- function(env) {
  x <- ls(pos = env)
  x
}
