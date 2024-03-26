*Meta-analyses to compare results within different levels of sociodemographic strata
***********************************************************************************


*1. Meta-analysis to compare results of T tests on the Sunday of the clock change vs the Sunday before by levels of sociodemographic strata
********************************************************************************************************************************************

*Set working directory



*Start log to save results
log using metan_before_after.log, replace


*1a)SPRING


*Open excel spreadsheet for Spring
import excel using ttest_spring_sun_before.xlsx, firstrow clear

*Check 
browse

*Add 'variable column' with categories: overall, age, sex, chrono, sleep_dur, emp
gen variable = ""
replace variable = "overall" if stratified == "Overall"
replace variable = "age" if stratified == "Age 43-58"
replace variable = "age" if stratified == "Age 59-67"
replace variable = "age" if stratified == "Age 68-78"
replace variable = "sex" if stratified == "Female"
replace variable = "sex" if stratified == "Male"
replace variable = "chrono" if stratified == "Morning"
replace variable = "chrono" if stratified == "No preference"
replace variable = "chrono" if stratified == "Evening"
replace variable = "sleep_dur" if stratified == "<=6 hours"
replace variable = "sleep_dur" if stratified == "7-8 hours"
replace variable = "sleep_dur" if stratified == ">=9 hours"
replace variable = "emp" if stratified == "Employed"
replace variable = "emp" if stratified == "Retired"
replace variable = "emp" if stratified == "Other"

*Change order so 'variable' is first
order variable stratified

*Save as stata file
save metan_spring_sun_before, replace


*Meta-analysis for sex
use metan_spring_sun_before, clear
keep if variable =="sex"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.994

*Meta-analysis for age
use metan_spring_sun_before, clear
keep if variable =="age"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.254

*Meta-analysis for chronotype
use metan_spring_sun_before, clear
keep if variable =="chrono"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.626

*Meta-analysis for sleep duration
use metan_spring_sun_before, clear
keep if variable =="sleep_dur"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.870

*Meta-analysis for employment status
use metan_spring_sun_before, clear
keep if variable =="emp"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.579


*********************************

*1b) AUTUMN


*Open excel spreadsheet for Spring
import excel using ttest_autumn_sun_before.xlsx, firstrow clear

*Check 
browse

*Add 'variable column' with categories: overall, age, sex, chrono, sleep_dur, emp
gen variable = ""
replace variable = "overall" if stratified == "Overall"
replace variable = "age" if stratified == "Age 43-58"
replace variable = "age" if stratified == "Age 59-67"
replace variable = "age" if stratified == "Age 68-78"
replace variable = "sex" if stratified == "Female"
replace variable = "sex" if stratified == "Male"
replace variable = "chrono" if stratified == "Morning"
replace variable = "chrono" if stratified == "No preference"
replace variable = "chrono" if stratified == "Evening"
replace variable = "sleep_dur" if stratified == "<=6 hours"
replace variable = "sleep_dur" if stratified == "7-8 hours"
replace variable = "sleep_dur" if stratified == ">=9 hours"
replace variable = "emp" if stratified == "Employed"
replace variable = "emp" if stratified == "Retired"
replace variable = "emp" if stratified == "Other"

*Change order so 'variable' is first
order variable stratified

*Save as stata file
save metan_autumn_sun_before, replace


*Meta-analysis for sex
use metan_autumn_sun_before, clear
keep if variable =="sex"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.412

*Meta-analysis for age
use metan_autumn_sun_before, clear
keep if variable =="age"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.724

*Meta-analysis for chronotype
use metan_autumn_sun_before, clear
keep if variable =="chrono"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.770

*Meta-analysis for sleep duration
use metan_autumn_sun_before, clear
keep if variable =="sleep_dur"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.688

*Meta-analysis for employment status
use metan_autumn_sun_before, clear
keep if variable =="emp"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.621


*****************************************************************************************


**2. Meta-analysis to compare results of T tests on the Sunday of the clock change vs the Sunday after by levels of sociodemographic strata
********************************************************************************************************************************************

*2a)SPRING


*Open excel spreadsheet for Spring
import excel using ttest_Spring_sun_after.xlsx, firstrow clear

