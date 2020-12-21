ede <- function(a, epsilon = NULL, kappa = NULL, weights = NULL)
{
# Compute the Kolm-Pollak Equally-Distributed Equivalent (EDE).
# The Kolm-Pollak EDE and Index are suitable for distributions of desirable and
# undesirable quantities. That is, a desirable quantity (like income) is where
# having more of the quantity is desirable; compared with an undesirable
# quantity like health risk, where less is better.
#
# Parameters
# ----------
# a : array_like
# 1-D array containing the values of the distribution.
# epsilon : float
# The inequality aversion parameter from the Atkinson formulae.
# If epsilon > 0 then the quantity is desirable (more is better).
# kappa : float
# The inequality aversion parameter from the Kolm-Pollak formulae.
# If kappa > 0 then the quantity is desirable (more is better).
# weights : array_like, optional
# 1-D array of integer weights associated with the values in `a`. Each value in
# `a` contributes to the average according to its associated weight.
# If `weights=None`, then all data in `a` are assumed to have a
# weight equal to one.
#
# Returns
# -------
# value : float
# Returns the Kolm-Pollak Equally-Distributed Equivalent of the distribution provided.
  if (is.null(kappa)){
    if (is.null(epsilon)){
      stop("you must provide either an epsilon or kappa aversion parameter")
    }
    kappa <- calc_kappa(a, epsilon, weights)
  }
  if (is.null(weights)){
    ede_sum <- sum(exp(a*-kappa))
    N <- length(a)
  } else{
    ede_sum <- sum(exp(a*-kappa) * weights)
    N <- sum(weights)
  }
  (-1 / kappa) * log(ede_sum / N)
}

index <- function(a, epsilon = NULL, kappa = NULL, weights = NULL)
{
# Compute the Kolm-Pollak Index.
# The Kolm-Pollak EDE and Index are suitable for distributions of desirable and
# undesirable quantities. That is, a desirable quantity (like income) is where
# having more of the quantity is desirable; compared with an undesirable
# quantity like health risk, where less is better.
#
# Parameters
# ----------
# a : array_like
# 1-D array containing the values of the distribution.
# epsilon : float
# The inequality aversion parameter from the Atkinson formulae.
# If epsilon > 0 then the quantity is desirable (more is better).
# kappa : float
# The inequality aversion parameter from the Kolm-Pollak formulae.
# If kappa > 0 then the quantity is desirable (more is better).
# weights : array_like, optional
# 1-D array of integer weights associated with the values in `a`. Each value in
# `a` contributes to the average according to its associated weight.
# If `weights=None`, then all data in `a` are assumed to have a
# weight equal to one.
#
# Returns
# -------
# value : float
# Returns the Kolm-Pollak Index of the distribution provided.
  if (is.null(weights)){
    x_mean <- mean(a)
  } else{
    x_mean <- sum(a*weights)/sum(weights)
  }
  ede(a, epsilon = epsilon, kappa = kappa, weights = weights) - x_mean
}

calc_kappa <- function(a, epsilon, weights = NULL)
{
# Converts the inequality aversion parameter used in Atkinson's formulae (epsilon)
# into the form for the Kolm-Pollak formulae (kappa).
# If epsilon > 0 then the quantity is desirable (more is better).
#
# Parameters
# ----------
# a : array_like
# 1-D array containing the values of the distribution.
# epsilon : float
# The inequality aversion parameter from the Atkinson formulae.
# If epsilon > 0 then the quantity is desirable (more is better).
# weights : array_like, optional
# 1-D array of integer weights associated with the values in `a`. Each value in
# `a` contributes to the average according to its associated weight.
# If `weights=None`, then all data in `a` are assumed to have a
# weight equal to one.
#
# Returns
# -------
# value : float
# Returns the inequality aversion parameter for the Kolm-Pollak formulae
  if (is.null(weights)){
    x_sum <- sum(a)
    x_sq_sum <- sum(a**2)
  } else {
    x_sum <- sum(a * weights)
    x_sq_sum <- sum((a**2) * weights)
  }
  epsilon * (x_sum / x_sq_sum)
}
