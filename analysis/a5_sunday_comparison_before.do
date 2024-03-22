*Compare sleep duration on Sunday of clock change to Sunday before
***********************************************************************************


*1. Between person t test comparing Sunday of clock change to Sunday before (SPRING)

*Open dataset
use /mnt/project/accel10.dta, clear
set more off
keep if season =="Spring" 

**********************************

*1a) Overall

*Histrogram of sleep duration on Sunday before the clock change
hist sleep_dur_sun_before, freq normal
graph save "sun_before_hist_spring", replace
!dx upload sun_before_hist_spring.gph

*Histrogram of sleep dur on Sunday of the clock change
hist sleep_dur_sun_change, freq normal
graph save "sun_change_hist_spring", replace
!dx upload sun_change_hist_spring.gph

*Boxplot
graph box sleep_dur_sun_before sleep_dur_sun_change
graph save "sun_change_before_box_spring", replace
!dx upload sun_change_before_box_spring.gph

*Unpaired t test to compare Sunday of change to Sunday before (Overall)
ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired

*Get actual p value
return list //p = 0.0356250034407431

*Power of estimate
*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE diff and 1.96*SE diff 
*Difference in SE = 6.068076

*-1.96*6.068076 = -11.893429
*1.96*6.068076= 11.893429
*The difference in effect size we have here = -12.75913
*We are powered to detect a difference of +/-11.893429. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*********************************************************

*1b. Stratified

*AGE

bysort age_accel_tert:ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired



***************************
*Power of our estimates

*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE and 1.96*SE 

*age_accel_tert = 1
*Difference in SE = 9.897765 


*-1.96*9.897765 = -19.399619
*1.96*9.897765  = 19.399619

*The difference in effect size we have here = -29.34135
*We are powered to detect a difference of +/-19.399619. This is much smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p = 0.0031 

********************

*age_accel_tert = 2
*Difference in SE = 10.27124

*-1.96*10.27124 = -20.13163
*1.96*10.27124 = 20.13163

*The difference in effect size we have here = 2.435589
*We are powered to detect a difference of +/-20.13163 . This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.8126 

******************

*age_accel_tert = 3
*Difference in SE = 11.43436

*-1.96*11.43436 = -22.411346
*1.96*11.43436  = 22.411346

*The difference in effect size we have here = -8.481836 
*We are powered to detect a difference of +/-22.411346. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.4585

**************
*SEX

bysort sex: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


************

*Power of our estimates

*sex = female
*Difference in SE = 8.183863

*-1.96*8.183863  = -16.040371
*1.96*8.183863 = 16.040371

*The difference in effect size we have here = -9.063047 
*We are powered to detect a difference of +/-16.040371 . This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p = 0.0532 

*********


*sex = male
*Difference in SE = 9.064778

*-1.96*9.064778= 17.766965
*1.96*9.064778 = 17.766965

*The difference in effect size we have here = -9.063047 
*We are powered to detect a difference of +/-17.766965. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p = 0.3177

*************************************


*CHRONOTYPE

bysort chrono_3cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


********************

*Power of our estimates

*chronotype = morning
*Difference in SE = 8.353771 

*-1.96*8.353771 = -16.373391
*1.96*8.353771  = 16.373391

*The difference in effect size we have here = -14.39749
*We are powered to detect a difference of +/-16.373391. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.5848

******************

*chronotype = no preference
*Difference in SE = 18.15138 

*-1.96*18.15138  = -35.576705
*1.96*18.15138  = 35.576705

*The difference in effect size we have here =  9.933107
*We are powered to detect a difference of +/-35.576705. This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.0783 

******************

*chronotype = evening
*Difference in SE =  10.2007

*-1.96*10.2007 = -19.993372
*1.96*10.2007= 19.993372

*The difference in effect size we have here =  -17.9871
*We are powered to detect a difference of +/-19.993372. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.


*p= 0.8994
**********************************************************************************


*SLEEP DURATION

bysort sleep_dur_cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired

​
*****************

*Power of our estimates

*sleep dur <=6
*Difference in SE = 12.74078

*-1.96*12.74078 = -24.971929
*1.96*12.74078 = 24.971929

*The difference in effect size we have here =  -19.82411
*We are powered to detect a difference of +/-24.971929 . This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p value: 0.1205 

**********

*sleep dur 7-8
*Difference in SE = 7.241112

*-1.96*7.241112 = -14.19258
*1.96*7.241112 = 14.19258

*The difference in effect size we have here = -10.55478
*We are powered to detect a difference of +/-14.19258. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.


*p value: 0.1452 

************

*sleep dur >=9
*Difference in SE = 23.5962 

*-1.96*23.5962 = -46.248552
*1.96*23.5962  = 46.248552

*The difference in effect size we have here = -11.67163
*We are powered to detect a difference of +/-46.248552 . This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p value: 0.6218

*************************************************************


*EMPLOYMENT

bysort employ_3cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


*Power of our estimates

*employ= employed

*Difference in SE = 7.322373

*-1.96*7.322373 = -14.351851
*1.96*7.322373 = 14.351851

*The difference in effect size we have here =  -17.20988
*We are powered to detect a difference of +/-14.351851. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p=0.0189

*******

*employ= retired
*Difference in SE = 11.33316

