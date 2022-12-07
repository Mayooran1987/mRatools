.onAttach <- function(...) {
  attached <- mRatools_attach()
  if (!is_loading_for_tests()) {
    inform_startup(mRatools_attach_message(attached))
  }

  if (!is_attached("conflicted") && !is_loading_for_tests()) {
    conflicts <- mRatools_conflicts()
    inform_startup(mRatools_conflict_message(conflicts))
  }
}

is_attached <- function(x) {
  paste0("package:", x) %in% search()
}

is_loading_for_tests <- function() {
  !interactive() && identical(Sys.getenv("DEVTOOLS_LOAD"), "mRatools")
}
