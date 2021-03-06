context("Bugs")
data(bank, package = "flipExampleData")
bank <- bank[sample(nrow(bank), 200), ] # random sample of 200 rows to improve perfomance
zformula <- formula("Overall ~ Fees + Interest + Phone + Branch + Online + ATM")
sb <- bank$ID > 100
attr(sb, "label") <- "ID greater than 100"
wgt <- bank$ID
attr(wgt, "label") <- "ID"
bank$o2 <- factor(unclass(bank$Overall) > 3)


type = "Multinomial Logit"
for(missing in c("Multiple imputation", "Imputation (replace missing values with estimates)", "Exclude cases with missing data"))
        test_that(paste("DS-884 MNL with 2 category dependent variable", missing),
      {
          # no weight, no filter
          z = suppressWarnings(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, missing = missing, data = bank, subset = TRUE,  weights = NULL, type = type))
          z = suppressWarnings(Regression(o2 ~ Fees + Interest + Phone + Branch + Online + ATM, missing = missing, data = bank, subset = TRUE,  weights = NULL, type = type))
          # weight
          expect_error(suppressWarnings(Regression(o2 ~ Fees + Interest + Phone + Branch + Online + ATM, missing = missing, data = bank, subset = sb,  weights = NULL, type = type)), NA)
          # weight, filter
          expect_error(suppressWarnings(Regression(o2 ~ Fees + Interest + Phone + Branch + Online + ATM, missing = missing, data = bank, subset = TRUE,  weights = wgt, type = type)), NA)
          # weight, filter
          expect_error(z <- suppressWarnings(Regression(o2 ~ Fees + Interest + Phone + Branch + Online + ATM, missing = missing, data = bank, subset = sb,  weights = wgt, type = type)), NA)
          expect_error(capture.output(suppressWarnings(print(z))),NA)
      })


test_that("Poisson ANOVA p-values are very different to Regression + ignore robust SE",
{
    # Removed support for robust se from regression 17 Nov 2016
    expect_error(suppressWarnings(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, type = "Poisson", robust.se = TRUE)))
})


#
# test_that("DS-1174: object VR_set_net not found")
#     type = "Multinomial Logit"
#     z = suppressWarnings(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank,type = type))
#     expect_error(z <- suppressWarnings(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, missing = missing, data = bank, subset = sb,  weights = wgt, type = type)), NA)
#           expect_error(capture.output(suppressWarnings(print(z))),NA)
#       })
#
# })


