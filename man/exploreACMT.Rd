% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exploreACMT.R
\name{exploreACMT}
\alias{exploreACMT}
\title{Explore Acoustic and Midwater Trawl Data}
\usage{
exploreACMT(maindir, rdat = "ACMT", AC = TRUE, MT = TRUE,
  ageSp = NULL, short = TRUE, TSrange = c(-60, -27))
}
\arguments{
\item{maindir}{A character scalar giving the directory where output will be placed.
Use forward slashes, e.g., "C:/temp/".}

\item{rdat}{A character scalar giving the name of the RData file in \code{maindir}
with the acoustic and midwater trawl data, typically the output from
\code{\link{readAll}}.}

\item{AC}{A logical scalar indicating if you want to explore the acoustic data,
default TRUE.}

\item{MT}{A logical scalar indicating if you want to explore the midwater trawl
data, default TRUE.}

\item{ageSp}{A numeric vector giving the species codes for species for which
age-length keys should be used, default NULL.}

\item{short}{Logical scalar, indicating aspect of map area.  If TRUE, the default,
the mapped area is assumed to be wider (longitudinally) than tall.
Used to better arrange multiple maps on a single page.}

\item{TSrange}{A numeric vector of length 2, the target strength range of interest,
minimum and maximum in dB, default c(-60, -30). Must be a whole number.}
}
\description{
Explore acoustic and midwater trawl data.
}
\details{
A rich text file (rtf) with a *.doc file extension (so that it will be
  opened with Word by default) is saved to \code{maindir}.
}
