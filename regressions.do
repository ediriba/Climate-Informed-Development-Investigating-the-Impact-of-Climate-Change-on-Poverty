clear
set more off
capture log close

cd "C:\Users\Ejig\Documents\Applied Economics MS\ECON 676 - Economic Development\Research Paper"
log using "finalfile_ediriba.smcl", text replace
use "cleandata.dta", replace
xtset country_code year
*****************************************************************************
*REGRESSIONS: 

*SEM builder:
sem (co2_emissions -> poverty_headcount, ) (precip -> poverty_headcount, ) (year -> poverty_headcount, ) (employment_agri -> poverty_headcount, ) (agri_value_add -> poverty_headcount, ) (temp_change_cel -> poverty_headcount, ), method(mlmv) nocapslatent
    

*Model 1:
reg poverty_headcount co2_emissions precip year agri_value_add employment_agri temp_change_cel if income_class<4, robust
est sto reg2

*Model2:
reg poverty_headcount co2_emissions precip year agri_value_add employment_agri temp_change_cel, robust
est sto reg1

esttab reg1 reg2, se star(* 0.1 ** 0.05 *** 0.01) stats (N r2 r2_a) mtitle("OLS (All)" "OLS (Low-Middle Income)") varlabels(_cons "Intercept" co2_emissions "CO2 Emissions" precip "Annual Precipitation" year "Year" agri_value_add "Agricultural Value Add" employment_agri"Share of Employment in Agri, Forestry, Fishing" temp_change_cel "Annual Temperature Change C")

********************************************************************************8
*GRAPHICS:


use "cleandata.dta", replace
xtset country_code year 

*Graph for poverty headcount ratio for low- and middle-income countries
twoway (line poverty_headcount year if country_code==1, sort) || ///
       (line poverty_headcount year if country_code==2, sort) || ///
       (line poverty_headcount year if country_code==3, sort) || ///
       (line poverty_headcount year if country_code==5, sort) || ///
       (line poverty_headcount year if country_code==6, sort) || ///
       (line poverty_headcount year if country_code==7, sort) || ///
       (line poverty_headcount year if country_code==8, sort) || ///
       (line poverty_headcount year if country_code==9, sort) || ///
       (line poverty_headcount year if country_code==11, sort) || ///
       (line poverty_headcount year if country_code==12, sort) || ///
       (line poverty_headcount year if country_code==13, sort) || ///
       (line poverty_headcount year if country_code==16, sort), ///
       ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) ///
       legend(order(1 "Afghanistan" 2 "Egypt" 3 "India" ///
                    5 "Kenya" 6 "Mexico" 7 "Mozambique" 8 "Namibia" ///
                    9 "Nepal" 11 "South Africa" 12 "Sudan" ///
                    13 "Turkey" 16 "Yemen")) ///
       title("Poverty Headcount for Low- Middle-Income Countries")


***************************************************************************
*CO2 emissions per country
twoway (line co2_emissions year if country_code==1, sort lc(blue)) || ///
       (line co2_emissions year if country_code==2, sort lc(red)) || ///
       (line co2_emissions year if country_code==3, sort lc(green)) || ///
       (line co2_emissions year if country_code==4, sort lc(yellow)) || ///
       (line co2_emissions year if country_code==5, sort lc(purple)) || ///
       (line co2_emissions year if country_code==6, sort lc(orange)) || ///
       (line co2_emissions year if country_code==7, sort lc(cyan)) || ///
       (line co2_emissions year if country_code==8, sort lc(magenta)) || ///
       (line co2_emissions year if country_code==9, sort lc(gray)) || ///
       (line co2_emissions year if country_code==10, sort lc(lime)) || ///
       (line co2_emissions year if country_code==11, sort lc(brown)) || ///
       (line co2_emissions year if country_code==12, sort lc(darkgreen)) || ///
       (line co2_emissions year if country_code==13, sort lc(darkblue)) || ///
       (line co2_emissions year if country_code==14, sort lc(darkgray)) || ///
       (line co2_emissions year if country_code==15, sort lc(pink)) || ///
       (line co2_emissions year if country_code==16, sort lc(lightblue)), ///
       title("CO2 Emissions between 1990-2021") ///
       ytitle(CO2 emissions) ylabel(0(.8)1.7) xtitle(Year) xlabel(#4) ///
       legend(order(1 "Afghanistan" 2 "Egypt" 3 "India" ///
                    4 "Japan" 5 "Kenya" 6 "Mexico" 7 "Mozambique" 8 "Namibia" ///
                    9 "Nepal" 10 "Qatar" 11 "South Africa" 12 "Sudan" ///
                    13 "Turkey" 14 "United Kingdom" 15 "United States" 16 "Yemen"))


*************************************************
*Precipitation:
twoway (line precip year if country_code==1, sort lc(blue)) || ///
       (line precip year if country_code==2, sort lc(red)) || ///
       (line precip year if country_code==3, sort lc(green)) || ///
       (line precip year if country_code==4, sort lc(yellow)) || ///
       (line precip year if country_code==5, sort lc(purple)) || ///
       (line precip year if country_code==6, sort lc(orange)) || ///
       (line precip year if country_code==7, sort lc(cyan)) || ///
       (line precip year if country_code==8, sort lc(magenta)) || ///
       (line precip year if country_code==9, sort lc(gray)) || ///
       (line precip year if country_code==10, sort lc(lime)) || ///
       (line precip year if country_code==11, sort lc(brown)) || ///
       (line precip year if country_code==12, sort lc(darkgreen)) || ///
       (line precip year if country_code==13, sort lc(darkblue)) || ///
       (line precip year if country_code==14, sort lc(darkgray)) || ///
       (line precip year if country_code==15, sort lc(pink)) || ///
       (line precip year if country_code==16, sort lc(lightblue)), ///
       title("Precipitation between 1990-2021") ///
       ytitle(Annual Precipitation (mm)) ylabel(0(500)2000) xtitle(Year) xlabel(#4) ///
       legend(order(1 "Afghanistan" 2 "Egypt" 3 "India" ///
                    4 "Japan" 5 "Kenya" 6 "Mexico" 7 "Mozambique" 8 "Namibia" ///
                    9 "Nepal" 10 "Qatar" 11 "South Africa" 12 "Sudan" ///
                    13 "Turkey" 14 "United Kingdom" 15 "United States" 16 "Yemen")) 

log close
