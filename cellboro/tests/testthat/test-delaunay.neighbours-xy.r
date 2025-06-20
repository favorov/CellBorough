test_that(
    "delaunay.neighbours for x-y input 3 points", {
        x <- c(1, 3, 2)
        y <- c(1, 1, 2)
        res_xy <- delaunay.neighbours(x, y)
        exp_res_xy <- data.frame(
            ind1 = c(1, 1, 2, 2, 3, 3),
            ind2 = c(2, 3, 1, 3, 1, 2)
        )
        expect_true(all.equal(res_xy, exp_res_xy))
    }
)
test_that(
    "delaunay.neighbours for data.frame x-y input 3 points", {
        df <- data.frame(x = c(1, 3, 2), y = c(1, 1, 2))
        res_df <- delaunay.neighbours(df)
        exp_res_df <- data.frame(
            ind1 = c(1, 1, 2, 2, 3, 3),
            ind2 = c(2, 3, 1, 3, 1, 2)
        )
        expect_true(all.equal(res_df, exp_res_df))
    }
)