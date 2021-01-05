# Kolm-Pollak Inequality measure
[Github Link for Pip version](https://github.com/urutau-nz/inequalipy)  
[Python Pip Link](https://pypi.org/project/inequalipy)  
[GitHub Link for R version](https://github.com/urutau-nz/kolmpollak-R)

Contains functions for the calculating the inequality of a distribution:
* Kolm-Pollak Equally-Distributed Equivalent (EDE) and Index

The Kolm-Pollak has recently been modified so that it is suitable for quantities that are undesirable, e.g., exposure to health risks or environmental burdens. This means it is suitable for use in urban planning contexts.  
The Kolm-Pollak functions are also separable, meaning they can be used to evaluate
subgroups and thus evaluate the inequity of the distribution.

When using this code, please cite the following two papers:
* Sheriff, G., & Maguire, K. B. (2020). Health Risk, Inequality Indexes, and Environmental Justice. _Risk Analysis: An Official Publication of the Society for Risk Analysis._ https://doi.org/10.1111/risa.13562
* Logan, T. M., Anderson, M. J., Williams, T. G., & Conrow, L. (2021). Measuring inequalities in urban systems: An approach for evaluating the distribution of amenities and burdens. Computers, Environment and Urban Systems, 86, 101590. https://doi.org/10.1016/j.compenvurbsys.2020.101590

### This library contains the following functions:
* `ede(a, epsilon, kappa, weights)` for calculating the Kolm-Pollak equally-distributed equivalent (EDE)
* `index(a, epsilon, kappa, weights)` for calculating the Kolm-Pollak inequality index


### Examples
Check out example.ipynb for examples or https://github.com/MitchellAnderson112/access_inequality_index for the function applied in Python.
