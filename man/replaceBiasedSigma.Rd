% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/replaceBiasedSigma.R
\name{replaceBiasedSigma}
\alias{replaceBiasedSigma}
\title{Replace Biased Backscattering Cross Sections}
\usage{
replaceBiasedSigma(df, varNv, varsigmabs, varTranLay,
  varLay = varTranLay[-1], Nvcut = 0.1)
}
\arguments{
\item{df}{A data frame containing the variables specified by name below.}

\item{varNv}{A character scalar, the name of the variable in \code{df} containing
a numeric vector of the number of fish per acoustic sampling volume.}

\item{varsigmabs}{A character scalar, the name of the variable in \code{df} containing
a numeric vector of the backscattering cross section, sigma_bs in m^2.}

\item{varTranLay}{A character vector, the names of the variable in \code{df} used to identify
unique transect-layers.  Include names of other needed by variables
if \code{df} contains information from multiple waterbodies or time
periods.}

\item{varLay}{A character vector, the names of the variable in \code{df} used to identify
unique layers.  The default, \code{varTranLay}[-1], assumes that the first
variable names in \code{varTranLay} identifies the transect.
This must be a subset of \code{varTranLay}.  Include names of other needed
by variables if \code{df} contains information from multiple waterbodies
or time periods.}

\item{Nvcut}{A numeric scalar, the cutoff for Nv (specified by \code{VarNv}), above
which all sigma_bs are considered biased, default 0.1.  Any sigma_bs with
missing values are left unchanged.}
}
\value{
A numeric vector of target strengths, TS, in dB, same
  length as \code{sigmabs}.
}
\description{
Replace biased backscattering cross sections (sigma_bs in m^2)
with averages from unbiased sigma_bs using cells in the same
layer and (if possible) transect.
}
\details{
TS = 10*log10(sigma_bs).
}
\examples{
mydf <- data.frame(nv=c(0.01, 0.1, 0.2, 0.2, 0.3, 0.05, 0.01),
  sig=1:7, tran=c(1, 1, 1, 2, 2, 1, 1), layer=c(1, 1, 1, 2, 2, 2, 2))
sig <- replaceBiasedSigma(df=mydf, varNv="nv", varsigmabs="sig",
  varTranLay=c("tran", "layer"))
cbind(mydf, sig)

}
