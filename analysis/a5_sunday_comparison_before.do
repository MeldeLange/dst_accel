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
return list //p = 0.0035143557939267

*Power of estimate
*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE diff and 1.96*SE diff 
*Difference in SE = 3.721558 

*-1.96*3.721558  = -7.2942537
*1.96*3.721558 = 7.2942537
*The difference in effect size we have here = -10.87015
*We are powered to detect a difference of +/-7.2942537. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*********************************************************

*1b. Stratified

*AGE

bysort age_accel_tert:ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired



***************************
*Power of our estimates

*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE and 1.96*SE 

*age_accel_tert = 1
*Difference in SE = 6.428964


*-1.96*6.428964 = -12.600769
*1.96*6.428964  = 12.600769

*The difference in effect size we have here = -18.90582
*We are powered to detect a difference of +/-12.600769. This issmaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p = 0.0033 

********************

*age_accel_tert = 2
*Difference in SE = 6.026318

*-1.96*6.026318 = -11.811583
*1.96*6.026318 = 11.811583

*The difference in effect size we have here = -5.533074
*We are powered to detect a difference of +/-11.811583 . This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.3587

******************

*age_accel_tert = 3
*Difference in SE = 6.90724 

*-1.96*6.90724  = -13.53819
*1.96*6.90724   = 13.53819

*The difference in effect size we have here =  -6.366432
*We are powered to detect a difference of +/-13.53819. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.3569  

**************
*SEX

bysort sex: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


************

*Power of our estimates

*sex = female
*Difference in SE =  4.827259

*-1.96*4.827259  = -9.4614276
*1.96*4.827259 = 9.4614276

*The difference in effect size we have here =  -10.84549
*We are powered to detect a difference of +/-9.4614276 . This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p = 0.0248

*********


*sex = male
*Difference in SE = 5.824513

*-1.96*5.824513= -11.416045
*1.96*5.824513 = 11.416045

*The difference in effect size we have here = -10.90331
*We are powered to detect a difference of +/-11.416045. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p = 0.0614

*************************************


*CHRONOTYPE

bysort chrono_3cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


********************

*Power of our estimates

*chronotype = morning
*Difference in SE = 5.011405 

*-1.96*5.011405  = -9.8223538
*1.96*5.011405   = 9.8223538

*The difference in effect size we have here = -12.63009
*We are powered to detect a difference of +/-9.8223538. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p=0.0118
******************

*chronotype = no preference
*Difference in SE =  11.17763

*-1.96*11.17763  = -21.908155
*1.96*11.17763 = 21.908155

*The difference in effect size we have here = -.8136427 
*We are powered to detect a difference of +/-21.908155. This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.9420

******************

*chronotype = evening
*Difference in SE = 6.495652

*-1.96*6.495652 = -12.731478
*1.96*6.495652= 12.731478

*The difference in effect size we have here =  -11.30237
*We are powered to detect a difference of +/-12.731478. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.


*p= 0.0821
**********************************************************************************


*SLEEP DURATION

bysort sleep_dur_cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired

​
*****************

*Power of our estimates

*sleep dur <=6
*Difference in SE = 8.444218 

*-1.96*8.444218  = -16.550667
*1.96*8.444218  = 16.550667

*The difference in effect size we have here =  -7.477487
*We are powered to detect a difference of +/-16.550667 . This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p value: 0.3762 

**********

*sleep dur 7-8
*Difference in SE = 4.270396

*-1.96*4.270396 = -8.3699762
*1.96*4.270396= 8.3699762

*The difference in effect size we have here = -11.09996
*We are powered to detect a difference of +/-8.3699762. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*p value: 0.0094

************

*sleep dur >=9
*Difference in SE =  15.25212 

*-1.96*15.25212  = -29.894155
*1.96*15.25212  = 29.894155

*The difference in effect size we have here = -16.08454
*We are powered to detect a difference of +/-29.894155 . This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p value: 0.2928

*************************************************************


*EMPLOYMENT

bysort employ_3cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


*Power of our estimates

*employ= employed

*Difference in SE = 4.631706 

*-1.96*4.631706  = -9.0781438
*1.96*4.631706  = 9.0781438

*The difference in effect size we have here = -11.94386
*We are powered to detect a difference of +/-9.0781438. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p=0.0100

*******

*employ= retired
*Difference in SE = 6.646657

*-1.96*6.646657 = -13.027448
*1.96*6.646657= 13.027448

*The difference in effect size we have here = -6.328722
*We are powered to detect a difference of +/-13.027448. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p value: 0.3412

*******

*employ= other
*Difference in SE = 17.15196
*-1.96*17.15196 = -33.617842
*1.96*17.15196 =33.617842

