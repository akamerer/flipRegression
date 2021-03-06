% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/confusion.R
\name{ConfusionMatrix}
\alias{ConfusionMatrix}
\title{\code{ConfusionMatrix}}
\usage{
ConfusionMatrix(obj, subset = obj$subset, weights = obj$weights,
  decimals = NULL)
}
\arguments{
\item{obj}{A model with an outcome variable or a data.frame where the first column is the outcome and
the second column is the prediction.}

\item{subset}{An optional vector specifying a subset of observations to be used or the name of a
column if \code{obj} is a data.frame.}

\item{weights}{An optional vector of sampling weights or the name of a column if \code{obj} is a data.frame.}

\item{decimals}{The number of decimal places for the values.}
}
\description{
Produces a confusion matrix for a trained model or data.frame showing the proportion
of observed values that take the same values as the predicted values. Where the outcome variable
in the model is not a factor and not a count, observed and predicted values are assigned to buckets.
}
