# rddensity

The **rddensity** package provides **Stata** and **R** implementations of manipulation tests employing local polynomial density estimation methods. This method is useful for falsification of Regression Discontinuity Designs, as well as for testing for self-selection or sorting in other contexts. This implementation provides hypothesis tests and bandwidth selectors for manipulation testing. This work is supported by the National Science Foundation through grants `SES-1357561`, `SES-1459931` and `SES-1459967`.

For technical, methodological and implementation details see:

* Cattaneo, Jansson and Ma (2018): **Manipulation Testing based on Density Discontinuity**, Stata Journal 18(1): 234-261, 1st Quarter 2018.
* Cattaneo, Jansson and Ma (2017): **Simple Local Regression Distribution Estimators**, working paper. [Supplemental appendix]


**Implementation in Stata**

* To install/update in Stata type:

    	net install rddensity, from(https://sites.google.com/site/rdpackages/rddensity/stata) replace
  or  

		github install iphone7725/rddensity

* Help files: **rddensity**, **rdbwdensity** -- Replication files: **do-file**, **data-senate**
* Repository for manual installation: **https://sites.google.com/site/rdpackages/rddensity/stata**


**Implementation in R:**

* To install/update in R type:

		install.packages('rddensity')

* **Manual** -- Replication files: **Illustration**, **R-script**, **data-senate**
* **CRAN repository**


**Last update:** October 7, 2017. 