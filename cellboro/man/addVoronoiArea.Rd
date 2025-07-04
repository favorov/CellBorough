% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/voronoi.r
\name{addVoronoiArea}
\alias{addVoronoiArea}
\title{addVoronoiArea
Calculate Voronoi area in a SpatialExperiment object and add it to the reducedDim slot}
\usage{
addVoronoiArea(se, splitBy = NULL)
}
\arguments{
\item{se}{a SpatialExperiment object.}

\item{splitBy}{a character string or interger that specifies a column in spatialData to use to split coordiatnes
if they correspond to several images. NULL means there is only one image in the object.}
}
\value{
a SpatialExperiment object.
}
\description{
This function calculates Voronoi area for every image in a SpatialExperiment object and adds it to the reducedDim slot
  Voronoi should be calculated for each image separately, so if data come from several cores, slides, images, and so on
  then spatialCoords should have a column that specifies how to split.
}
