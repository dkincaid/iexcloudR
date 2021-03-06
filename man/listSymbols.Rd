% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/refdata.service.R
\name{listSymbols}
\alias{listSymbols}
\title{This call returns an array of symbols that IEX Cloud supports for API calls.}
\usage{
listSymbols(symbolType = "symbols")
}
\arguments{
\item{symbolType}{"symbols" | "iex" | "otc" | "mutual-fund" |}
}
\value{
a dataframe
}
\description{
Data Weighting:
\itemize{
\item symbols, otc, mutual-fund: 100 message units per call
\item iex: free;
This call returns an array of symbols the Investors Exchange supports for trading.
This list is updated daily as of 7:45 a.m. ET. Symbols may be added or removed by
the Investors Exchange after the list was produced.
}
}
\examples{
listSymbols("iex")
}
