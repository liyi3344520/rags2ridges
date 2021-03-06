\name{Union}
\alias{Union}
\title{
Subset 2 square matrices to union of variables having nonzero entries
}
\description{
Convenience function that subsets 2 square matrices (over the same features) to the union of features that have nonzero row (column) entries (i.e., features implied in graphical connections).
}
\usage{
Union(M1, M2)
}
\arguments{
  \item{M1}{
(Possibly sparsified) square \code{matrix}.
}
  \item{M2}{
(Possibly sparsified) square \code{matrix} over the same features as \code{M1}.
}
}
\details{
Say you have 2 class-specific precision matrices that are estimated over the same variables/features.
For various reasons (such as, e.g., the desire to visualize pruned class-specific networks in the same coordinates) one may want to prune these matrices to those features that are implied in graphical connections in at least 1 class.
}
\value{
An object of class list:
\item{M1subset}{A pruned \code{matrix} for class 1.}
\item{M2subset}{A pruned \code{matrix} for class 2.}
}
\author{
Carel F.W. Peeters <cf.peeters@vumc.nl>
}
\seealso{
\code{\link{Ugraph}}
}
\examples{
## Invoke data
data(ADdata)

## Subset
ADclass1 <- ADmetabolites[, sampleInfo$ApoEClass == "Class 1"]
ADclass2 <- ADmetabolites[, sampleInfo$ApoEClass == "Class 2"]

## Transpose data
ADclass1 <- t(ADclass1)
ADclass2 <- t(ADclass2)

## Correlations for subsets
rAD1 <- cor(ADclass1)
rAD2 <- cor(ADclass2)

## Simple precision estimates
P1 <- ridgeP(rAD1, 2)
P2 <- ridgeP(rAD2, 2)
Plist = list(P1 = P1, P2 = P2)

## Threshold matrices
Mats <- sparsify.fused(Plist, threshold = "top", top = 20)

## Prune sparsified partial correlation matrices
## To union of features implied by edge
MatsPrune <- Union(Mats$P1$sparseParCor, Mats$P2$sparseParCor)
}