*-1.96*11.33316 = -22.212994
*1.96*11.33316= 22.212994

*The difference in effect size we have here = -1.700906
*We are powered to detect a difference of +/-22.212994. This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p value: 0.8808 

*******

*employ= other
*Difference in SE = 30.17209
*-1.96*30.17209 = -59.137296
*1.96*30.17209 =59.137296

*The difference in effect size we have here = -13.27434
*We are powered to detect a difference of +/-59.137296. This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

**************************************************************************

*1c) Get result of overall & stratified t tests out into spreadsheet.


*Open dataset
use /mnt/project/accel10.dta, clear
set more off
keep if season =="Spring" 


*Create matricies for overall, by categories of age, sex, chronotype, sleep duration & employment.

	*Overall
ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired
return list
matrix overall_mat_sun_before = J(1,8, .) // Create empty 1 x 9 matrix
matrix overall_mat_sun_before[1,1] = r(N_1)
matrix overall_mat_sun_before[1,2] = r(mu_1)
matrix overall_mat_sun_before[1,3] = r(sd_1)
matrix overall_mat_sun_before[1,4] = r(N_2)
matrix overall_mat_sun_before[1,5] = r(mu_2)
matrix overall_mat_sun_before[1,6] = r(sd_2)
matrix overall_mat_sun_before[1,7] = r(se)
matrix overall_mat_sun_before[1,8] = r(p)
matrix list overall_mat_sun_before


******************************

 *Age category 1
ttest sleep_dur_sun_change == sleep_dur_sun_before if age_accel_tert ==1, unpaired
return list

matrix age1_mat_sun_before = J(1,8, .) 
matrix age1_mat_sun_before[1,1] = r(N_1)
matrix age1_mat_sun_before[1,2] = r(mu_1)
matrix age1_mat_sun_before[1,3] = r(sd_1)
matrix age1_mat_sun_before[1,4] = r(N_2)
matrix age1_mat_sun_before[1,5] = r(mu_2)
matrix age1_mat_sun_before[1,6] = r(sd_2)
matrix age1_mat_sun_before[1,7] = r(se)
matrix age1_mat_sun_before[1,8] = r(p)
matrix list age1_mat_sun_before


*Age category 2
ttest sleep_dur_sun_change == sleep_dur_sun_before if age_accel_tert ==2, unpaired
return list
matrix age2_mat_sun_before = J(1,8, .) 
matrix age2_mat_sun_before[1,1] = r(N_1)
matrix age2_mat_sun_before[1,2] = r(mu_1)
matrix age2_mat_sun_before[1,3] = r(sd_1)
matrix age2_mat_sun_before[1,4] = r(N_2)
matrix age2_mat_sun_before[1,5] = r(mu_2)
matrix age2_mat_sun_before[1,6] = r(sd_2)
matrix age2_mat_sun_before[1,7] = r(se)
matrix age2_mat_sun_before[1,8] = r(p)
matrix list age2_mat_sun_before

*Age category 3
ttest sleep_dur_sun_change == sleep_dur_sun_before if age_accel_tert ==3, unpaired
return list
matrix age3_mat_sun_before = J(1,8, .) 
matrix age3_mat_sun_before[1,1] = r(N_1)
matrix age3_mat_sun_before[1,2] = r(mu_1)
matrix age3_mat_sun_before[1,3] = r(sd_1)
matrix age3_mat_sun_before[1,4] = r(N_2)
matrix age3_mat_sun_before[1,5] = r(mu_2)
matrix age3_mat_sun_before[1,6] = r(sd_2)
matrix age3_mat_sun_before[1,7] = r(se)
matrix age3_mat_sun_before[1,8] = r(p)
matrix list age3_mat_sun_before

*****************

 *Sex category 0 (female)
tab sex
tab sex, nolabel
ttest sleep_dur_sun_change == sleep_dur_sun_before if sex ==0, unpaired
return list
matrix sex0_mat_sun_before = J(1,8, .) 
matrix sex0_mat_sun_before[1,1] = r(N_1)
matrix sex0_mat_sun_before[1,2] = r(mu_1)
matrix sex0_mat_sun_before[1,3] = r(sd_1)
matrix sex0_mat_sun_before[1,4] = r(N_2)
matrix sex0_mat_sun_before[1,5] = r(mu_2)
matrix sex0_mat_sun_before[1,6] = r(sd_2)
matrix sex0_mat_sun_before[1,7] = r(se)
matrix sex0_mat_sun_before[1,8] = r(p)
matrix list sex0_mat_sun_before


 *Sex category 1

ttest sleep_dur_sun_change == sleep_dur_sun_before if sex ==1, unpaired
return list

matrix sex1_mat_sun_before = J(1,8, .) 
matrix sex1_mat_sun_before[1,1] = r(N_1)
matrix sex1_mat_sun_before[1,2] = r(mu_1)
matrix sex1_mat_sun_before[1,3] = r(sd_1)
matrix sex1_mat_sun_before[1,4] = r(N_2)
matrix sex1_mat_sun_before[1,5] = r(mu_2)
matrix sex1_mat_sun_before[1,6] = r(sd_2)
matrix sex1_mat_sun_before[1,7] = r(se)
matrix sex1_mat_sun_before[1,8] = r(p)
matrix list sex1_mat_sun_before

******************************************************************

*Chronotype

