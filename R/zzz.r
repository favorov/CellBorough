.onAttach <- function(libname, pkgname) {
  version <- packageDescription("CellBorough", field="Version")
  packageStartupMessage(paste("Welcome to CellBorough version", version," and know the neigbours."))
}
