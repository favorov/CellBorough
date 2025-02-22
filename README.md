CellBorough
==================

The package simplifies to leverage Delaunay triangulation and the dual Voronoi diagrams on the cell spatial data. Delaunay triangulation shown the adjacent points (cells) for each cell; Voronoi cell square shows the area that the cell controls.

After careful selection, we use the interp package for both tasks, it is the best for marginal points. We added a function that returms returns the list of pairwise neignbours, the original one provided by `interp` was too slow.  
