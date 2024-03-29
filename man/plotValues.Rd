% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotValues.R
\name{plotValues}
\alias{plotValues}
\title{Test for and Plot Errors in Acoustic Survey Values}
\usage{
plotValues(low, high, between, lowhighKnown = FALSE,
  varname = "Varname", test = FALSE, ...)
}
\arguments{
\item{low}{A numeric vector of low values.}

\item{high}{A numeric vector of high values, the same length as \code{low}.}

\item{between}{A numeric vector of in between values, the same length as \code{low}.}

\item{lowhighKnown}{A logical scalar indicating whether the vector representing the lows
and the vector representing the highs are known, default FALSE.
If FALSE, the low (and high) value is calculated as the elementwise
minimum (and maximum) of the three vectors, \code{low}, \code{high},
and \code{between}.}

\item{varname}{A character scalar identifying what the values represent, used as the
y-axis label if test=FALSE, default "Varname".}

\item{test}{A logical scalar indicating whether to conduct a test for errors (TRUE)
or to draw a plot of the results (FALSE, the default).}

\item{...}{Additional arguments to \code{\link[graphics]{plot}}.}
}
\value{
If \code{test} = TRUE, a logical scalar is returned indicating whether
  there were errors in the values (TRUE) or not (FALSE).
  If \code{test} = FALSE, a figure is drawn, but no value is returned.
}
\description{
Test for and plot errors in acoustic survey data, based on reported
lows, highs, and in-between values.
}