*Check 
browse

*Add 'variable column' with categories: overall, age, sex, chrono, sleep_dur, emp
gen variable = ""
replace variable = "overall" if stratified == "Overall"
replace variable = "age" if stratified == "Age 43-58"
replace variable = "age" if stratified == "Age 59-67"
replace variable = "age" if stratified == "Age 68-78"
replace variable = "sex" if stratified == "Female"
replace variable = "sex" if stratified == "Male"
replace variable = "chrono" if stratified == "Morning"
replace variable = "chrono" if stratified == "No preference"
replace variable = "chrono" if stratified == "Evening"
replace variable = "sleep_dur" if stratified == "<=6 hours"
replace variable = "sleep_dur" if stratified == "7-8 hours"
replace variable = "sleep_dur" if stratified == ">=9 hours"
replace variable = "emp" if stratified == "Employed"
replace variable = "emp" if stratified == "Retired"
replace variable = "emp" if stratified == "Other"

*Change order so 'variable' is first
order variable stratified

*Save as stata file
save metan_spring_sun_after, replace


*Meta-analysis for sex
use metan_spring_sun_after, clear
keep if variable =="sex"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.896

*Meta-analysis for age
use metan_spring_sun_after, clear
keep if variable =="age"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.942

*Meta-analysis for chronotype
use metan_spring_sun_after, clear
keep if variable =="chrono"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.334

*Meta-analysis for sleep duration
use metan_spring_sun_after, clear
keep if variable =="sleep_dur"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.651

*Meta-analysis for employment status
use metan_spring_sun_after, clear
keep if variable =="emp"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.478


********************************

*2b) AUTUMN


*Open excel spreadsheet for Spring
import excel using ttest_Autumn_sun_after.xlsx, firstrow clear

*Check 
browse

*Add 'variable column' with categories: overall, age, sex, chrono, sleep_dur, emp
gen variable = ""
replace variable = "overall" if stratified == "Overall"
replace variable = "age" if stratified == "Age 43-58"
replace variable = "age" if stratified == "Age 59-67"
replace variable = "age" if stratified == "Age 68-78"
replace variable = "sex" if stratified == "Female"
replace variable = "sex" if stratified == "Male"
replace variable = "chrono" if stratified == "Morning"
replace variable = "chrono" if stratified == "No preference"
replace variable = "chrono" if stratified == "Evening"
replace variable = "sleep_dur" if stratified == "<=6 hours"
replace variable = "sleep_dur" if stratified == "7-8 hours"
replace variable = "sleep_dur" if stratified == ">=9 hours"
replace variable = "emp" if stratified == "Employed"
replace variable = "emp" if stratified == "Retired"
replace variable = "emp" if stratified == "Other"

*Change order so 'variable' is first
order variable stratified

*Save as stata file
save metan_autumn_sun_after, replace


*Meta-analysis for sex
use metan_autumn_sun_after, clear
keep if variable =="sex"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.369

*Meta-analysis for age
use metan_autumn_sun_after, clear
keep if variable =="age"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.095

*Meta-analysis for chronotype
use metan_autumn_sun_after, clear
keep if variable =="chrono"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.352

*Meta-analysis for sleep duration
use metan_autumn_sun_after, clear
keep if variable =="sleep_dur"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.464

*Meta-analysis for employment status
use metan_autumn_sun_after, clear
keep if variable =="emp"
metan mean_diff se_mean_diff
*Cochrane's Q: p value: 0.069


*3. Meta-analysis to test the difference in regression results of the Monday - Saturdays before & after the clock changes between the levels of sociodemographic strata
*********************************************************************
*Results from stratified regression analyses outputed from a8_weekday_regression_stratified (springregress_sex, springeregress_age_accel_tert etc) were manually combined & edited to produce 2 excel spreadsheets: regression_for_metan_spring, regression_for_metan_autumn 


*These had the following variables:
	*Variable (e.g.sex, age, employment status, chronotype, sleep duration)
	*Category (e.g. male/female, age category 1/2/3, emp/ret/other, morn,nopref,eve, 	under6/7to8/9ormore)
	*Day (Tues before to after / Wed before to after / Thurs before to after)
	*coef
	*lowerci
	*upperci
	
	


