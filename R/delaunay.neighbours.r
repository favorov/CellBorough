#' @import interp
#' @import dplyr
#import description end 
0


#' delaunay.neighbours
#' 
#' Delaunay triangulation-based pairs of neighbours
#' 
#' @title delaunay.neighbours: create a list of neighbouring point pairs form the point coordinates
#' @param x could be a a numeric coordinate vector. 
#' In this case, \code{y} parameter is required. 
#' 
#' The \code{x} patameter could be of class \code{triSht}, that is the return of \code{interp::tri.mesh}
#'
#' If \code{x} is a \code{SpatialExperiment}, the point (cells) coordinates are read from 
#' \code{Xcoord} and \code{Ycood} slots.
#' 
#' Alternatively, \code{x} is a 
#' data structure that can be subsetted by \code{$x} and \code{$y} 
#' or by the names provided by \code{x.name} and \code{y.name}) parameters to get the point coordinates.
#' 
#' 
#' @return \code{data.frame}, each row is a pair of indices of neighbouring points
#' @examples
#' x <- runif(50)
#' y <- runif(50)
#' df<-data.frame(x=x,y=y)
#' neighb.tm<-delaunay.neighbours(interp::tri.mesh(x,y))
#' neighb.xy<-delaunay.neighbours(x,y)
#' neighb.df<-delaunay.neighbours(df)
#' dfc<-data.frame(x.coord=x,y.coord=y)
#' neighb.dfc<-delaunay.neighbours(dfc,x.name="x.coord",y.name="y.coord")
#' 

#' @export
delaunay.neighbours<-function(x, ...){
  ##get the sides of Delauneu triangles
  UseMethod("delaunay.neighbours")
}

#' @rdname delaunay.neighbours
#' @export
delaunay.neighbours.triSht <- function(x,...){
    add_complement<-function(pairs) {
      neighb_pairs<-data.frame(pairs)
      colnames(neighb_pairs)<-c("ind1","ind2")
      neighb_pairs_compl<-neighb_pairs %>% select(ind1=ind2,ind2=ind1)
      neighb_pairs %>% rbind(neighb_pairs_compl) %>% arrange(ind1,ind2)
    }
    add_complement(x$arcs)
}

#' @rdname delaunay.neighbours
#' @param y second coordinate vector
#' @export
delaunay.neighbours.numeric <- function(x,y,...){
    if (class(y) != "numeric") {stop("delaney.neighbours: x is numeric, y is not.\n")}
    if(length(x)!=length(y)) {stop("delaney.neighbours: x and y of different lengths.\n")}
    delaunay.neighbours.triSht(interp::tri.mesh(x,y))
}

#' @rdname delaunay.neighbours
#' @export
delaunay.neighbours.SpatialExperiment <- function(x,...){
    delaunay.neighbours.numeric(x$Xcoord,x$Ycoord)
}


#' @rdname delaunay.neighbours
#' @param x.name the field of column name to subset \code{x$x.name}, the default is "x"
#' @param y.name the field of column name to subset \code{x$y.name}, the default is "y"
#' @export
delaunay.neighbours.default <- function(x,x.name="x",y.name="y",...){
    if(is.atomic(x)) {stop("delaney.neighbours: x is atomic and it is not numeric.\n")}
    if(is.null(x[[x.name]])){ #it is $
        stop(paste0("delaney.neighbours: x$",x_name," is empty.\n"))
    } 
    if(is.null(x[[y.name]])){
        stop(paste0("delaney.neighbours: x$",y_name," is empty.\n"))
    } 
    delaunay.neighbours.numeric(x[[x.name]],x[[y.name]])
}

