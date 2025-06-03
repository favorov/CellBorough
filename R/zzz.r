.onAttach <- function(libname, pkgname) {
  version <- packageDescription("cellboro", field="Version")
  packageStartupMessage(paste("Welcome to CellBorough version", version," and know the neigbours."))
}