**********************************************************

*3a)SPRING
**************


*Open excel spreadsheet for Spring
import excel using regression_for_metan_spring.xlsx, firstrow clear

*Check 
browse

*Convert coeficient to numeric data
destring coef, replace

*Save
save metan_spring, replace

**************************************
*Meta-analysis for sex
*************************

*Monday before to after
keep if variable =="sex"
keep if day=="Mon before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.006**

*Tuesday before to after
use metan_spring, clear
keep if variable =="sex"
keep if day=="Tue before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.017** 

*Wednesday before to after
use metan_spring, clear
keep if variable =="sex"
keep if day=="Wed before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.060

*Thursday before to after
use metan_spring, clear
keep if variable =="sex"
keep if day=="Thur before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.058

*Friday before to after
use metan_spring, clear
keep if variable =="sex"
keep if day=="Fri before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.466

*Saturday before to after
use metan_spring, clear
keep if variable =="sex"
keep if day=="Sat before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.864

*****************************
*Meta-analysis for age
***********************

*Monday before to after
use metan_spring, clear
keep if variable =="age"
keep if day =="Mon before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.404


*Tuesday before to after
use metan_spring, clear
keep if variable =="age"
keep if day =="Tue before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.453

*Wednesday before to after
use metan_spring, clear
keep if variable =="age"
keep if day =="Wed before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.048**

*Thursday before to after
use metan_spring, clear
keep if variable =="age"
keep if day =="Thur before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.474

*Friday before to after
use metan_spring, clear
keep if variable =="age"
keep if day =="Fri before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.608

*Saturday before to after
use metan_spring, clear
keep if variable =="age"
keep if day =="Sat before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.725

*****************************
*Meta-analysis for employment status
************************************

*Monday before to after
use metan_spring, clear
keep if variable =="emp_stat"
keep if day =="Mon before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.981

*Tuesday before to after
use metan_spring, clear
keep if variable =="emp_stat"
keep if day =="Tue before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.171

*Wednesday before to after
use metan_spring, clear
keep if variable =="emp_stat"
keep if day =="Wed before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.664


*Thursday before to after
use metan_spring, clear
keep if variable =="emp_stat"
keep if day =="Thur before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.484

*Friday before to after
use metan_spring, clear
keep if variable =="emp_stat"
keep if day =="Fri before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.088

*Saturday before to after
use metan_spring, clear
keep if variable =="emp_stat"
keep if day =="Sat before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.229

*****************************
*Meta-analysis for sleep duration
************************************

*Monday before to after
use metan_spring, clear
keep if variable =="sleep_dur"
keep if day =="Mon before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.336

*Tuesday before to after
use metan_spring, clear
keep if variable =="sleep_dur"
keep if day =="Tue before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.169

*Wednesday before to after
use metan_spring, clear
keep if variable =="sleep_dur"
keep if day =="Wed before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.538

*Thursday before to after
use metan_spring, clear
keep if variable =="sleep_dur"
keep if day =="Thur before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.420

*Friday before to after
use metan_spring, clear
keep if variable =="sleep_dur"
keep if day =="Fri before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.060

*Saturday before to after
use metan_spring, clear
keep if variable =="sleep_dur"
keep if day =="Sat before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.891

*****************************
*Meta-analysis for chronotype
************************************

*Monday before to after
use metan_spring, clear
keep if variable =="chrono"
keep if day =="Mon before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.349

*Tuesday before to after
use metan_spring, clear
keep if variable =="chrono"
keep if day =="Tue before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.929

*Wednesday before to after
use metan_spring, clear
keep if variable =="chrono"
keep if day =="Wed before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.232

*Thursday before to after
use metan_spring, clear
keep if variable =="chrono"
keep if day =="Thur before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.655

*Friday before to after
use metan_spring, clear
keep if variable =="chrono"
keep if day =="Fri before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.962

*Saturday before to after
use metan_spring, clear
keep if variable =="chrono"
keep if day =="Sat before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.796