*Chronotype category 1
ttest sleep_dur_sun_change == sleep_dur_sun_before if chrono_3cats ==1, unpaired
return list

matrix chrono1_mat_sun_before = J(1,8, .) 
matrix chrono1_mat_sun_before[1,1] = r(N_1)
matrix chrono1_mat_sun_before[1,2] = r(mu_1)
matrix chrono1_mat_sun_before[1,3] = r(sd_1)
matrix chrono1_mat_sun_before[1,4] = r(N_2)
matrix chrono1_mat_sun_before[1,5] = r(mu_2)
matrix chrono1_mat_sun_before[1,6] = r(sd_2)
matrix chrono1_mat_sun_before[1,7] = r(se)
matrix chrono1_mat_sun_before[1,8] = r(p)
matrix list chrono1_mat_sun_before

*Chronotype category 2
ttest sleep_dur_sun_change == sleep_dur_sun_before if chrono_3cats ==2, unpaired
return list
matrix chrono2_mat_sun_before = J(1,8, .) 
matrix chrono2_mat_sun_before[1,1] = r(N_1)
matrix chrono2_mat_sun_before[1,2] = r(mu_1)
matrix chrono2_mat_sun_before[1,3] = r(sd_1)
matrix chrono2_mat_sun_before[1,4] = r(N_2)
matrix chrono2_mat_sun_before[1,5] = r(mu_2)
matrix chrono2_mat_sun_before[1,6] = r(sd_2)
matrix chrono2_mat_sun_before[1,7] = r(se)
matrix chrono2_mat_sun_before[1,8] = r(p)
matrix list chrono2_mat_sun_before


*Chronotype category 3
ttest sleep_dur_sun_change == sleep_dur_sun_before if chrono_3cats ==3, unpaired
return list

matrix chrono3_mat_sun_before = J(1,8, .) 
matrix chrono3_mat_sun_before[1,1] = r(N_1)
matrix chrono3_mat_sun_before[1,2] = r(mu_1)
matrix chrono3_mat_sun_before[1,3] = r(sd_1)
matrix chrono3_mat_sun_before[1,4] = r(N_2)
matrix chrono3_mat_sun_before[1,5] = r(mu_2)
matrix chrono3_mat_sun_before[1,6] = r(sd_2)
matrix chrono3_mat_sun_before[1,7] = r(se)
matrix chrono3_mat_sun_before[1,8] = r(p)
matrix list chrono3_mat_sun_before

********************************************************
*Sleep duration


*Sleep duration category 1
ttest sleep_dur_sun_change == sleep_dur_sun_before if sleep_dur_cats ==1, unpaired
return list

matrix sleepdur1_mat_sun_before = J(1,8, .) 
matrix sleepdur1_mat_sun_before[1,1] = r(N_1)
matrix sleepdur1_mat_sun_before[1,2] = r(mu_1)
matrix sleepdur1_mat_sun_before[1,3] = r(sd_1)
matrix sleepdur1_mat_sun_before[1,4] = r(N_2)
matrix sleepdur1_mat_sun_before[1,5] = r(mu_2)
matrix sleepdur1_mat_sun_before[1,6] = r(sd_2)
matrix sleepdur1_mat_sun_before[1,7] = r(se)
matrix sleepdur1_mat_sun_before[1,8] = r(p)
matrix list sleepdur1_mat_sun_before

*Sleep duration category 2
ttest sleep_dur_sun_change == sleep_dur_sun_before if sleep_dur_cats ==2, unpaired
return list

matrix sleepdur2_mat_sun_before = J(1,8, .) 
matrix sleepdur2_mat_sun_before[1,1] = r(N_1)
matrix sleepdur2_mat_sun_before[1,2] = r(mu_1)
matrix sleepdur2_mat_sun_before[1,3] = r(sd_1)
matrix sleepdur2_mat_sun_before[1,4] = r(N_2)
matrix sleepdur2_mat_sun_before[1,5] = r(mu_2)
matrix sleepdur2_mat_sun_before[1,6] = r(sd_2)
matrix sleepdur2_mat_sun_before[1,7] = r(se)
matrix sleepdur2_mat_sun_before[1,8] = r(p)
matrix list sleepdur2_mat_sun_before


*Sleep duration category 3
ttest sleep_dur_sun_change == sleep_dur_sun_before if sleep_dur_cats ==3, unpaired
return list

matrix sleepdur3_mat_sun_before = J(1,8, .) 
matrix sleepdur3_mat_sun_before[1,1] = r(N_1)
matrix sleepdur3_mat_sun_before[1,2] = r(mu_1)
matrix sleepdur3_mat_sun_before[1,3] = r(sd_1)
matrix sleepdur3_mat_sun_before[1,4] = r(N_2)
matrix sleepdur3_mat_sun_before[1,5] = r(mu_2)
matrix sleepdur3_mat_sun_before[1,6] = r(sd_2)
matrix sleepdur3_mat_sun_before[1,7] = r(se)
matrix sleepdur3_mat_sun_before[1,8] = r(p)
matrix list sleepdur3_mat_sun_before


*******************************************************

*Employment status category 1
ttest sleep_dur_sun_change == sleep_dur_sun_before if employ_3cats ==1, unpaired
return list

