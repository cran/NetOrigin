% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_mu_lambda.R
\name{compute_mu_lambda}
\alias{compute_mu_lambda}
\title{Compute Mu and Lambda for Source Detection Function}
\usage{
compute_mu_lambda(train.data, obs.vec, candidate.thres)
}
\arguments{
\item{train.data}{training data for 'mu' and 'lambda' list computation
format-list, length-number of cities/nodes
format of train.data[[i]]- number of simulated scenarios x number of cities/nodes}

\item{obs.vec}{list of cities ids used as observers}

\item{candidate.thres}{threshold to determine if a node/city could be a candidate for source
e.g. if we set this number to be 0.2, if in [x] simulated scenarios, there are only 10 percent
scenarios a node [a] is infected, we do not think [a] is a potential source}
}
\value{
a list, consisting of 3 variables: mu.mat, lambda.list, poss.candidate.vec
        mu.mat: matrix- number of cities/nodes x number of observers, each row represents- 
        if this node is the source, the mean of arrival time vector;
        lambda.list: a length-number of cities/nodes list, each element is a number of observers x number of observers matrix-
        if a node is the source, the covariance matrix for arrival time vector;
        poss.candidate.vec: a boolean vector indicating if a node has the potential to be the source
}
\description{
\code{compute_mu_lambda} computes 'mu' and 'lambda' from training data and 
selected observers, for Gaussian source estimation with prior information
}
\examples{
library(NetOrigin)
# load training data
load('.../train_data.rda')
obs.vec <- (1:9)
candidate.thres <- 0.3
mu.lambda.list <- compute_mu_lambda(train.data, obs.vec, candidate.thres)
}