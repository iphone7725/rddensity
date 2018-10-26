********************************************************************************
** RDDENSITY Stata Package  
** Do-file for Empirical Illustration
** Authors: Matias D. Cattaneo, Michael Jansson and Xinwei Ma
********************************************************************************
** hlp2winpdf, cdn(rddensity) replace
** hlp2winpdf, cdn(rdbwdensity) replace
********************************************************************************
** net install rddensity, from(https://sites.google.com/site/rdpackages/rddensity/stata) replace
********************************************************************************
clear all
set more off
set linesize 200
mata: mata mlib index
set scheme sj

********************************************************************************
** Summary Stats
********************************************************************************
sjlog using output/out0, replace
use rddensity_senate.dta, clear
sum margin
sjlog close, replace

********************************************************************************
** rddensity: default options
********************************************************************************
sjlog using output/out1, replace
rddensity margin
sjlog close, replace

********************************************************************************
** rddensity: with plot
********************************************************************************
net install lpdensity, from(https://sites.google.com/site/nppackages/lpdensity/stata) replace
sjlog using output/out2, replace
rddensity margin, plot
graph export output/figure1.pdf, replace
sjlog close, replace

********************************************************************************
** rddensity: with plot and graph_options
********************************************************************************
sjlog using output/out3, replace
rddensity margin, plot ///
                  graph_options(graphregion(color(white)) ///
				  xtitle("Margin of Victory") ytitle("Density") legend(off))
graph export output/figure2.pdf, replace
sjlog close, replace

********************************************************************************
** rddensity: all statistics & default options
********************************************************************************
sjlog using output/out4, replace
rddensity margin, all
sjlog close, replace

********************************************************************************
** rddensity: default statistic, restricted model & plugin standard errors
********************************************************************************
sjlog using output/out5, replace
rddensity margin, fitselect(restricted) vce(plugin)
sjlog close, replace

********************************************************************************
** rdbwdensity: default options
********************************************************************************
sjlog using output/out6, replace
rdbwdensity margin
sjlog close, replace

********************************************************************************
** rdbwdensity: compute bandwidth and then use them
********************************************************************************
sjlog using output/out7, replace
qui rdbwdensity margin
mat h = e(h)
local hr = h[2,1]
rddensity margin, h(10 `hr')
sjlog close, replace

********************************************************************************
** Other examples
********************************************************************************
rddensity margin, kernel(uniform)
rddensity margin, bwselect(diff)
rddensity margin, h(10 15)
rddensity margin, p(2) q(4)
rddensity margin, c(5) all

rdbwdensity margin, p(3) fitselect(restricted)
rdbwdensity margin, kernel(uniform) vce(jackknife)