matrix employ1_mat_sun_before = J(1,8, .) 
matrix employ1_mat_sun_before[1,1] = r(N_1)
matrix employ1_mat_sun_before[1,2] = r(mu_1)
matrix employ1_mat_sun_before[1,3] = r(sd_1)
matrix employ1_mat_sun_before[1,4] = r(N_2)
matrix employ1_mat_sun_before[1,5] = r(mu_2)
matrix employ1_mat_sun_before[1,6] = r(sd_2)
matrix employ1_mat_sun_before[1,7] = r(se)
matrix employ1_mat_sun_before[1,8] = r(p)
matrix list employ1_mat_sun_before

*Employment status category 2
ttest sleep_dur_sun_change == sleep_dur_sun_before if employ_3cats ==2, unpaired
return list

matrix employ2_mat_sun_before = J(1,8, .) 
matrix employ2_mat_sun_before[1,1] = r(N_1)
matrix employ2_mat_sun_before[1,2] = r(mu_1)
matrix employ2_mat_sun_before[1,3] = r(sd_1)
matrix employ2_mat_sun_before[1,4] = r(N_2)
matrix employ2_mat_sun_before[1,5] = r(mu_2)
matrix employ2_mat_sun_before[1,6] = r(sd_2)
matrix employ2_mat_sun_before[1,7] = r(se)
matrix employ2_mat_sun_before[1,8] = r(p)
matrix list employ2_mat_sun_before

*Employment status category 3
ttest sleep_dur_sun_change == sleep_dur_sun_before if employ_3cats ==3, unpaired
return list

matrix employ3_mat_sun_before = J(1,8, .) 
matrix employ3_mat_sun_before[1,1] = r(N_1)
matrix employ3_mat_sun_before[1,2] = r(mu_1)
matrix employ3_mat_sun_before[1,3] = r(sd_1)
matrix employ3_mat_sun_before[1,4] = r(N_2)
matrix employ3_mat_sun_before[1,5] = r(mu_2)
matrix employ3_mat_sun_before[1,6] = r(sd_2)
matrix employ3_mat_sun_before[1,7] = r(se)
matrix employ3_mat_sun_before[1,8] = r(p)
matrix list employ3_mat_sun_before

***************************************************

*1d) Combine the matricies into one matrix
matrix ttest_spring_mat_sun_before = (overall_mat_sun_before \ age1_mat_sun_before \ age2_mat_sun_before \ age3_mat_sun_before \ sex0_mat_sun_before \ sex1_mat_sun_before\ chrono1_mat_sun_before\ chrono2_mat_sun_before \ chrono3_mat_sun_before \ sleepdur1_mat_sun_before \ sleepdur2_mat_sun_before \ sleepdur3_mat_sun_before \ employ1_mat_sun_before \ employ2_mat_sun_before \ employ3_mat_sun_before)
matrix list ttest_spring_mat_sun_before

*Save the combined matrix
svmat ttest_spring_mat_sun_before

*Only keep the combined matrix 
describe // 3190 obs. 182 vars.
keep ttest_spring_mat_sun_before* 
drop if ttest_spring_mat_sun_before1 ==. // 3175 obs deleted
describe obs: 15. vars: 8.

*Rename variables
rename ttest_spring_mat_sun_before1 n_change
rename ttest_spring_mat_sun_before2 mean_change
rename ttest_spring_mat_sun_before3 sd_mean_change
rename ttest_spring_mat_sun_before4 n_before
rename ttest_spring_mat_sun_before5 mean_before
rename ttest_spring_mat_sun_before6 sd_before
rename ttest_spring_mat_sun_before7 se_mean_diff
rename ttest_spring_mat_sun_before8 p_value
describe

*Calculate mean difference
gen mean_diff = mean_change - mean_before

*Re-order variables so mean diff is in right place
order n_change mean_change sd_mean_change n_before mean_before sd_before mean_diff se_mean_diff p_value
describe // 15 obs. 9 vars.

*Create variable for what the data is stratified by
gen stratified = ""
replace stratified = "Overall" in 1
replace stratified = "Age 43-58" in 2
replace stratified = "Age 59-67" in 3
replace stratified = "Age 68-78" in 4
replace stratified = "Female" in 5
replace stratified = "Male" in 6
replace stratified = "Morning" in 7
replace stratified = "No preference" in 8
replace stratified = "Evening" in 9
replace stratified = "<=6 hours" in 10
replace stratified = "7-8 hours" in 11
replace stratified = ">=9 hours" in 12
replace stratified = "Employed" in 13
replace stratified = "Retired" in 14
replace stratified = "Other" in 15


*Reorder variables so stratified is first
order stratified n_change
describe

*Calculate the 95% Confidence intervals of the mean difference
*95% CI = Mean ± (Z * Standard Error)
gen ci_upper = mean_diff + (1.96*se_mean_diff)
gen ci_lower = mean_diff - (1.96*se_mean_diff)

*Reorder vars
order stratified n_change mean_change sd_mean_change n_before mean_before sd_before mean_diff se_mean_diff p_value ci_lower ci_upper
describe // 

*Save & upload as stata file
save "ttest_spring_sun_before.dta", replace
!dx upload ttest_spring_sun_before.dta

*Save & upload as excel file
export excel ttest_spring_sun_before.xlsx, firstrow(varlabels) replace
!dx upload ttest_spring_sun_before.xlsx




