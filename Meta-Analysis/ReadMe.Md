# Sample Meta-Analysis Readme
Last Updated: August 28, 2018   
Language: R 

## Summary
The goal of this type of analyis is to aggregate the results of many experiments to understand the effect of a particular type of treatment on age, race, and gender subgroups. This helps us understand whether a particular treatment is effective for a subgroup, and whether its effect differs between subgroups. In this case, we are also interested in how adding additional data impacts the raw results and their statistical power. 

## Requirements
This analysis relies on R's meta package (documentation found [here](https://cran.r-project.org/web/packages/meta/index.html)). To install this requirement, run the following command in R or RStudio:
```install.packages('meta')```

## Instructions
This sample analysis can be run in RStudio to generate all data and results, or the pre-generated results can be viewed in the HTML documents. 

The analytical files of interest are located in the `analysis` directory. The files are numbered in the order that they should be run to generate the data and analysis.

* **01_generate_data.Rmd**: Generates the randomized data files that underly the remaining analysis.
* **02_graphs.Rmd**: Generates bar charts that show the aggregate effects by subgroup and allows side by side comparison between the "original" and "updated" analysis.
* **03_power_analysis.Rmd**: Calculates the statistical power of the subgroup comparison tests.
