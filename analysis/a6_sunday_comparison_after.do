*Compare sleep duration on Sunday of clock change to Sunday after
***********************************************************************************

*Open dataset
use /mnt/project/accel10.dta, clear
set more off



*1 Loop to do overall graphs & t test of sunday after vs sunday of clock change for Autumn & Spring
levelsof season, local(levels)
foreach lev of local levels{
preserve
keep if season == "`lev'"	
*Histogram of sleep duration on Sunday after the clock change
hist sleep_dur_sun_after, freq normal
graph save "sun_after_hist_`lev'", replace
!dx upload sun_after_hist_`lev'.gph	
*Boxplot sleep duration on sunday of change vs sunday after
graph box sleep_dur_sun_after sleep_dur_sun_change
graph save "sun_change_after_box_`lev'", replace
!dx upload sun_change_after_box_`lev'.gph
*Unpaired t test to compare Sunday of change to Sunday after (Overall)
ttest sleep_dur_sun_change == sleep_dur_sun_after, unpaired
*Get actual p value
return list	
restore
}




*AUTUMN OVERALL ttest results


*Power of estimate
*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE diff and 1.96*SE diff 
*Difference in SE =3.047831

*-1.96*3.047831  = -5.9737488
*1.96*3.047831 = 5.9737488
*The difference in effect size we have here = -16.49434
*We are powered to detect a difference of +/-5.9737488. This is much smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*P value: 6.53354319995e-08
************************************

*SPRING OVERALL ttest results

*Power of estimate
*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE diff and 1.96*SE diff 
*Difference in SE =3.998999

*-1.96*3.998999  = -7.838038
*1.96*3.998999 = 7.838038
*The difference in effect size we have here = -7.13979
*We are powered to detect a difference of +/-7.838038. This is bigger than the difference we detected, so we are not powered to detect differences of the size we found.

*p value: 0.0743062947910364

**********************************************************************


*2.Loop to do t test of sunday after vs sunday of clock change stratified for Autumn and Spring
levelsof season, local(levels)
foreach lev of local levels{
preserve
keep if season == "`lev'"	
*AGE
bysort age_accel_tert:ttest sleep_dur_sun_change == sleep_dur_sun_after, unpaired	
*SEX
bysort sex: ttest sleep_dur_sun_change == sleep_dur_sun_after, unpaired
*CHRONOTYPE
bysort chrono_3cats: ttest sleep_dur_sun_change == sleep_dur_sun_after, unpaired
*SLEEP DURATION
bysort sleep_dur_cats: ttest sleep_dur_sun_change == sleep_dur_sun_after, unpaired
*EMPLOYMENT
bysort employ_3cats: ttest sleep_dur_sun_change == sleep_dur_sun_after, unpaired
restore
}

***************************

*AUTUMN - Power of our estimates

*AGE

*age_accel_tert = 1
*Difference in SE = 5.458101 

*-1.96*5.458101  = -10.697878
*1.96*5.458101   = 10.697878

*The difference in effect size we have here = -7.69467
*We are powered to detect a difference of +/-10.697878 This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.


*****

*age_accel_tert = 2
*Difference in SE = 4.87876

*-1.96*4.87876 = -9.5623696
*1.96*4.87876  =9.5623696

*The difference in effect size we have here = -18.82123
*We are powered to detect a difference of +/-9.5623696 This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*****

*age_accel_tert = 3
*Difference in SE = 5.52476

*-1.96*5.52476 = -10.82853
*1.96*5.52476  =10.82853

*The difference in effect size we have here = -24.11262
*We are powered to detect a difference of +/-10.82853. This is much smaller than the difference we detected, so we are well powered to detect differences of the size we found.



******************

*SEX

*sex = female
*Difference in SE = 3.97268 

*-1.96*3.97268  =-7.7864528
*1.96*3.97268  = 7.7864528

*The difference in effect size we have here = -13.99543
*We are powered to detect a difference of +/-7.7864528. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*********


*sex = male
*Difference in SE = 4.728057

*-1.96*4.728057= -9.2669917
*1.96*4.728057 = 9.2669917

*The difference in effect size we have here = -19.54466
*We are powered to detect a difference of +/-9.2669917. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*************************************

*CHRONOTYPE