******************************************************************************************************************

*2. Between person t test comparing Sunday of clock change to Sunday before (AUTUMN)

*Open dataset
use /mnt/project/accel10.dta, clear
set more off
keep if season =="Autumn" 

**********************************

**********************************

*2a) Overall

*Histrogram of sleep duration on Sunday before the clock change
hist sleep_dur_sun_before, freq normal
graph save "sun_before_hist_autumn", replace
!dx upload sun_before_hist_autumn.gph

*Histrogram of sleep dur on Sunday of the clock change
hist sleep_dur_sun_change, freq normal
graph save "sun_change_hist_autumn", replace
!dx upload sun_change_hist_autumn.gph

*Boxplot
graph box sleep_dur_sun_before sleep_dur_sun_change
graph save "sun_change_before_box_autumn", replace
!dx upload sun_change_before_box_autumn.gph

*Unpaired t test to compare Sunday of change to Sunday before (Overall)
ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired

*Get actual p value
return list 

*Power of estimate
*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE diff and 1.96*SE diff 
*Difference in SE = 4.793677 

*-1.96*4.793677 = -9.3956069
*1.96*4.793677 = 9.3956069
*The difference in effect size we have here = -20.68994
*We are powered to detect a difference of +/-9.3956069. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p value: .0000163517310088

*********************************************************

*2b. Stratified

*AGE

bysort age_accel_tert:ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired



***************************
*Power of our estimates

*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE and 1.96*SE 

*age_accel_tert = 1
*Difference in SE = 8.391769 


*-1.96*8.391769  = -16.447867
*1.96*8.391769   = 16.447867

*The difference in effect size we have here = -20.84758
*We are powered to detect a difference of +/-16.447867. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p =  0.0131

********************

*age_accel_tert = 2
*Difference in SE = 7.567835 

*-1.96*7.567835  = -14.832957
*1.96*7.567835  = 14.832957

*The difference in effect size we have here = -22.94359
*We are powered to detect a difference of +/-14.832957 . This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p=0.0025

******************

*age_accel_tert = 3
*Difference in SE =9.041965

*-1.96*9.041965 = -17.722251
*1.96*9.041965  = 17.722251

*The difference in effect size we have here = -16.59258 
*We are powered to detect a difference of +/-17.722251. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.0668 

**************
*SEX

bysort sex: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


************

*Power of our estimates

*sex = female
*Difference in SE = 6.284414 

*-1.96*6.284414   = -12.317451
*1.96*6.284414  = 12.317451

*The difference in effect size we have here = -22.07546  
*We are powered to detect a difference of +/-12.317451. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p = 0.0005

*********


*sex = male
*Difference in SE =7.402916

*-1.96*7.402916= -14.509715
*1.96*7.402916= 14.509715

*The difference in effect size we have here = -18.89761
*We are powered to detect a difference of +/14.509715. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p = 0.0108 

*************************************


*CHRONOTYPE

bysort chrono_3cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


********************

*Power of our estimates

*chronotype = morning
*Difference in SE = 6.039799 

*-1.96*6.039799  = -11.838006
*1.96*6.039799   = 11.838006

*The difference in effect size we have here = -20.85051
*We are powered to detect a difference of +/-11.838006. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p=0.0006

******************

*chronotype = no preference
*Difference in SE =   19.118 

*-1.96*19.118  = -37.47128
*1.96*19.118= 37.47128

*The difference in effect size we have here =  -17.43585
*We are powered to detect a difference of +/-37.47128. This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.3624 

******************

*chronotype = evening
*Difference in SE =  8.693689

*-1.96*8.693689 = -17.03963
*1.96*8.693689= 17.03963

*The difference in effect size we have here =  -20.6659
*We are powered to detect a difference of +/-17.03963. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*p= 0.0176
**********************************************************************************


*SLEEP DURATION

bysort sleep_dur_cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired

​
*****************

*Power of our estimates

*sleep dur <=6
*Difference in SE = 10.90176

*-1.96*10.90176 = -21.36745
*1.96*10.90176 = 21.36745

*The difference in effect size we have here =  -22.48123
*We are powered to detect a difference of +/-21.36745 . This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p value: 0.0396

**********

*sleep dur 7-8
*Difference in SE =5.452686

*-1.96*5.452686 = -10.687265
*1.96*5.452686 = 10.687265

*The difference in effect size we have here = -17.7928
*We are powered to detect a difference of +/-10.687265. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*p value:  0.0011 

************

*sleep dur >=9
*Difference in SE = 21.59724 
*-1.96*21.59724  = - 42.33059
*1.96*21.59724   = 42.33059

*The difference in effect size we have here =  -49.75488
*We are powered to detect a difference of +/-42.33059 . This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p value: 0.0222 

*************************************************************


*EMPLOYMENT

bysort employ_3cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


*Power of our estimates

*employ= employed

*Difference in SE =  6.172455 

*-1.96*6.172455  = -12.098012
*1.96*6.172455  = 12.098012

*The difference in effect size we have here = -18.78416
*We are powered to detect a difference of +/-12.098012. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p=0.0024

*******

*employ= retired
*Difference in SE = 8.092444

*-1.96*8.092444 = -15.86119
*1.96*8.092444=15.86119

