% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/estimateLake.R
\name{estimateLake}
\alias{estimateLake}
\title{Lake-Wide Fish Estimates from Acoustic and Midwater Trawl Data}
\usage{
estimateLake(maindir, rdat = "ACMT", ageSp = NULL, region, regArea,
  TSrange = c(-60, -30), TSthresh = 1, psi = 0.01,
  chngBinCntToZero = FALSE, BinCntZeroParams = c(depth = 40, TS = -45),
  SpeciesFromDepthTS = FALSE, DepthTSParams = c(SpDepth = 40, SpTS =
  -45, Species = 204), rmBycatch = FALSE, ByCatchParams = c(bcdepth =
  40, bcSpecies = c(106, 109)), soi = c(106, 109, 203, 204), spInfo,
  sliceDef, short = TRUE, IntMeansPlots = FALSE,
  descr = "ACMT Estimates")
}
\arguments{
\item{maindir}{A character scalar giving the directory where \code{rdat} is located
and where output will be placed.  Use forward slashes, e.g., "C:/temp/".}

\item{rdat}{A character scalar giving the name of the RData file in \code{maindir}
with the acoustic and midwater trawl data, typically the output from
\code{\link{readAll}}.}

\item{ageSp}{A numeric vector giving the species codes for species for which
age-length keys should be used, default NULL.}

\item{region}{A character vector, names of regions used in laying out sampling design.}

\item{regArea}{A numeric vector, corresponding areas (in ha) of \code{region}.}

\item{TSrange}{A numeric vector of length 2, the target strength range of interest,
minimum and maximum in dB, default c(-60, -30).}

\item{TSthresh}{A numeric scalar, the minimum number of binned targets required to
incorporate the TS information from a given (interval by layer) cell.}

\item{psi}{A numeric scalar, the transducer-specific two-way equivalent beam angle
in steradians, default 0.01.}

\item{chngBinCntToZero}{Logical scalar, indicating if the user wishes to convert the number
of targets in specific TS bins to zero so they don't influence sigma.}

\item{BinCntZeroParams}{A numeric vector, depth and TS ranges below which the number of targets
in the specified TS bins will be converted to zero}

\item{SpeciesFromDepthTS}{Logical scalar indicating if the user wishes to use depth and TS to
identify species.}

\item{DepthTSParams}{A numeric vector of depth (meters) and TS (dB) as in (DepthTSParams = c(40, -45)).
Currently this function can only be used to assign density in cells >= the values
provided here. Future modifications may provide more flexibility.}

\item{rmBycatch}{Logical scalar indicating whether or not the user wishes to remove particular
species from midwater trawl data because they are believed to be bycatch. One
common example of a need for this was reported by Warner et al. (2012), who
found that catch observed over the course of three decades varied with fishing
depth. At depths > 40 m below the surface, the vast majority (> 70 percent) of fish
were bloater > 120 mm.}

\item{ByCatchParams}{A vector with the first entry being depth, below which the user believes
the species (the remaining portion of the vector) are bycatch and
should be removed from the fishing data.}

\item{soi}{A numeric vector, codes of fish species for which estimates will be
generated, default c(106, 109, 203, 204).}

\item{spInfo}{A data frame with five variables
\itemize{
  \item \code{sp} = numeric, species code, must include all codes listed
    in \code{soi}, may include codes not listed in \code{soi}
  \item \code{spname} = character, species name
  \item \code{lcut} = numeric, the length cut off (in mm) at which to
    divide the corresponding species data into two groups (those with fish
    lengths <= lcut and > lcut) for estimation,
    use 0 for species with no length cut offs
  \item \code{lwa} and \code{lwb} = numeric parameters of length-weight
    relations, Wg = \code{lwa} * Lmm ^ \code{lwb}, where Wg is the weight
    (in g) and Lmm is the total length (in mm)
}}

\item{sliceDef}{A list of at least two named sub-lists defining the slices into which
observations will be classified.  Each sub-list contains one or more
named numeric vectors of length two, identifying the parameter
(the name of the vector) and the range of values (see Details) that
contribute
to the slice definition, with one exception.  For slicing by regions,
the named vector is character (not numeric), is of length one or more
(not necessarily two), and specifies all of the regions that contribute
to the slice definition.
The name of each sub-list is the name of the slice to be assigned.
See Examples.}

\item{short}{Logical scalar, indicating aspect of map area.  If TRUE, the default,
the mapped area is assumed to be wider (longitudinally) than tall.
Used to better arrange multiple maps on a single page.}

\item{descr}{A character scalar to be incorporated in the name of the saved output
files, default "ACMT Estimates".}
}
\value{
A rich text file (rtf) with a *.doc file extension (so that it will be
  opened with Word by default) is saved to \code{maindir}.

  Seven different data frames are saved as objects in an Rdata
  file and are written to csv files in \code{maindir}:
  \itemize{
    \item \code{Lakes} = lake-wide totals (in millions and t) and
      means (in numbers and g per ha), with a row for each species group
      and estimate type and columns for estimates, standard errors, and
      relative standard errors.
    \item \code{Regions} = region means (in fish per ha and g per ha), with
      a row for each region, species group, and estimate type and columns for
      estimates and corresponding (surface) areas.
    \item \code{intmeans_nph} = interval means (in fish per ha), with a row
      for each region and interval, a column for each species group, and
      additional columns for region area, and the interval bottom depth,
      latitude and longitude.
    \item \code{intmeans_gph} = interval means (in g per ha), similar to
      \code{intmeans_nph}.
    \item \code{intlaymeans_nph} = interval and layer means (in fish per ha),
      with a row for each region, interval, and layer, a column for each
      species group, and many additional columns.
    \item \code{intlaymeans_gph} = interval and layer means (in g per ha),
      similar to \code{intlaymeans_nph}.
    \item \code{svts5} = the result of merging the SV and TS data, with
      several changes made: subsetted to valid regions, original and modified
      sigma estimates of n1, nv, fish_ha, depth_botmid (bottom depth range),
      and identity of slice, nearmt (nearest midwater trawl), region, and
      region area.
  }
  The Rdata and csv files are named using the lake and the year.
}
\description{
Estimate lake-wide fish density and total number
(in number per ha and millions) and
biomass density and total biomass (in g per ha and t) from
acoustic and midwater trawl data.
}
\details{
The sigma for each acoustic cell is estimated as the mean of the
  linearized target strength (TS) weighted by the number of targets in
  each dB bin using the TS frequency distribution.

  The number of scatterers per unit volume, Nv,
  is estimated according to Sawada et al. (1993) (see \code{\link{estNv}}).
  So called "biased" sigmas where Nv > 0.1 are replaced
  with mean "unbiased" sigmas from cells in the same layer
  and (if possible) transect.  Then, Nv is recalculated.
}