*chronotype = morning
*Difference in SE = 3.900082

*-1.96*3.900082= -7.6441607
*1.96*3.900082  = 7.6441607

*The difference in effect size we have here = -13.40344
*We are powered to detect a difference of +/-7.6441607. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


******

*chronotype = no preference
*Difference in SE = 10.34783

*-1.96*10.34783 = -20.281747
*1.96*10.34783 = 20.281747

*The difference in effect size we have here = -15.07536
*We are powered to detect a difference of +/-20.281747. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.


*****

*chronotype = evening
*Difference in SE =  5.600213

*-1.96*5.600213 = -10.976417
*1.96*5.600213= 10.976417

*The difference in effect size we have here = -23.21376
*We are powered to detect a difference of +/-10.976417. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


************************


*SLEEP DURATION


*sleep dur <=6
*Difference in SE = 7.100321

*-1.96*7.100321 = -13.916629
*1.96*7.100321 = 13.916629

*The difference in effect size we have here = -10.97876
*We are powered to detect a difference of +/-13.916629 . This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.


**********

*sleep dur 7-8
*Difference in SE = 3.456767

*-1.96*3.456767 = -6.7752633
*1.96*3.456767 = 6.7752633

*The difference in effect size we have here = -16.65898
*We are powered to detect a difference of +/-6.7752633. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


************

*sleep dur >=9
*Difference in SE =12.94245

*-1.96*12.94245= -25.367202
*1.96*12.94245 = 25.367202

*The difference in effect size we have here = -28.98857
*We are powered to detect a difference of +/-25.367202 . This is much smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*************************************************************


*EMPLOYMENT

*employ= employed

*Difference in SE = 3.887511

*-1.96*3.887511 = -7.6195216
*1.96*3.887511 = 7.6195216

*The difference in effect size we have here =  -11.57787
*We are powered to detect a difference of +/-7.6195216. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*******

*employ= retired
*Difference in SE = 5.212265

*-1.96*5.212265 = -10.216039
*1.96*5.212265= 10.216039

*The difference in effect size we have here = -21.81268
*We are powered to detect a difference of +/-10.216039. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.



*******

*employ= other
*Difference in SE = 13.10534
*-1.96*13.10534 = -25.686466
*1.96*13.10534 =25.686466

*The difference in effect size we have here = -38.10843
*We are powered to detect a difference of +/-25.686466. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

**************************************************************************


*SPRING - Power of our estimates

*AGE

*age_accel_tert = 1
*Difference in SE = 6.855191

*-1.96*6.855191 = -13.436174
*1.96*6.855191  = 13.436174

*The difference in effect size we have here = -7.791369
*We are powered to detect a difference of +/-13.436174 This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p = 0.2560 

*****

*age_accel_tert = 2
*Difference in SE = 6.728892

*-1.96*6.728892 = -13.188628
*1.96*6.728892  = 13.188628

*The difference in effect size we have here = -5.18789 
*We are powered to detect a difference of +/-13.188628 This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p = 0.4409 

*****

*age_accel_tert = 3
*Difference in SE = 7.160296 

*-1.96*7.160296  = -14.03418
*1.96*7.160296  = 14.03418


*The difference in effect size we have here = -8.301534
*We are powered to detect a difference of +/-14.03418. This is bigger than the difference we detected, so we are well not powered to detect differences of the size we found.

*p = 0.2467 

******************

*SEX

*sex = female
*Difference in SE = 5.168961

*-1.96*5.168961  = -10.131164
*1.96*5.168961 = 10.131164

*The difference in effect size we have here = -7.61488
*We are powered to detect a difference of +/-10.131164. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p = 0.1409

*********


*sex = male
*Difference in SE = 6.291505

*-1.96*6.291505= -12.33135
*1.96*6.291505 = 12.33135

*The difference in effect size we have here = -6.552833
*We are powered to detect a difference of +/-12.33135. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p = 0.2978

*************************************

*CHRONOTYPE

*chronotype = morning
*Difference in SE =  5.254859

*-1.96* 5.254859 = -10.299524
*1.96* 5.254859  = 10.299524

*The difference in effect size we have here = -11.40302
*We are powered to detect a difference of +/-10.299524. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p= 0.0302 
******