*The difference in effect size we have here = -22.9819
*We are powered to detect a difference of +/-15.86119. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p value: 0.0046

*******

*employ= other
*Difference in SE = 19.83548
*-1.96*19.83548 = -38.877541
*1.96*19.83548 = 38.877541

*The difference in effect size we have here = -31.37142
*We are powered to detect a difference of +/-38.877541. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.1150 

**************************************************************************

*2c) Get result of overall & stratified t tests out into spreadsheet.


*Open dataset
use /mnt/project/accel10.dta, clear
set more off
keep if season =="Autumn" 


*Create matricies for overall, by categories of age, sex, chronotype, sleep duration & employment.

	*Overall
ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired
return list
matrix overall_mat_sun_before = J(1,8, .) // Create empty 1 x 9 matrix
matrix overall_mat_sun_before[1,1] = r(N_1)
matrix overall_mat_sun_before[1,2] = r(mu_1)
matrix overall_mat_sun_before[1,3] = r(sd_1)
matrix overall_mat_sun_before[1,4] = r(N_2)
matrix overall_mat_sun_before[1,5] = r(mu_2)
matrix overall_mat_sun_before[1,6] = r(sd_2)
matrix overall_mat_sun_before[1,7] = r(se)
matrix overall_mat_sun_before[1,8] = r(p)
matrix list overall_mat_sun_before


******************************

 *Age category 1
ttest sleep_dur_sun_change == sleep_dur_sun_before if age_accel_tert ==1, unpaired
return list

matrix age1_mat_sun_before = J(1,8, .) 
matrix age1_mat_sun_before[1,1] = r(N_1)
matrix age1_mat_sun_before[1,2] = r(mu_1)
matrix age1_mat_sun_before[1,3] = r(sd_1)
matrix age1_mat_sun_before[1,4] = r(N_2)
matrix age1_mat_sun_before[1,5] = r(mu_2)
matrix age1_mat_sun_before[1,6] = r(sd_2)
matrix age1_mat_sun_before[1,7] = r(se)
matrix age1_mat_sun_before[1,8] = r(p)
matrix list age1_mat_sun_before


*Age category 2
ttest sleep_dur_sun_change == sleep_dur_sun_before if age_accel_tert ==2, unpaired
return list
matrix age2_mat_sun_before = J(1,8, .) 
matrix age2_mat_sun_before[1,1] = r(N_1)
matrix age2_mat_sun_before[1,2] = r(mu_1)
matrix age2_mat_sun_before[1,3] = r(sd_1)
matrix age2_mat_sun_before[1,4] = r(N_2)
matrix age2_mat_sun_before[1,5] = r(mu_2)
matrix age2_mat_sun_before[1,6] = r(sd_2)
matrix age2_mat_sun_before[1,7] = r(se)
matrix age2_mat_sun_before[1,8] = r(p)
matrix list age2_mat_sun_before

*Age category 3
ttest sleep_dur_sun_change == sleep_dur_sun_before if age_accel_tert ==3, unpaired
return list
matrix age3_mat_sun_before = J(1,8, .) 
matrix age3_mat_sun_before[1,1] = r(N_1)
matrix age3_mat_sun_before[1,2] = r(mu_1)
matrix age3_mat_sun_before[1,3] = r(sd_1)
matrix age3_mat_sun_before[1,4] = r(N_2)
matrix age3_mat_sun_before[1,5] = r(mu_2)
matrix age3_mat_sun_before[1,6] = r(sd_2)
matrix age3_mat_sun_before[1,7] = r(se)
matrix age3_mat_sun_before[1,8] = r(p)
matrix list age3_mat_sun_before

*****************

 *Sex category 0 (female)
tab sex
tab sex, nolabel
ttest sleep_dur_sun_change == sleep_dur_sun_before if sex ==0, unpaired
return list
matrix sex0_mat_sun_before = J(1,8, .) 
matrix sex0_mat_sun_before[1,1] = r(N_1)
matrix sex0_mat_sun_before[1,2] = r(mu_1)
matrix sex0_mat_sun_before[1,3] = r(sd_1)
matrix sex0_mat_sun_before[1,4] = r(N_2)
matrix sex0_mat_sun_before[1,5] = r(mu_2)
matrix sex0_mat_sun_before[1,6] = r(sd_2)
matrix sex0_mat_sun_before[1,7] = r(se)
matrix sex0_mat_sun_before[1,8] = r(p)
matrix list sex0_mat_sun_before


 *Sex category 1

ttest sleep_dur_sun_change == sleep_dur_sun_before if sex ==1, unpaired
return list

matrix sex1_mat_sun_before = J(1,8, .) 
matrix sex1_mat_sun_before[1,1] = r(N_1)
matrix sex1_mat_sun_before[1,2] = r(mu_1)
matrix sex1_mat_sun_before[1,3] = r(sd_1)
matrix sex1_mat_sun_before[1,4] = r(N_2)
matrix sex1_mat_sun_before[1,5] = r(mu_2)
matrix sex1_mat_sun_before[1,6] = r(sd_2)
matrix sex1_mat_sun_before[1,7] = r(se)
matrix sex1_mat_sun_before[1,8] = r(p)
matrix list sex1_mat_sun_before

******************************************************************

*Chronotype

