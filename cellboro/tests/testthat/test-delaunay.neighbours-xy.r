test_that(
    "delaunay.neighbours for x-y input 4 points", {
        x <- c(1, 3, 3, 5)
        y <- c(2, 1, 3, 2)
        res_xy <- delaunay.neighbours(x, y)
        exp_res <- data.frame(
            ind1 = c(1, 1, 2, 2, 2, 3, 3, 3, 4, 4),
            ind2 = c(2, 3, 1, 3, 4, 1, 2, 4, 2, 3)
        )
        expect_true(all.equal(res_xy, exp_res))
    }
)
test_that(
    "delaunay.neighbours for data.frame x-y input 4 points", {
        x <- c(1, 3, 3, 5)
        y <- c(2, 1, 3, 2)
        df <- data.frame(x, y)
        res_df <- delaunay.neighbours(df)
        exp_res <- data.frame(
            ind1 = c(1, 1, 2, 2, 2, 3, 3, 3, 4, 4),
            ind2 = c(2, 3, 1, 3, 4, 1, 2, 4, 2, 3)
        )
        expect_true(all.equal(res_df, exp_res))
    }
)