*chronotype = no preference
*Difference in SE = 13.26005 

*-1.96*13.26005  = -25.989698
*1.96*13.26005  = 25.989698

*The difference in effect size we have here = -.8758014
*We are powered to detect a difference of +/-25.989698. This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p=0.9474

*****

*chronotype = evening
*Difference in SE =  7.016837

*-1.96*7.016837 = -13.753001
*1.96*7.016837= 13.753001

*The difference in effect size we have here = 1.003444
*We are powered to detect a difference of +/-13.753001. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.


*p= 0.8863 
************************


*SLEEP DURATION


*sleep dur <=6
*Difference in SE = 9.225717

*-1.96*9.225717 = -18.082405
*1.96*9.225717 = 18.082405

*The difference in effect size we have here = -9.735623
*We are powered to detect a difference of +/-18.082405 . This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p value: 0.2917

**********

*sleep dur 7-8
*Difference in SE = 4.612413

*-1.96*4.612413 = -9.0403295
*1.96*4.612413 = 9.0403295

*The difference in effect size we have here = -7.432156
*We are powered to detect a difference of +/-9.0403295. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.


*p value: 0.1073 

************

*sleep dur >=9
*Difference in SE =15.07772

*-1.96*15.07772= -29.552331
*1.96*15.07772  = 29.552331

*The difference in effect size we have here = 6.158151
*We are powered to detect a difference of +/-29.552331. This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p value: 0.6835

*************************************************************


*EMPLOYMENT

*employ= employed

*Difference in SE = 5.076997

*-1.96*5.076997 = -9.9509141
*1.96*5.076997 = 9.9509141

*The difference in effect size we have here =  -10.83119
*We are powered to detect a difference of +/-9.9509141. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p=0.0330

*******

*employ= retired
*Difference in SE = 6.896002

*-1.96*6.896002 = -13.516164
*1.96*6.896002= 13.516164

*The difference in effect size we have here = -4.847804
*We are powered to detect a difference of +/-13.516164. This is bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p value: 0.4822

*******

*employ= other
*Difference in SE =  17.96248
*-1.96* 17.96248 = -35.206461
*1.96* 17.96248 = 35.206461

*The difference in effect size we have here = 9.566113
*We are powered to detect a difference of +/-35.206461. This is much bigger than the difference we detected, so we are not well powered to detect differences of the size we found.

*p value: 0.5949 
**************************************************************************


*3.  Get results of overall & stratified t tests out into spreadsheet.

