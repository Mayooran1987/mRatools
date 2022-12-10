core_packages <- c("grabsampling", "mixingsimulation", "uneqmixr", "dilutionrisk")

core_packages_unloaded <- function() {
  search <- paste0("package::", core_packages)
  core_packages[!search %in% search()]
}

presentationPackages  <- function() {
  c("cli", "crayon", "rstudioapi")
}

same_library <- function(pkg) {
  loc <- if (pkg %in% loadedNamespaces()) dirname(getNamespaceInfo(pkg, "path"))
  library(pkg, lib.loc = loc, character.only = TRUE, warn.conflicts = FALSE)
}

mRatools_attach <- function() {
  to_load <- core_packages_unloaded()

  suppressPackageStartupMessages(
    lapply(to_load, same_library)
  )

  invisible(to_load)
}

mRatools_attach_message <- function(to_load) {
  if (length(to_load) == 0) {
    return(NULL)
  }

  header <- cli::rule(
    left = cli::style_bold("Attaching core mRatools packages"),
    right = paste0("mRatools ", package_version_h("mRatools"))
  )
   pkgs = core_packages
   header1 <- "To learn more about any mRatools package, see browseURL(url = \"https://mayooran1987.github.io/pkgs\")."
   if (length(pkgs) > 0) {
     eg_msg <- paste0("\n", "E.g.")
     pkg_egs <- paste0("\t",
                       "browseURL(url = \"https://mayooran1987.github.io/grabsampling\")",collapse = "\n")
     header1 <- paste0(header1, eg_msg, pkg_egs, "\n")
   }

  to_load <- sort(to_load)
  versions <- vapply(to_load, package_version_h, character(1))

  packages <- paste0(
    cli::col_green(cli::symbol$tick), " ", cli::col_blue(format(to_load)), " ",
    cli::ansi_align(versions, max(cli::ansi_nchar(versions)))
  )

  if (length(packages) %% 2 == 1) {
    packages <- append(packages, "")
  }
  col1 <- seq_len(length(packages) / 2)
  info <- paste0(packages[col1], "     ", packages[-col1])
  # paste0(header, "\n", paste(info, collapse = "\n"),"\n")

  paste0(header, "\n", paste(info, collapse = "\n"),"\n","\n", header1,"\n")

}

package_version_h <- function(pkg) {
  highlight_version(utils::packageVersion(pkg))

}

highlight_version <- function(x) {
  x <- as.character(x)

  is_dev <- function(x) {
    x <- suppressWarnings(as.numeric(x))
    !is.na(x) & x >= 9000
  }

  pieces <- strsplit(x, ".", fixed = TRUE)
  pieces <- lapply(pieces, function(x) ifelse(is_dev(x), cli::col_red(x), x))
  vapply(pieces, paste, collapse = ".", FUN.VALUE = character(1))
}