*Chronotype category 1
ttest sleep_dur_sun_change == sleep_dur_sun_before if chrono_3cats ==1, unpaired
return list

matrix chrono1_mat_sun_before = J(1,8, .) 
matrix chrono1_mat_sun_before[1,1] = r(N_1)
matrix chrono1_mat_sun_before[1,2] = r(mu_1)
matrix chrono1_mat_sun_before[1,3] = r(sd_1)
matrix chrono1_mat_sun_before[1,4] = r(N_2)
matrix chrono1_mat_sun_before[1,5] = r(mu_2)
matrix chrono1_mat_sun_before[1,6] = r(sd_2)
matrix chrono1_mat_sun_before[1,7] = r(se)
matrix chrono1_mat_sun_before[1,8] = r(p)
matrix list chrono1_mat_sun_before

*Chronotype category 2
ttest sleep_dur_sun_change == sleep_dur_sun_before if chrono_3cats ==2, unpaired
return list
matrix chrono2_mat_sun_before = J(1,8, .) 
matrix chrono2_mat_sun_before[1,1] = r(N_1)
matrix chrono2_mat_sun_before[1,2] = r(mu_1)
matrix chrono2_mat_sun_before[1,3] = r(sd_1)
matrix chrono2_mat_sun_before[1,4] = r(N_2)
matrix chrono2_mat_sun_before[1,5] = r(mu_2)
matrix chrono2_mat_sun_before[1,6] = r(sd_2)
matrix chrono2_mat_sun_before[1,7] = r(se)
matrix chrono2_mat_sun_before[1,8] = r(p)
matrix list chrono2_mat_sun_before


*Chronotype category 3
ttest sleep_dur_sun_change == sleep_dur_sun_before if chrono_3cats ==3, unpaired
return list

matrix chrono3_mat_sun_before = J(1,8, .) 
matrix chrono3_mat_sun_before[1,1] = r(N_1)
matrix chrono3_mat_sun_before[1,2] = r(mu_1)
matrix chrono3_mat_sun_before[1,3] = r(sd_1)
matrix chrono3_mat_sun_before[1,4] = r(N_2)
matrix chrono3_mat_sun_before[1,5] = r(mu_2)
matrix chrono3_mat_sun_before[1,6] = r(sd_2)
matrix chrono3_mat_sun_before[1,7] = r(se)
matrix chrono3_mat_sun_before[1,8] = r(p)
matrix list chrono3_mat_sun_before

********************************************************
*Sleep duration


*Sleep duration category 1
ttest sleep_dur_sun_change == sleep_dur_sun_before if sleep_dur_cats ==1, unpaired
return list

matrix sleepdur1_mat_sun_before = J(1,8, .) 
matrix sleepdur1_mat_sun_before[1,1] = r(N_1)
matrix sleepdur1_mat_sun_before[1,2] = r(mu_1)
matrix sleepdur1_mat_sun_before[1,3] = r(sd_1)
matrix sleepdur1_mat_sun_before[1,4] = r(N_2)
matrix sleepdur1_mat_sun_before[1,5] = r(mu_2)
matrix sleepdur1_mat_sun_before[1,6] = r(sd_2)
matrix sleepdur1_mat_sun_before[1,7] = r(se)
matrix sleepdur1_mat_sun_before[1,8] = r(p)
matrix list sleepdur1_mat_sun_before

*Sleep duration category 2
ttest sleep_dur_sun_change == sleep_dur_sun_before if sleep_dur_cats ==2, unpaired
return list

matrix sleepdur2_mat_sun_before = J(1,8, .) 
matrix sleepdur2_mat_sun_before[1,1] = r(N_1)
matrix sleepdur2_mat_sun_before[1,2] = r(mu_1)
matrix sleepdur2_mat_sun_before[1,3] = r(sd_1)
matrix sleepdur2_mat_sun_before[1,4] = r(N_2)
matrix sleepdur2_mat_sun_before[1,5] = r(mu_2)
matrix sleepdur2_mat_sun_before[1,6] = r(sd_2)
matrix sleepdur2_mat_sun_before[1,7] = r(se)
matrix sleepdur2_mat_sun_before[1,8] = r(p)
matrix list sleepdur2_mat_sun_before


*Sleep duration category 3
ttest sleep_dur_sun_change == sleep_dur_sun_before if sleep_dur_cats ==3, unpaired
return list

matrix sleepdur3_mat_sun_before = J(1,8, .) 
matrix sleepdur3_mat_sun_before[1,1] = r(N_1)
matrix sleepdur3_mat_sun_before[1,2] = r(mu_1)
matrix sleepdur3_mat_sun_before[1,3] = r(sd_1)
matrix sleepdur3_mat_sun_before[1,4] = r(N_2)
matrix sleepdur3_mat_sun_before[1,5] = r(mu_2)
matrix sleepdur3_mat_sun_before[1,6] = r(sd_2)
matrix sleepdur3_mat_sun_before[1,7] = r(se)
matrix sleepdur3_mat_sun_before[1,8] = r(p)
matrix list sleepdur3_mat_sun_before


*******************************************************

*Employment status category 1
ttest sleep_dur_sun_change == sleep_dur_sun_before if employ_3cats ==1, unpaired
return list