levelsof season, local(levels)
foreach lev of local levels{
preserve
keep if season == "`lev'"	
*Create matricies for overall, by categories of age, sex, chronotype, sleep duration & employment.

	*Overall
ttest sleep_dur_sun_change == sleep_dur_sun_after, unpaired
return list
matrix overall_mat_sun_after = J(1,8, .) // Create empty 1 x 8 matrix
matrix overall_mat_sun_after[1,1] = r(N_1)
matrix overall_mat_sun_after[1,2] = r(mu_1)
matrix overall_mat_sun_after[1,3] = r(sd_1)
matrix overall_mat_sun_after[1,4] = r(N_2)
matrix overall_mat_sun_after[1,5] = r(mu_2)
matrix overall_mat_sun_after[1,6] = r(sd_2)
matrix overall_mat_sun_after[1,7] = r(se)
matrix overall_mat_sun_after[1,8] = r(p)
matrix list overall_mat_sun_after


******************************

 *Age category 1
ttest sleep_dur_sun_change == sleep_dur_sun_after if age_accel_tert ==1, unpaired
return list

matrix age1_mat_sun_after = J(1,8, .) 
matrix age1_mat_sun_after[1,1] = r(N_1)
matrix age1_mat_sun_after[1,2] = r(mu_1)
matrix age1_mat_sun_after[1,3] = r(sd_1)
matrix age1_mat_sun_after[1,4] = r(N_2)
matrix age1_mat_sun_after[1,5] = r(mu_2)
matrix age1_mat_sun_after[1,6] = r(sd_2)
matrix age1_mat_sun_after[1,7] = r(se)
matrix age1_mat_sun_after[1,8] = r(p)
matrix list age1_mat_sun_after


*Age category 2
ttest sleep_dur_sun_change == sleep_dur_sun_after if age_accel_tert ==2, unpaired
return list
matrix age2_mat_sun_after = J(1,8, .) 
matrix age2_mat_sun_after[1,1] = r(N_1)
matrix age2_mat_sun_after[1,2] = r(mu_1)
matrix age2_mat_sun_after[1,3] = r(sd_1)
matrix age2_mat_sun_after[1,4] = r(N_2)
matrix age2_mat_sun_after[1,5] = r(mu_2)
matrix age2_mat_sun_after[1,6] = r(sd_2)
matrix age2_mat_sun_after[1,7] = r(se)
matrix age2_mat_sun_after[1,8] = r(p)
matrix list age2_mat_sun_after

*Age category 3
ttest sleep_dur_sun_change == sleep_dur_sun_after if age_accel_tert ==3, unpaired
return list
matrix age3_mat_sun_after = J(1,8, .) 
matrix age3_mat_sun_after[1,1] = r(N_1)
matrix age3_mat_sun_after[1,2] = r(mu_1)
matrix age3_mat_sun_after[1,3] = r(sd_1)
matrix age3_mat_sun_after[1,4] = r(N_2)
matrix age3_mat_sun_after[1,5] = r(mu_2)
matrix age3_mat_sun_after[1,6] = r(sd_2)
matrix age3_mat_sun_after[1,7] = r(se)
matrix age3_mat_sun_after[1,8] = r(p)
matrix list age3_mat_sun_after
*****************

 *Sex category 0 (female)
tab sex
tab sex, nolabel
ttest sleep_dur_sun_change == sleep_dur_sun_after if sex ==0, unpaired
return list
matrix sex0_mat_sun_after = J(1,8, .) 
matrix sex0_mat_sun_after[1,1] = r(N_1)
matrix sex0_mat_sun_after[1,2] = r(mu_1)
matrix sex0_mat_sun_after[1,3] = r(sd_1)
matrix sex0_mat_sun_after[1,4] = r(N_2)
matrix sex0_mat_sun_after[1,5] = r(mu_2)
matrix sex0_mat_sun_after[1,6] = r(sd_2)
matrix sex0_mat_sun_after[1,7] = r(se)
matrix sex0_mat_sun_after[1,8] = r(p)
matrix list sex0_mat_sun_after


 *Sex category 1

ttest sleep_dur_sun_change == sleep_dur_sun_after if sex ==1, unpaired
return list

matrix sex1_mat_sun_after = J(1,8, .) 
matrix sex1_mat_sun_after[1,1] = r(N_1)
matrix sex1_mat_sun_after[1,2] = r(mu_1)
matrix sex1_mat_sun_after[1,3] = r(sd_1)
matrix sex1_mat_sun_after[1,4] = r(N_2)
matrix sex1_mat_sun_after[1,5] = r(mu_2)
matrix sex1_mat_sun_after[1,6] = r(sd_2)
matrix sex1_mat_sun_after[1,7] = r(se)
matrix sex1_mat_sun_after[1,8] = r(p)
matrix list sex1_mat_sun_after

******************************************************************

*Chronotype

*Chronotype category 1
ttest sleep_dur_sun_change == sleep_dur_sun_after if chrono_3cats ==1, unpaired
return list

matrix chrono1_mat_sun_after = J(1,8, .) 
matrix chrono1_mat_sun_after[1,1] = r(N_1)
matrix chrono1_mat_sun_after[1,2] = r(mu_1)
matrix chrono1_mat_sun_after[1,3] = r(sd_1)
matrix chrono1_mat_sun_after[1,4] = r(N_2)
matrix chrono1_mat_sun_after[1,5] = r(mu_2)
matrix chrono1_mat_sun_after[1,6] = r(sd_2)
matrix chrono1_mat_sun_after[1,7] = r(se)
matrix chrono1_mat_sun_after[1,8] = r(p)
matrix list chrono1_mat_sun_after

*Chronotype category 2
ttest sleep_dur_sun_change == sleep_dur_sun_after if chrono_3cats ==2, unpaired
return list
matrix chrono2_mat_sun_after = J(1,8, .) 
matrix chrono2_mat_sun_after[1,1] = r(N_1)
matrix chrono2_mat_sun_after[1,2] = r(mu_1)
matrix chrono2_mat_sun_after[1,3] = r(sd_1)
matrix chrono2_mat_sun_after[1,4] = r(N_2)
matrix chrono2_mat_sun_after[1,5] = r(mu_2)
matrix chrono2_mat_sun_after[1,6] = r(sd_2)
matrix chrono2_mat_sun_after[1,7] = r(se)
matrix chrono2_mat_sun_after[1,8] = r(p)
matrix list chrono2_mat_sun_after


*Chronotype category 3
ttest sleep_dur_sun_change == sleep_dur_sun_after if chrono_3cats ==3, unpaired
return list

matrix chrono3_mat_sun_after= J(1,8, .) 
matrix chrono3_mat_sun_after[1,1] = r(N_1)
matrix chrono3_mat_sun_after[1,2] = r(mu_1)
matrix chrono3_mat_sun_after[1,3] = r(sd_1)
matrix chrono3_mat_sun_after[1,4] = r(N_2)
matrix chrono3_mat_sun_after[1,5] = r(mu_2)
matrix chrono3_mat_sun_after[1,6] = r(sd_2)
matrix chrono3_mat_sun_after[1,7] = r(se)
matrix chrono3_mat_sun_after[1,8] = r(p)
matrix list chrono3_mat_sun_after

********************************************************
*Sleep duration


*Sleep duration category 1
ttest sleep_dur_sun_change == sleep_dur_sun_after if sleep_dur_cats ==1, unpaired
return list

matrix sleepdur1_mat_sun_after = J(1,8, .) 
matrix sleepdur1_mat_sun_after[1,1] = r(N_1)
matrix sleepdur1_mat_sun_after[1,2] = r(mu_1)
matrix sleepdur1_mat_sun_after[1,3] = r(sd_1)
matrix sleepdur1_mat_sun_after[1,4] = r(N_2)
matrix sleepdur1_mat_sun_after[1,5] = r(mu_2)
matrix sleepdur1_mat_sun_after[1,6] = r(sd_2)
matrix sleepdur1_mat_sun_after[1,7] = r(se)
matrix sleepdur1_mat_sun_after[1,8] = r(p)
matrix list sleepdur1_mat_sun_after

*Sleep duration category 2
ttest sleep_dur_sun_change == sleep_dur_sun_after if sleep_dur_cats ==2, unpaired
return list

matrix sleepdur2_mat_sun_after = J(1,8, .) 
matrix sleepdur2_mat_sun_after[1,1] = r(N_1)
matrix sleepdur2_mat_sun_after[1,2] = r(mu_1)
matrix sleepdur2_mat_sun_after[1,3] = r(sd_1)
matrix sleepdur2_mat_sun_after[1,4] = r(N_2)
matrix sleepdur2_mat_sun_after[1,5] = r(mu_2)
matrix sleepdur2_mat_sun_after[1,6] = r(sd_2)
matrix sleepdur2_mat_sun_after[1,7] = r(se)
matrix sleepdur2_mat_sun_after[1,8] = r(p)
matrix list sleepdur2_mat_sun_after


*Sleep duration category 3
ttest sleep_dur_sun_change == sleep_dur_sun_after if sleep_dur_cats ==3, unpaired
return list

matrix sleepdur3_mat_sun_after = J(1,8, .) 
matrix sleepdur3_mat_sun_after[1,1] = r(N_1)
matrix sleepdur3_mat_sun_after[1,2] = r(mu_1)
matrix sleepdur3_mat_sun_after[1,3] = r(sd_1)
matrix sleepdur3_mat_sun_after[1,4] = r(N_2)
matrix sleepdur3_mat_sun_after[1,5] = r(mu_2)
matrix sleepdur3_mat_sun_after[1,6] = r(sd_2)
matrix sleepdur3_mat_sun_after[1,7] = r(se)
matrix sleepdur3_mat_sun_after[1,8] = r(p)
matrix list sleepdur3_mat_sun_after


*******************************************************

*Employment status category 1
ttest sleep_dur_sun_change == sleep_dur_sun_after if employ_3cats ==1, unpaired
return list

matrix employ1_mat_sun_after = J(1,8, .) 
matrix employ1_mat_sun_after[1,1] = r(N_1)
matrix employ1_mat_sun_after[1,2] = r(mu_1)
matrix employ1_mat_sun_after[1,3] = r(sd_1)
matrix employ1_mat_sun_after[1,4] = r(N_2)
matrix employ1_mat_sun_after[1,5] = r(mu_2)
matrix employ1_mat_sun_after[1,6] = r(sd_2)
matrix employ1_mat_sun_after[1,7] = r(se)
matrix employ1_mat_sun_after[1,8] = r(p)
matrix list employ1_mat_sun_after

*Employment status category 2
ttest sleep_dur_sun_change == sleep_dur_sun_after if employ_3cats ==2, unpaired
return list

matrix employ2_mat_sun_after= J(1,8, .) 
matrix employ2_mat_sun_after[1,1] = r(N_1)
matrix employ2_mat_sun_after[1,2] = r(mu_1)
matrix employ2_mat_sun_after[1,3] = r(sd_1)
matrix employ2_mat_sun_after[1,4] = r(N_2)
matrix employ2_mat_sun_after[1,5] = r(mu_2)
matrix employ2_mat_sun_after[1,6] = r(sd_2)
matrix employ2_mat_sun_after[1,7] = r(se)
matrix employ2_mat_sun_after[1,8] = r(p)
matrix list employ2_mat_sun_after

*Employment status category 3
ttest sleep_dur_sun_change == sleep_dur_sun_after if employ_3cats ==3, unpaired
return list

matrix employ3_mat_sun_after = J(1,8, .) 
matrix employ3_mat_sun_after[1,1] = r(N_1)
matrix employ3_mat_sun_after[1,2] = r(mu_1)
matrix employ3_mat_sun_after[1,3] = r(sd_1)
matrix employ3_mat_sun_after[1,4] = r(N_2)
matrix employ3_mat_sun_after[1,5] = r(mu_2)
matrix employ3_mat_sun_after[1,6] = r(sd_2)
matrix employ3_mat_sun_after[1,7] = r(se)
matrix employ3_mat_sun_after[1,8] = r(p)
matrix list employ3_mat_sun_after

***************************************************
*Combine the matricies into one matrix
matrix ttest_`lev'_mat_sun_after = (overall_mat_sun_after \ age1_mat_sun_after \ age2_mat_sun_after \ age3_mat_sun_after \ sex0_mat_sun_after \ sex1_mat_sun_after\ chrono1_mat_sun_after\ chrono2_mat_sun_after \ chrono3_mat_sun_after \ sleepdur1_mat_sun_after \ sleepdur2_mat_sun_after \ sleepdur3_mat_sun_after \ employ1_mat_sun_after \ employ2_mat_sun_after \ employ3_mat_sun_after)
matrix list ttest_`lev'_mat_sun_after

*Save the combined matrix
svmat ttest_`lev'_mat_sun_after

*Only keep the combined matrix 
describe // 
keep ttest_`lev'_mat_sun_after* 
drop if ttest_`lev'_mat_sun_after1 ==. 
describe

*Rename variables
rename ttest_`lev'_mat_sun_after1 n_change
rename ttest_`lev'_mat_sun_after2 mean_change
rename ttest_`lev'_mat_sun_after3 sd_mean_change
rename ttest_`lev'_mat_sun_after4 n_after
rename ttest_`lev'_mat_sun_after5 mean_after
rename ttest_`lev'_mat_sun_after6 sd_after
rename ttest_`lev'_mat_sun_after7 se_mean_diff
rename ttest_`lev'_mat_sun_after8 p_value
describe

*Calculate mean difference
gen mean_diff = mean_change - mean_after

*Re-order variables so mean diff is in right place
order n_change mean_change sd_mean_change n_after mean_after sd_after mean_diff se_mean_diff p_value
describe 

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
order stratified n_change mean_change sd_mean_change n_after mean_after sd_after mean_diff se_mean_diff p_value ci_lower ci_upper
describe // 

*Save & upload as stata file
save "ttest_`lev'_sun_after.dta", replace
!dx upload ttest_`lev'_sun_after.dta

*Save & upload as excel file
export excel ttest_`lev'_sun_after.xlsx, firstrow(varlabels) replace
!dx upload ttest_`lev'_sun_after.xlsx
restore

}


