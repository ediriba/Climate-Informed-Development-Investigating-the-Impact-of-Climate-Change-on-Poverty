clear
set more off
capture log close

cd "C:\Users\gigi\Documents\ThinkPad_Backup_2024\Applied Economics MS\ECON 676 - Economic Development\Research Paper"

import excel "FAO WB Data Extract.xlsx", sheet("Sheet1") firstrow


* Create a new variable called "country_code" and assign numeric codes to the 16 countries
generate country_code = .
label var country_code "Numeric categorization of each country"
replace country_code = 1 if country == "Afghanistan"
replace country_code = 2 if country == "Egypt"
replace country_code = 3 if country == "India"
replace country_code = 4 if country == "Japan"
replace country_code = 5 if country == "Kenya"
replace country_code = 6 if country == "Mexico"
replace country_code = 7 if country == "Mozambique"
replace country_code = 8 if country == "Namibia"
replace country_code = 9 if country == "Nepal"
replace country_code = 10 if country == "Qatar"
replace country_code = 11 if country == "South Africa"
replace country_code = 12 if country == "Sudan"
replace country_code = 13 if country == "Turkey"
replace country_code = 14 if country == "United Kingdom"
replace country_code = 15 if country == "United States"
replace country_code = 16 if country == "Yemen"
xtset country_code year

drop gini_index energy_use spei

label variable employment_agri "Share of employment in agriculture, forestry, and fishing (% of total employment)"
label variable clean_fuels_access "Access to clean fuels and technologies for cooking (% of population)"
label variable nat_res_depletion "Adjusted savings: natural resources depletion (% of GNI)"
label variable co2_emissions "CO2 emissions (kg per 2015 US$ of GDP)"
label variable cereal_prod_index "Gross Cereal Production Index per capita"
label variable crop_prod_index "Gross Crop Production Index per capita"
label variable heat_index_35 "Heat Index 35"
label variable water_stress "Level of water stress: freshwater withdrawal as a proportion of available freshwater resources"
label variable population_density "Population density (people per sq. km of land area)"
label variable poverty_headcount "Poverty headcount ratio at $3.65 a day (2017 PPP) (% of population)"
label variable rural_population "Rural population (% of total population)"
label variable ifpa "Indicator of Food Price Anomalies (IFPA), applied to the Consumer Food Price Index"
label variable gni_per_capita "GNI per capita (constant 2015 US$)"
label var temp_change_cel "Temperature Change in Celsius"
label var agri_value_add "Agriculture, forestry, and fishing, value added (% of GDP)"
label var population "Population"

gen log_gni_per_capita= ln(gni_per_capita)
label var log_gni_per_capita "Log GNI per capita"
label var precip "Annual precipitiation (mm)"

*******************************************************************************
*Create a new variable "income_class"
gen income_class = .
label var income_class "1 Low Income 2 Lower-Middle 3 Upper Middle 4 High-income"

*Replace income_class for each country based on income level
*Income level 1 = Low income
replace income_class = 1 if country_code == 1 | country_code == 7 | country_code == 12 | country_code == 16

*2= Low-Middle Income
replace income_class = 2 if country_code == 2 | country_code == 3 | country_code == 5 | country_code == 9 | country_code == 8

*Middle Income
replace income_class = 3 if country_code == 6 | country_code == 13 | country_code == 11

*High Income
replace income_class = 4 if country_code == 4 | country_code == 10 | country_code == 14 | country_code == 15

*List income_class by country
list income_class country
save "cleandata.dta", replace





