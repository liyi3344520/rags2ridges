// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// armaRidgeS
arma::mat armaRidgeS(const arma::mat& S, const arma::mat& target, const double lambda);
RcppExport SEXP rags2ridges_armaRidgeS(SEXP SSEXP, SEXP targetSEXP, SEXP lambdaSEXP) {
BEGIN_RCPP
    SEXP __sexp_result;
    {
        Rcpp::RNGScope __rngScope;
        Rcpp::traits::input_parameter< const arma::mat& >::type S(SSEXP );
        Rcpp::traits::input_parameter< const arma::mat& >::type target(targetSEXP );
        Rcpp::traits::input_parameter< const double >::type lambda(lambdaSEXP );
        arma::mat __result = armaRidgeS(S, target, lambda);
        PROTECT(__sexp_result = Rcpp::wrap(__result));
    }
    UNPROTECT(1);
    return __sexp_result;
END_RCPP
}