matrix employ1_mat_sun_before = J(1,8, .) 
matrix employ1_mat_sun_before[1,1] = r(N_1)
matrix employ1_mat_sun_before[1,2] = r(mu_1)
matrix employ1_mat_sun_before[1,3] = r(sd_1)
matrix employ1_mat_sun_before[1,4] = r(N_2)
matrix employ1_mat_sun_before[1,5] = r(mu_2)
matrix employ1_mat_sun_before[1,6] = r(sd_2)
matrix employ1_mat_sun_before[1,7] = r(se)
matrix employ1_mat_sun_before[1,8] = r(p)
matrix list employ1_mat_sun_before

*Employment status category 2
ttest sleep_dur_sun_change == sleep_dur_sun_before if employ_3cats ==2, unpaired
return list

matrix employ2_mat_sun_before = J(1,8, .) 
matrix employ2_mat_sun_before[1,1] = r(N_1)
matrix employ2_mat_sun_before[1,2] = r(mu_1)
matrix employ2_mat_sun_before[1,3] = r(sd_1)
matrix employ2_mat_sun_before[1,4] = r(N_2)
matrix employ2_mat_sun_before[1,5] = r(mu_2)
matrix employ2_mat_sun_before[1,6] = r(sd_2)
matrix employ2_mat_sun_before[1,7] = r(se)
matrix employ2_mat_sun_before[1,8] = r(p)
matrix list employ2_mat_sun_before

*Employment status category 3
ttest sleep_dur_sun_change == sleep_dur_sun_before if employ_3cats ==3, unpaired
return list

matrix employ3_mat_sun_before = J(1,8, .) 
matrix employ3_mat_sun_before[1,1] = r(N_1)
matrix employ3_mat_sun_before[1,2] = r(mu_1)
matrix employ3_mat_sun_before[1,3] = r(sd_1)
matrix employ3_mat_sun_before[1,4] = r(N_2)
matrix employ3_mat_sun_before[1,5] = r(mu_2)
matrix employ3_mat_sun_before[1,6] = r(sd_2)
matrix employ3_mat_sun_before[1,7] = r(se)
matrix employ3_mat_sun_before[1,8] = r(p)
matrix list employ3_mat_sun_before

***************************************************

*1d) Combine the matricies into one matrix
matrix ttest_autumn_mat_sun_before = (overall_mat_sun_before \ age1_mat_sun_before \ age2_mat_sun_before \ age3_mat_sun_before \ sex0_mat_sun_before \ sex1_mat_sun_before\ chrono1_mat_sun_before\ chrono2_mat_sun_before \ chrono3_mat_sun_before \ sleepdur1_mat_sun_before \ sleepdur2_mat_sun_before \ sleepdur3_mat_sun_before \ employ1_mat_sun_before \ employ2_mat_sun_before \ employ3_mat_sun_before)
matrix list ttest_autumn_mat_sun_before

*Save the combined matrix
svmat ttest_autumn_mat_sun_before

*Only keep the combined matrix 
describe // obs 5524. vars 182
keep ttest_autumn_mat_sun_before* 
drop if ttest_autumn_mat_sun_before1 ==. // 5509 obs deleted
describe // 15 obs. 18 vars.

*Rename variables
rename ttest_autumn_mat_sun_before1 n_change
rename ttest_autumn_mat_sun_before2 mean_change
rename ttest_autumn_mat_sun_before3 sd_mean_change
rename ttest_autumn_mat_sun_before4 n_before
rename ttest_autumn_mat_sun_before5 mean_before
rename ttest_autumn_mat_sun_before6 sd_before
rename ttest_autumn_mat_sun_before7 se_mean_diff
rename ttest_autumn_mat_sun_before8 p_value
describe

*Calculate mean difference
gen mean_diff = mean_change - mean_before

*Re-order variables so mean diff is in right place
order n_change mean_change sd_mean_change n_before mean_before sd_before mean_diff se_mean_diff p_value
describe //

*Create variable for what the data is stratified by
gen stratified = ""
replace stratified = "Overall" in 1
replace stratified = "Age 43-58" in 2
replace stratified = "Age 59-67" in 3
replace stratified = "Age 68-78" in 4
replace stratified = "Female" in 5
replace stratified = "Male" in 6
replace stratified = "Morning" in 7
replace stratified = "No preference" in 8
replace stratified = "Evening" in 9
replace stratified = "<=6 hours" in 10
replace stratified = "7-8 hours" in 11
replace stratified = ">=9 hours" in 12
replace stratified = "Employed" in 13
replace stratified = "Retired" in 14
replace stratified = "Other" in 15


*Reorder variables so stratified is first
order stratified n_change
describe

*Calculate the 95% Confidence intervals of the mean difference
*95% CI = Mean ± (Z * Standard Error)
gen ci_upper = mean_diff + (1.96*se_mean_diff)
gen ci_lower = mean_diff - (1.96*se_mean_diff)

*Reorder vars
order stratified n_change mean_change sd_mean_change n_before mean_before sd_before mean_diff se_mean_diff p_value ci_lower ci_upper
describe // 15 obs. 12 vars.

*Save & upload as stata file
save "ttest_autumn_sun_before.dta", replace
!dx upload ttest_autumn_sun_before.dta

*Save & upload as excel file
export excel ttest_autumn_sun_before.xlsx, firstrow(varlabels) replace
!dx upload ttest_autumn_sun_before.xlsx