*The difference in effect size we have here = -23.84731
*We are powered to detect a difference of +/-33.617842. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.1658 
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
describe // 4569 obs. 182 vars.
keep ttest_spring_mat_sun_before* 
drop if ttest_spring_mat_sun_before1 ==. // 4554 obs deleted
describe // obs: 15. vars: 8.

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
describe // 15 obs 12 vars.

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
*Difference in SE = 3.036138 

*-1.963.036138  = -5.9508305
*1.96*3.036138  = 5.9508305
*The difference in effect size we have here = -20.60507
*We are powered to detect a difference of +/-5.9508305. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p value: 1.28252583735e-11
*********************************************************

*2b. Stratified

*AGE

bysort age_accel_tert:ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired



***************************
*Power of our estimates

*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE and 1.96*SE 

*age_accel_tert = 1
*Difference in SE = 5.135479 


*-1.96*5.135479   = -10.065539
*1.96*5.135479  = 10.065539

*The difference in effect size we have here = -17.56446
*We are powered to detect a difference of +/-10.065539. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p =  0.0006 
********************

*age_accel_tert = 2
*Difference in SE =  4.9525 

*-1.96*4.9525   = -9.7069
*1.96*4.9525   = 9.7069

*The difference in effect size we have here = -20.67415
*We are powered to detect a difference of +/-9.7069 . This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p=0.0000 

******************

*age_accel_tert = 3
*Difference in SE =5.717352

*-1.96*5.717352 = -11.20601

*1.96*5.717352  = 11.20601


*The difference in effect size we have here = -23.72379 
*We are powered to detect a difference of +/-11.20601. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.



**************
*SEX

bysort sex: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


************

*Power of our estimates

*sex = female
*Difference in SE = 3.882946

*-1.96*3.882946   = -7.6105742
*1.96*3.882946  = 7.6105742

*The difference in effect size we have here =  -18.39501
*We are powered to detect a difference of +/-7.6105742. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*********


*sex = male
*Difference in SE =  4.822112

*-1.96*4.822112= -9.4513395
*1.96*4.822112= 9.4513395

*The difference in effect size we have here = -23.46995
*We are powered to detect a difference of +/-9.4513395. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*************************************


*CHRONOTYPE

bysort chrono_3cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


********************

*Power of our estimates

*chronotype = morning
*Difference in SE = 3.88635

*-1.96*3.88635  = -7.617246
*1.96*3.88635   = 7.617246

*The difference in effect size we have here = -22.38351
*We are powered to detect a difference of +/-7.617246. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.



******************

*chronotype = no preference
*Difference in SE =  10.82957 

*-1.96*10.82957  = -21.225957
*1.96*10.82957 = 21.225957

*The difference in effect size we have here = -15.89449
*We are powered to detect a difference of +/-21.225957. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.1428
******************

*chronotype = evening
*Difference in SE =  5.464812

*-1.96*5.464812 = -10.711032
*1.96*5.464812= 10.711032

*The difference in effect size we have here = -18.66865
*We are powered to detect a difference of +/-10.711032. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*p= 0.0007
**********************************************************************************


*SLEEP DURATION

bysort sleep_dur_cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired

​
*****************

*Power of our estimates

*sleep dur <=6
*Difference in SE = 7.010268 

*-1.96*7.010268  = -13.740125
*1.96*7.010268  = 13.740125

*The difference in effect size we have here = -23.75391
*We are powered to detect a difference of +/-13.740125 . This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p value: 0.0007

**********

*sleep dur 7-8
*Difference in SE =3.443836

*-1.96*3.443836 = -6.7499186
*1.96* 3.443836= 6.7499186

*The difference in effect size we have here = -19.76147
*We are powered to detect a difference of +/-6.7499186. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


************

*sleep dur >=9
*Difference in SE = 13.31277 
*-1.96*13.31277  = -26.093029
*1.96*13.31277   = 26.093029

*The difference in effect size we have here = -30.07113
*We are powered to detect a difference of +/-26.093029 . This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p value:0.0246 

*************************************************************


*EMPLOYMENT

bysort employ_3cats: ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired


*Power of our estimates

*employ= employed

*Difference in SE =  3.853391

*-1.96*3.853391  = -7.5526464
*1.96*3.853391 = 7.5526464

*The difference in effect size we have here = -19.0839
*We are powered to detect a difference of +/-7.5526464. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*******

*employ= retired
*Difference in SE = 5.349763
*-1.96*5.349763= -10.485535
*1.96*5.349763= 10.485535

*The difference in effect size we have here = -25.24711
*We are powered to detect a difference of +/-10.485535. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*******

*employ= other
*Difference in SE = 12.19414 
*-1.96*12.19414 = -23.900514
*1.96*12.19414  = 23.900514

*The difference in effect size we have here = -17.64363
*We are powered to detect a difference of +/-23.900514. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.1488 
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
describe // obs 7211. vars 182
keep ttest_autumn_mat_sun_before* 
drop if ttest_autumn_mat_sun_before1 ==. // 7196 obs deleted
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
