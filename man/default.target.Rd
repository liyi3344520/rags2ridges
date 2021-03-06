\name{default.target}
\alias{default.target}
\title{
Generate a (data-driven) default target for usage in ridge-type shrinkage estimation
}
\description{
Function that generates a (data-driven) default target for usage in (type I) ridge shrinkage estimation of the precision matrix (see \code{\link{ridgeP}}).
The target that is generated is to be understood in precision terms.
Most options for target generation result in a target that implies a situation of rotation equivariant estimation (see \code{\link{ridgeP}}).
}
\usage{
default.target(S, type = "DAIE", fraction = 1e-04, const)
}
\arguments{
  \item{S}{
Sample covariance \code{matrix}.
}
  \item{type}{
A \code{character} determining the type of default target. Must be one of: "DAIE", "DIAES", "DUPV", "DAPV", "DCPV", "DEPV", "Null".
}
  \item{fraction}{
A \code{numeric} indicating the fraction of the largest eigenvalue below which an eigenvalue is considered zero.
}
  \item{const}{
A \code{numeric} constant representing the partial variance.
}
}
\details{
The function can generate the following default target matrices:
\itemize{
\item \code{DAIE}: Diagonal matrix with average of inverse nonzero eigenvalues of S as entries;
\item \code{DIAES}: Diagonal matrix with inverse of average of eigenvalues of S as entries;
\item \code{DUPV}: Diagonal matrix with unit partial variance as entries (identity matrix);
\item \code{DAPV}: Diagonal matrix with average of inverse variances of \code{S} as entries;
\item \code{DCPV}: Diagonal matrix with constant partial variance as entries. Allows one to use other constant than DAIE, DIAES, DUPV, DAPV, and in a sense Null;
\item \code{DEPV}: Diagonal matrix with the inverse variances of \code{S} as entries;
\item \code{Null}: Null matrix.
}
The targets \code{DUPV}, \code{DCPV}, and \code{Null} are not data-driven in the sense that the input matrix \code{S} only provides information on the size of the desired target.
The targets \code{DAIE}, \code{DIAES}, \code{DAPV}, and \code{DEPV} are data-driven in the sense that the input matrix \code{S} provides the information for the diagonal entries.
The argument \code{fraction} is only used when \code{type = "DAIE"}. The argument \code{const} is only used when \code{type = "DCPV"}.
All types except \code{DEPV} and \code{Null} lead to rotation equivariant alternative and archetypal Type I ridge estimators.
The target \code{Null} also leads to a rotation equivariant alternative Type II ridge estimator (see \code{\link{ridgeP}}).
Note that the \code{DIAES}, \code{DAPV}, and \code{DEPV} targets amount to the identity matrix when the sample covariance matrix \code{S} is standardized to be the correlation matrix.
The same goes, naturally, for the \code{DCPV} target when \code{const} is specified to be 1.
}
\value{
Function returns a target \code{matrix}.
}
\author{
Carel F.W. Peeters <cf.peeters@vumc.nl>, Wessel N. van Wieringen
}
\references{
  van Wieringen, W.N. & Peeters, C.F.W. (2016).
  Ridge Estimation of Inverse Covariance Matrices from High-Dimensional Data,
  Computational Statistics & Data Analysis, vol. 103: 284-303.
  Also available as arXiv:1403.0904v3 [stat.ME].
}
\seealso{
\code{\link{ridgeP}}, \code{\link{covML}}
}
\examples{
## Obtain some (high-dimensional) data
p = 25
n = 10
set.seed(333)
X = matrix(rnorm(n*p), nrow = n, ncol = p)
colnames(X)[1:25] = letters[1:25]
Cx <- covML(X)

## Obtain default diagonal target matrix
default.target(Cx)
}
