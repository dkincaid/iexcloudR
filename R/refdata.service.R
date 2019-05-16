#' This call returns an array of symbols that IEX Cloud supports for API calls.
#'
#' Data Weighting:
#' - symbols, otc, mutual-fund: 100 message units per call
#' - iex: free;
#'   This call returns an array of symbols the Investors Exchange supports for trading.
#'    This list is updated daily as of 7:45 a.m. ET. Symbols may be added or removed by
#'    the Investors Exchange after the list was produced.
#'
#' @param symbolType "symbols" | "iex" | "otc" | "mutual-fund" |
#' @return a dataframe
#' @export
#' @examples
#' symbols("iex")
listSymbols <- function (symbolType = "symbols") {
  if (symbolType == 'symbols') {
    endpoint = '/ref-data/symbols'
  } else {
    endpoint <- glue::glue('/ref-data/{symbolType}/symbols');
  }
  res = iex(endpoint);
  tibble::as_tibble(do.call(rbind,res)) %>% tidyr::unnest()
};

#' dataframe of all symbols IEx supports for trading
#'
#' @export
iexSymbols <- function(){
  endpoint <- "/ref-data/iex/symbols"
  res = iex(endpoint)
  tibble::as_tibble(do.call(rbind,res)) %>% tidyr::unnest()
}

#' @export
iexExchanges <- function() {
  endpoint <- "/ref-data/exchanges";
  res = iex(endpoint)
  tibble::as_tibble(do.call(rbind,res)) %>% tidyr::unnest()
}

#' @export
regionSymbols <- function( region = "US"){
  endpoint <- glue::glue("/ref-data/region/{region}/symbols");
  res = iex(endpoint)
  tibble::as_tibble(do.call(rbind,res)) %>% tidyr::unnest()
}

#' @export
allregionSymbols <- function() {
  ex <- iexExchanges();
  ex <- unique(ex$region)
  res <- lapply(ex,regionSymbols);
  res %>% tibble::enframe() %>% tidyr::unnest()
}