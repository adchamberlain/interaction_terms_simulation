# interaction_terms_simulation
R simulation to illustrate how changes in estimated gender pay gaps in an excluded reference industry do not impact pay gap estimates in other sectors (when estimating pay gaps via male x industry interaction terms). 

Data files consists of three industries (A, B, C) with 30 workers each, 15 male and 15 female. `data.csv` has a 5 percent gender pay gap in Industry A, while `data_alt.csv` has a 10 percent pay gap for Industry A. `simulation.xlsx` is an Excel workbook allowing you to easily change these parameters and generate new data files. 

`simulation.R` shows how the estimated pay gap in Industry B and C do not change when the pay gap in the omitted reference category of Industry A changes. 
