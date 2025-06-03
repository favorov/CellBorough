cellboro
==================

The package simplifies to leverage Delaunay triangulation and the dual Voronoi diagrams on the cell spatial data. Delaunay triangulation shown the adjacent points (cells) for each cell; Voronoi domain area shows the area that a cell controls.

After careful selection, we use the `interp` R package for both tasks, it is the best for marginal points. If one needs more sophisticated analysis of the diagram, the `interp` can be used directly, and the results will be in accordance with the `cellboro` calls.  We added a function that returns a list of pairwise neignbours, the original function provided by `interp` was too slow.


Repositories
===================

"favorov/CellBourogh" is the develop GitHub repository; "favorov/cellboro" is the package release.
