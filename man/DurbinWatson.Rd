% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regressiondiagnostics.R
\name{DurbinWatson}
\alias{DurbinWatson}
\title{\code{DurbinWatson}}
\usage{
DurbinWatson(model, n.permutations = 1000, seed = 123)
}
\arguments{
\item{model}{A 'Regression'  model.}

\item{n.permutations}{Number of permutations used in computing the p-value.}

\item{seed}{The random nmber seed.}
}
\description{
\code{DurbinWatson}
}
\details{
Computes the Durbin-Watson statistic. A permutation test is used for
computing the p-value. Tests to a lag of 1 (two-sided).

Durbin, J., Watson, G. S. (1950). 'Testing for Serial Correlation in Least Squares
Regression, I'. Biometrika 37, (pp. 3 - 4.
}
