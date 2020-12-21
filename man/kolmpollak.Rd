\name{kolmpollak}
\alias{kolmpollak}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Kolm-Pollak Equally-Distributed Equivalent and Inequality Index
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
These functions are the Kolm-Pollak measure of a distribution's inequality. While other metrics, such as the Atkinson, are only suited for distributions of desirable quantities, the Kolm-Pollak can be used for distributions of desirable quantities (e.g., income) and undesirable quantities (e.g., health risk).
The Kolm-Pollak functions are also separable, meaning they can be used to evaluate subgroups and thus evaluate the inequity of the distribution.
}
\usage{
ede(a, epsilon=NULL, kappa=NULL, weights=NULL)
index(a, epsilon=NULL, kappa=NULL, weights=NULL)
calc_kappa(a, epsilon=NULL, weights=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
%%     ~~Describe \code{x} here~~
the values distributed throughout the population: a list or data frame column
}
  \item{w}{
weighting. 1-D array of integer weights associated with the values in `a`. Each value in `a` contributes to the average according to its associated weight. A list or data frame column the same length as `a`. If `weights=None`, then all data in `a` are assumed to have a weight equal to one.
  }
  \item{epsilon}{
Atkinson aversion parameter. Float. If epsilon > 0 then the quantity is desirable (more is better).
  }
  \item{kappa}{
Kolm-Pollak aversion parameter. Float. If kappa > 0 then the quantity is desirable (more is better).
  }
}

\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{ede}{The Kolm-Pollak equally-distributed equivalent}
\item{index}{The Kolm-Pollak inequality index}
\item{kappa}{The inequality aversion parameter for the Kolm-Pollak formulae}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
Logan, T. M., Anderson, M. J., Williams, T., & Conrow, L. (2020). Measuring inequalities in urban systems: An approach for evaluating the distribution of amenities and burdens. Computers, Environmental, and Urban Systems.

Sheriff, G., & Maguire, K. B. (2020). Health Risk, Inequality Indexes, and Environmental Justice. Risk Analysis: An Official Publication of the Society for Risk Analysis. https://doi.org/10.1111/risa.13562
}
\author{
%%  ~~who you are~~
Tom Logan (tom.logan@canterbury.ac.nz)
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
For Python implementation, see https://pypi.org/project/inequalipy/
}
\examples{
## Lists
a <- rnorm(50, mean=50, sd=10)
w <- sample(50)
ede(a, epsilon=0.5, weights=w)
index(a, epsilon=0.5, weights=w)

## Dataframes
a <- rnorm(50, mean=50, sd=10)
w <- sample(50)
df <- data.frame(a,w)
ede(df['a'], epsilon=0.5, weights=df['w'])
index(df['a'], epsilon=0.5, weights=df['w'])

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{inequality}% use one of  RShowDoc("KEYWORDS")
\keyword{inequity}% __ONLY ONE__ keyword per line
\keyword{equality}% __ONLY ONE__ keyword per line
