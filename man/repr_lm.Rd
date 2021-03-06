% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_based_repr.R
\name{repr_lm}
\alias{repr_lm}
\title{Regression coefficients from linear model as representation}
\usage{
repr_lm(x, freq = NULL, method = "lm", xreg = NULL)
}
\arguments{
\item{x}{the numeric vector (time series)}

\item{freq}{the frequency of the time series. Can be vector of two frequencies (seasonalities) or just an integer of one frequency.}

\item{method}{the linear regression method to use. It can be "lm", "rlm" or "l1".}

\item{xreg}{the data.frame with additional exogenous regressors or the single numeric vector}
}
\value{
the numeric vector of regression coefficients
}
\description{
The \code{repr_lm} computes seasonal regression coefficients from a linear model.
Additional exogenous variables can be also added.
}
\details{
This model-based representation method extracts regression coefficients from a linear model.
The extraction of seasonal regression coefficients is automatic.
The maximum number of seasonalities is 2 so it is possible to compute representation for double-seasonal time series.
The first set seasonality (frequency) is main, so for example if we have hourly time series (\code{freq = c(24, 24*7)}),
the number of extracted daily seasonal coefficients is 24 and the number of
weekly seasonal coefficients is 7, because the length of second seasonality representation is always freq_1 / freq_2.
There is also possibility to add another independent variables (\code{xreg}).

You have three possibilities for selection of a linear model method.
\itemize{
 \item "lm" is classical OLS regression.
 \item "rlm" is robust linear model using psi huber function and is implemented in MASS package.
 \item "l1" is L1 quantile regression model (also robust linear regression method) implemented in package quantreg.
}
}
\examples{
# Extracts 24 seasonal regression coefficients from the time series by linear model
repr_lm(rnorm(96), freq = 24, method = "lm")

# Try also robust linear models ("rlm" and "l1")
repr_lm(rnorm(96), freq = 24, method = "rlm")
repr_lm(rnorm(96), freq = 24, method = "l1")

}
\references{
Laurinec P, Lucka M (2016)
Comparison of representations of time series for clustering smart meter data.
In: Lecture Notes in Engineering and Computer Science: Proceedings of The World Congress on Engineering and Computer Science 2016, pp 458-463

Laurinec P, Loderer M, Vrablecova P, Lucka M, Rozinajova V, Ezzeddine AB (2016)
Adaptive time series forecasting of energy consumption using optimized cluster analysis.
In: Data Mining Workshops (ICDMW), 2016 IEEE 16th International Conference on, IEEE, pp 398-405

Laurinec P, Lucká M (2018)
Clustering-based forecasting method for individual consumers electricity load using time series representations.
Open Comput Sci, 8(1):38–50, DOI: 10.1515/comp-2018-0006
}
\seealso{
\code{\link[TSrepr]{repr_gam}, \link[TSrepr]{repr_exp}}
}
\author{
Peter Laurinec, <tsreprpackage@gmail.com>
}