*3b) AUTUMN
**************

*Open excel spreadsheet for Autumn
import excel using regression_for_metan_autumn.xlsx, firstrow clear

*Check 
browse

*Convert coeficient to numeric data
destring coef, replace

*Save
save metan_autumn, replace



**************************************
*Meta-analysis for sex
************************


*Monday before to after
keep if variable =="sex"
keep if day=="Mon before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.835

*Tuesday before to after
use metan_autumn, clear
keep if variable =="sex"
keep if day=="Tue before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.082

*Wednesday before to after
use metan_autumn, clear
keep if variable =="sex"
keep if day=="Wed before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.446

*Thursday before to after
use metan_autumn, clear
keep if variable =="sex"
keep if day=="Thur before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.103

*Friday before to after
use metan_autumn, clear
keep if variable =="sex"
keep if day=="Fri before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.004**

*Saturday before to after
use metan_autumn, clear
keep if variable =="sex"
keep if day=="Sat before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.030**

*****************************
*Meta-analysis for age
***********************

*Monday before to after
use metan_autumn, clear
keep if variable =="age"
keep if day =="Mon before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.029**


*Tuesday before to after
use metan_autumn, clear
keep if variable =="age"
keep if day =="Tue before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.167

*Wednesday before to after
use metan_autumn, clear
keep if variable =="age"
keep if day =="Wed before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.009**

*Thursday before to after
use metan_autumn, clear
keep if variable =="age"
keep if day =="Thur before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.679

*Friday before to after
use metan_autumn, clear
keep if variable =="age"
keep if day =="Fri before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.227

*Saturday before to after
use metan_autumn, clear
keep if variable =="age"
keep if day =="Sat before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.026**

*****************************
*Meta-analysis for employment status
************************************

*Monday before to after
use metan_autumn, clear
keep if variable =="emp_stat"
keep if day =="Mon before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.135

*Tuesday before to after
use metan_autumn, clear
keep if variable =="emp_stat"
keep if day =="Tue before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.016**

*Wednesday before to after
use metan_autumn, clear
keep if variable =="emp_stat"
keep if day =="Wed before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.158


*Thursday before to after
use metan_autumn, clear
keep if variable =="emp_stat"
keep if day =="Thur before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.062

*Friday before to after
use metan_autumn, clear
keep if variable =="emp_stat"
keep if day =="Fri before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.823

*Saturday before to after
use metan_autumn, clear
keep if variable =="emp_stat"
keep if day =="Sat before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.342

*****************************
*Meta-analysis for sleep duration
************************************

*Monday before to after
use metan_autumn, clear
keep if variable =="sleep_dur"
keep if day =="Mon before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.907

*Tuesday before to after
use metan_autumn, clear
keep if variable =="sleep_dur"
keep if day =="Tue before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.084

*Wednesday before to after
use metan_autumn, clear
keep if variable =="sleep_dur"
keep if day =="Wed before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.859

*Thursday before to after
use metan_autumn, clear
keep if variable =="sleep_dur"
keep if day =="Thur before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.445

*Friday before to after
use metan_autumn, clear
keep if variable =="sleep_dur"
keep if day =="Fri before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.934

*Saturday before to after
use metan_autumn, clear
keep if variable =="sleep_dur"
keep if day =="Sat before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.167

*****************************
*Meta-analysis for chronotype
************************************

*Monday before to after
use metan_autumn, clear
keep if variable =="chrono"
keep if day =="Mon before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.505

*Tuesday before to after
use metan_autumn, clear
keep if variable =="chrono"
keep if day =="Tue before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.510

*Wednesday before to after
use metan_autumn, clear
keep if variable =="chrono"
keep if day =="Wed before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.672

*Thursday before to after
use metan_autumn, clear
keep if variable =="chrono"
keep if day =="Thur before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.770

*Friday before to after
use metan_autumn, clear
keep if variable =="chrono"
keep if day =="Fri before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.328

*Saturday before to after
use metan_autumn, clear
keep if variable =="chrono"
keep if day =="Sat before to after"
metan coef lowerci upperci
*Cochrane's Q: p value: 0.713

*Close log
log close