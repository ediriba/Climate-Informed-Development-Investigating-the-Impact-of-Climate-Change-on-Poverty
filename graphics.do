clear
set more off
capture log close

cd "C:\Users\Ejig\Documents\Applied Economics MS\ECON 676 - Economic Development\Research Paper"

use "cleandata.dta", replace
xtset country_code year 
*****************************************************************************

*Dependent variable: Poverty headcount ratio at $3.65 a day (% of pop)
twoway (line poverty_headcount year if country_code==1, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Afghanistan)
graph save "Graph" "Graphs/pov_afghanistan.gph", replace

twoway (line poverty_headcount year if country_code==7, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Mozambique)
graph save "Graph" "Graphs/pov_mozambique.gph", replace

twoway (line poverty_headcount year if country_code==12, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Sudan)
graph save "Graph" "Graphs/pov_sudan.gph", replace

twoway (line poverty_headcount year if country_code==16, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Yemen)
graph save "Graph" "Graphs/pov_yemen.gph", replace

twoway (line poverty_headcount year if country_code==2, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Egypt)
graph save "Graph" "Graphs/pov_egypt.gph", replace

twoway (line poverty_headcount year if country_code==3, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(India)
graph save "Graph" "Graphs/pov_india.gph", replace

twoway (line poverty_headcount year if country_code==5, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Kenya)
graph save "Graph" "Graphs/pov_kenya.gph", replace

twoway (line poverty_headcount year if country_code==8, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Namibia)
graph save "Graph" "Graphs/pov_namibia.gph", replace

twoway (line poverty_headcount year if country_code==9, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Nepal)
graph save "Graph" "Graphs/pov_nepal.gph", replace

twoway (line poverty_headcount year if country_code==6, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Mexico)
graph save "Graph" "Graphs/pov_mexico.gph", replace

twoway (line poverty_headcount year if country_code==11, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(South Africa)
graph save "Graph" "Graphs/pov_south_africa.gph", replace

twoway (line poverty_headcount year if country_code==13, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Turkey)
graph save "Graph" "Graphs/pov_turkey.gph", replace

twoway (line poverty_headcount year if country_code==4, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Japan)
graph save "Graph" "Graphs/pov_japan.gph", replace

twoway (line poverty_headcount year if country_code==10, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(Qatar)
graph save "Graph" "Graphs/pov_qatar.gph", replace

twoway (line poverty_headcount year if country_code==14, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(United Kingdom)
graph save "Graph" "Graphs/pov_united_kingdom.gph", replace

twoway (line poverty_headcount year if country_code==15, sort), ytitle(% of Pop.) ylabel(0(50)100) xtitle(Year) xlabel(#4) title(United States)
graph save "Graph" "Graphs/pov_united_states.gph", replace

cd "Graphs/"
graph combine pov_afghanistan.gph pov_mozambique.gph pov_sudan.gph pov_yemen.gph pov_egypt.gph pov_india.gph pov_kenya.gph pov_namibia.gph pov_nepal.gph pov_mexico.gph pov_south_africa.gph pov_turkey.gph pov_japan.gph pov_qatar.gph pov_united_kingdom.gph pov_united_states.gph, col(4) xsize(16) ysize(16) xcommon ycommon note("Source: World Bank WDI Database") title("Poverty Headcount Ratio at $3.65 a day between 1990-2021", size(small))
graph save "Graph" "pov_all.gph", replace

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
clear
cd "C:\Users\Ejig\Documents\Applied Economics MS\ECON 676 - Economic Development\Research Paper"
use "raw_data.dta", replace
xtset country_code year 

*CO2 emissions per country
*Afghanistan:
twoway (line co2_emissions year if country_code==1, sort), ytitle(CO2 emissions) ylabel(0(.8)1.7) xtitle(Year) xlabel(#4) title(Afghanistan)
graph save "Graph" "Graphs/co2_afghanistan.gph", replace

*Egypt:
twoway (line co2_emissions year if country_code==2, sort), ytitle(CO2 emissions) ylabel(0(.8)1.7) xtitle(Year) xlabel(#4) title(Egypt)
graph save "Graph" "Graphs/co2_egypt.gph", replace

*India:
twoway (line co2_emissions year if country_code==3, sort), ytitle(CO2 emissions) ylabel(0(.8)1.7) xtitle(Year) xlabel(#4) title(India)
graph save "Graph" "Graphs/co2_india.gph", replace

*Japan:
twoway (line co2_emissions year if country_code==4, sort), ytitle(CO2 emissions) ylabel(0(.8)1.7) xtitle(Year) xlabel(#4) title(Japan)
graph save "Graph" "Graphs/co2_japan.gph", replace

*Kenya:
twoway (line co2_emissions year if country_code==5, sort), ytitle(CO2 emissions) ylabel(0(.8)1.7) xtitle(Year) xlabel(#4) title(Kenya)
graph save "Graph" "Graphs/co2_kenya.gph", replace

*Mexico:
twoway (line co2_emissions year if country_code==6, sort), ytitle(CO2 emissions) ylabel(0(.8)1.7) xtitle(Year) xlabel(#4) title(Mexico)
graph save "Graph" "Graphs/co2_mexico.gph", replace

*Mozambique
twoway (line co2_emissions year if country_code == 7, sort), ytitle("CO2 Emissions") ylabel(0(.8)1.7) xtitle("Year") xlabel(#4) title("Mozambique")
graph save "Graph" "Graphs/co2_mozambique.gph", replace

*Namibia
twoway (line co2_emissions year if country_code == 8, sort), ytitle("CO2 Emissions") ylabel(0(.8)1.7) xtitle("Year") xlabel(#4) title("Namibia")
graph save "Graph" "Graphs/co2_namibia.gph", replace

*Nepal
twoway (line co2_emissions year if country_code == 9, sort), ytitle("CO2 Emissions") ylabel(0(.8)1.7) xtitle("Year") xlabel(#4) title("Nepal")
graph save "Graph" "Graphs/co2_nepal.gph", replace

*Qatar
twoway (line co2_emissions year if country_code == 10, sort), ytitle("CO2 Emissions") ylabel(0(.8)1.7) xtitle("Year") xlabel(#4) title("Qatar")
graph save "Graph" "Graphs/co2_qatar.gph", replace

*South Africa
twoway (line co2_emissions year if country_code == 11, sort), ytitle("CO2 Emissions") ylabel(0(.8)1.7) xtitle("Year") xlabel(#4) title("South Africa")
graph save "Graph" "Graphs/co2_south_africa.gph", replace

*Sudan
twoway (line co2_emissions year if country_code == 12, sort), ytitle("CO2 Emissions") ylabel(0(.8)1.7) xtitle("Year") xlabel(#4) title("Sudan")
graph save "Graph" "Graphs/co2_sudan.gph", replace

*Turkey
twoway (line co2_emissions year if country_code == 13, sort), ytitle("CO2 Emissions") ylabel(0(.8)1.7) xtitle("Year") xlabel(#4) title("Turkey")
graph save "Graph" "Graphs/co2_turkey.gph", replace

*United Kingdom
twoway (line co2_emissions year if country_code == 14, sort), ytitle("CO2 Emissions") ylabel(0(.8)1.7) xtitle("Year") xlabel(#4) title("United Kingdom")
graph save "Graph" "Graphs/co2_united_kingdom.gph", replace

*United States
twoway (line co2_emissions year if country_code == 15, sort), ytitle("CO2 Emissions") ylabel(0(.8)1.7) xtitle("Year") xlabel(#4) title("United States")
graph save "Graph" "Graphs/co2_united_states.gph", replace

*Yemen
twoway (line co2_emissions year if country_code == 16, sort), ytitle("CO2 Emissions") ylabel(0(.8)1.7) xtitle("Year") xlabel(#4) title("Yemen")
graph save "Graph" "Graphs/co2_yemen.gph", replace


* Combine all graphs onto a panel
cd "Graphs/"
graph combine co2_afghanistan.gph co2_mozambique.gph co2_sudan.gph co2_yemen.gph co2_egypt.gph co2_india.gph co2_kenya.gph co2_namibia.gph co2_nepal.gph co2_mexico.gph co2_south_africa.gph co2_turkey.gph co2_japan.gph co2_qatar.gph co2_united_kingdom.gph co2_united_states.gph, col(4) xsize(16) ysize(16) xcommon ycommon note("Source: World Bank Sustainable Development Goals Database") title("CO2 Emissions between 1990-2021") 
graph save "Graph" "co2_all.gph", replace


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
clear 
use "raw_data.dta"

*Change in temperature per country (celsius)
twoway (line temp_change_cel year if country_code == 1, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Afghanistan")
graph save "Graph" "Graphs/afghanistan_tempchange.gph", replace

twoway (line temp_change_cel year if country_code == 2, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Egypt")
graph save "Graph" "Graphs/egypt_tempchange.gph", replace

twoway (line temp_change_cel year if country_code == 3, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("India")
graph save "Graph" "Graphs/india_tempchange.gph", replace

twoway (line temp_change_cel year if country_code == 4, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Japan")
graph save "Graph" "Graphs/japan_tempchange.gph", replace

twoway (line temp_change_cel year if country_code == 5, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Kenya")
graph save "Graph" "Graphs/kenya_tempchange.gph", replace

*Mexico
twoway (line temp_change_cel year if country_code == 6, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Mexico")
graph save "Graph" "Graphs/mexico_tempchange.gph", replace

*Mozambique
twoway (line temp_change_cel year if country_code == 7, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Mozambique")
graph save "Graph" "Graphs/mozambique_tempchange.gph", replace

*Namibia
twoway (line temp_change_cel year if country_code == 8, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Namibia")
graph save "Graph" "Graphs/namibia_tempchange.gph", replace

*Nepal
twoway (line temp_change_cel year if country_code == 9, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Nepal")
graph save "Graph" "Graphs/nepal_tempchange.gph", replace

*Qatar
twoway (line temp_change_cel year if country_code == 10, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Qatar")
graph save "Graph" "Graphs/qatar_tempchange.gph", replace

*South Africa
twoway (line temp_change_cel year if country_code == 11, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("South Africa")
graph save "Graph" "Graphs/southafrica_tempchange.gph", replace

*Sudan
twoway (line temp_change_cel year if country_code == 12, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Sudan")
graph save "Graph" "Graphs/sudan_tempchange.gph", replace

*Turkey
twoway (line temp_change_cel year if country_code == 13, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Turkey")
graph save "Graph" "Graphs/turkey_tempchange.gph", replace

*United Kingdom
twoway (line temp_change_cel year if country_code == 14, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("United Kingdom")
graph save "Graph" "Graphs/uk_tempchange.gph", replace

*United States
twoway (line temp_change_cel year if country_code == 15, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("United States")
graph save "Graph" "Graphs/us_tempchange.gph", replace

*Yemen
twoway (line temp_change_cel year if country_code == 16, sort), ytitle("Change in Celsius") ylabel(-1.3(2)2.6) xtitle("Year") xlabel(#4) title("Yemen")
graph save "Graph" "Graphs/yemen_tempchange.gph", replace

* Combine all graphs onto a panel
cd "Graphs/"
graph combine afghanistan_tempchange.gph mozambique_tempchange.gph sudan_tempchange.gph yemen_tempchange.gph egypt_tempchange.gph india_tempchange.gph kenya_tempchange.gph namibia_tempchange.gph nepal_tempchange.gph mexico_tempchange.gph southafrica_tempchange.gph turkey_tempchange.gph japan_tempchange.gph qatar_tempchange.gph  uk_tempchange.gph us_tempchange.gph, col(4) xsize(16) ysize(16) xcommon ycommon note("Source: FAO Statistics Database") title("Temperature Change between 1990-2021") 
graph save "Graph" "tempchange_all.gph", replace

********************************************8
use "raw_data.dta", clear

*Agriculture, forestry, fishing, value add (% of GDP):

*Afghanistan
twoway (line agri_value_add year if country_code == 1, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Afghanistan")
graph save "Graph" "Graphs/afghanistan_agri_value.gph", replace

*Mozambique
twoway (line agri_value_add year if country_code == 7, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Mozambique")
graph save "Graph" "Graphs/mozambique_agri_value.gph", replace

*Sudan
twoway (line agri_value_add year if country_code == 12, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Sudan")
graph save "Graph" "Graphs/sudan_agri_value.gph", replace

*Yemen
twoway (line agri_value_add year if country_code == 16, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Yemen")
graph save "Graph" "Graphs/yemen_agri_value.gph", replace

*Egypt
twoway (line agri_value_add year if country_code == 2, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Egypt")
graph save "Graph" "Graphs/egypt_agri_value.gph", replace

*India
twoway (line agri_value_add year if country_code == 3, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("India")
graph save "Graph" "Graphs/india_agri_value.gph", replace

*Kenya
twoway (line agri_value_add year if country_code == 5, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Kenya")
graph save "Graph" "Graphs/kenya_agri_value.gph", replace

*Namibia
twoway (line agri_value_add year if country_code == 8, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Namibia")
graph save "Graph" "Graphs/namibia_agri_value.gph", replace

*Nepal
twoway (line agri_value_add year if country_code == 9, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Nepal")
graph save "Graph" "Graphs/nepal_agri_value.gph", replace

*Mexico
twoway (line agri_value_add year if country_code == 6, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Mexico")
graph save "Graph" "Graphs/mexico_agri_value.gph", replace

*South Africa
twoway (line agri_value_add year if country_code == 11, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("South Africa")
graph save "Graph" "Graphs/southafrica_agri_value.gph", replace

*Turkey
twoway (line agri_value_add year if country_code == 13, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Turkey")
graph save "Graph" "Graphs/turkey_agri_value.gph", replace

twoway (line agri_value_add year if country_code == 4, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Japan")
graph save "Graph" "Graphs/japan_agri_value.gph", replace

twoway (line agri_value_add year if country_code == 10, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("Qatar")
graph save "Graph" "Graphs/qatar_agri_value.gph", replace

twoway (line agri_value_add year if country_code == 14, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("United Kingdom")
graph save "Graph" "Graphs/uk_agri_value.gph", replace

twoway (line agri_value_add year if country_code == 15, sort), ytitle("Value Add % of GDP") ylabel(0(25)50) xtitle("Year") xlabel(#4) title("United States")
graph save "Graph" "Graphs/us_agri_value.gph", replace


* Combine all graphs onto a panel
cd "Graphs/"
graph combine afghanistan_agri_value.gph mozambique_agri_value.gph sudan_agri_value.gph yemen_agri_value.gph egypt_agri_value.gph india_agri_value.gph kenya_agri_value.gph namibia_agri_value.gph nepal_agri_value.gph mexico_agri_value.gph southafrica_agri_value.gph turkey_agri_value.gph japan_agri_value.gph qatar_agri_value.gph uk_agri_value.gph us_agri_value.gph, col(4) xsize(16) ysize(16) xcommon ycommon note("Source: FAO Statistics Database") title("Agriculture, Forestry, Fishing Production (1990-2021)", size(small)) 
graph save "Graph" "agri_value_all.gph", replace


*Summary statistics:
clear
cd "C:\Users\Ejig\Documents\Applied Economics MS\ECON 676 - Economic Development\Research Paper"

use "raw_data.dta", replace
xtset country_code year

collapse population gni_per_capita poverty_headcount agri_value_add employment_agri temp_change_cel, by(country_code country)
asdoc tabstat gni_per_capita poverty_headcount employment_agri population temp_change_cel agri_value_add, by(country)

tabstat csp csp_years totyrsedu completed_prim completed_sec completed_uni age sex numsibs mom_highestedu dad_highestedu, stats(sd) 


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









