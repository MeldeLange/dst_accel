*a11: Sensitivity analysis - night shift workers
*******************************************


*1. Save & clean night shift worker dataset
*********************************

set more off
import delimited /mnt/project/night_shift.csv, clear
describe 

*Save nightshift data as stata .dta file & upload to DNA Nexus project
save night_shift.dta, replace
!dx upload night_shift.dta

*Rename & nightshift variable & turn into binary variable
rename v2 night_shift
label variable night_shift "Night shift workers (3426)"
tab night_shift, missing
recode night_shift (-3 -1=.)
recode night_shift (1=0)
recode night_shift (2 3 4 = 1)
tab night_shift, missing
label define night_shift_lb 1"Yes" 0"No"
label values night_shift night_shift_lb 
tab night_shift, missing

*Save cleaned nightshift dataset
save night_shift2.dta, replace
!dx upload night_shift2.dta

************************************************************************
*2. Merge night shift data with main dataset
************************************************
merge 1:1 eid using /mnt/project/accel10.dta // 11,780 matched.
keep if _merge ==3 // 11,780 obs
describe
drop _merge


*Only keep those who don't do night shift work
count if night_shift ==1 // 465 (out of 11,780 in main analysis == 4.8).
count if night_shift ==1 & season =="Spring" // 192.(out of 2569 in main analysis == 7.5%) 
count if night_shift ==1 & season =="Autumn" // 273 (out of 7211 in main analysis == 3.8%) 
drop if night_shift ==1 // 465 obs deleted.
describe // 11,315 obs.
count if season =="Spring" // 4377
count if season =="Autumn" //6938


*Save merged dataset
save sensitivity.dta, replace
!dx upload sensitivity.dta

**********************************************************************

*3. Look at sleep duration by day
*******************************************

*Create table sleep duration

*Spring
tab start_day if season =="Spring"

*start_day |      Freq.     Percent        Cum.
*------------+-----------------------------------
*          1 |        385        8.80        8.80
*          2 |        233        5.32       14.12
*          3 |        232        5.30       19.42
*          4 |        474       10.83       30.25
*          5 |        397        9.07       39.32
*          6 |        363        8.29       47.61
*          7 |         99        2.26       49.87
*          8 |        161        3.68       53.55
*          9 |        331        7.56       61.11
*         10 |        485       11.08       72.20
*         11 |        450       10.28       82.48
*         12 |        183        4.18       86.66
*         13 |        255        5.83       92.48
*         14 |        113        2.58       95.07
*         15 |        216        4.93      100.00
*------------+-----------------------------------
*      Total |      4,377      100.00



sum sleep_dur_sun_before if season =="Spring" // obs 1,721  Mean:  564.2189
sum sleep_dur_mon_before if season =="Spring" // 1,336     522.679
sum sleep_dur_tue_before if season =="Spring" //   1,699     516.351
sum  sleep_dur_wed_before if season =="Spring" //   1,466     510.672
sum  sleep_dur_thur_before if season =="Spring" // 1,333     517.895  
sum  sleep_dur_fri_before if season =="Spring" //  1,020    515.6047
sum  sleep_dur_sat_before if season =="Spring" //    954     555.517
sum  sleep_dur_sun_change if season =="Spring" //   1,439    499.1141
sum  sleep_dur_mon_after if season =="Spring" //     1,076    525.8007
sum  sleep_dur_tue_after if season =="Spring" //  1,526    523.0144
sum  sleep_dur_wed_after if season =="Spring" //    1,427    521.4374 
sum  sleep_dur_thur_after if season =="Spring" //   1,449    517.0783  
sum  sleep_dur_fri_after if season =="Spring" //    1,373    535.0549
sum  sleep_dur_sat_after if season =="Spring" //     1,001     543.431
sum  sleep_dur_sun_after if season =="Spring" //     1,217    560.0145

*Sleep duration on Sun of clock change is 65.1048 minutes less than Sunday before.
*Sleep duration on Sun of clock change is 60.9004 minutes less than the Sunday after.


*Autumn
tab start_day if season =="Autumn"

*  start_day |      Freq.     Percent        Cum.
*------------+-----------------------------------
*          1 |        421        6.07        6.07
*          2 |        401        5.78       11.85
*          3 |        371        5.35       17.20
*          4 |        423        6.10       23.29
*          5 |        575        8.29       31.58
*          6 |        672        9.69       41.27
*          7 |        416        6.00       47.26
*          8 |        628        9.05       56.31
*          9 |        334        4.81       61.13
*         10 |        538        7.75       68.88
*         11 |        387        5.58       74.46
*         12 |        459        6.62       81.08
*         13 |        488        7.03       88.11
*         14 |        338        4.87       92.98
*         15 |        487        7.02      100.00
*------------+-----------------------------------
*      Total |      6,938      100.00

sum sleep_dur_sun_before if season =="Autumn" // 2,191    569.9732 
sum sleep_dur_mon_before if season =="Autumn" //  1,770    523.7939 
sum sleep_dur_tue_before if season =="Autumn" // 2,442    523.2295
sum sleep_dur_wed_before if season =="Autumn" //  2,041    522.2452
sum sleep_dur_thur_before if season =="Autumn" // 2,086    520.2017
sum sleep_dur_fri_before if season =="Autumn" // 2,291    521.5867
sum sleep_dur_sat_before if season =="Autumn" // 2,050     541.447
sum sleep_dur_sun_change if season =="Autumn" // 2,588    602.9138
sum sleep_dur_mon_after if season =="Autumn" // 1,916    525.9232
sum sleep_dur_tue_after if season =="Autumn" //  2,303     527.085
sum sleep_dur_wed_after if season =="Autumn" // 1,887    523.5587
sum sleep_dur_thur_after if season =="Autumn" // 1,718    523.5297
sum sleep_dur_fri_after if season =="Autumn" //  1,872    525.0308 
sum sleep_dur_sat_after if season =="Autumn" // 1,672    540.1723
sum sleep_dur_sun_after if season =="Autumn" // 2,159    566.1688

*Sleep duration on Sun of clock change is 32.9406 minutes more than Sunday before.
*Sleep duration on Sun of clock change is 36.745 than the Sunday after.


************************************************************************************

*4. Create matrices for Spring & Autumn
*************************************

*a) Spring

*Open sensitivity dataset
set more off
use /mnt/project/sensitivity.dta, clear

keep if season =="Spring" // 6938 obs deleted.

*Generate mean & se of each sleep duration day variable.
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 


return list

*Name matrix
matrix sens_spring_mat = r(StatTotal)	  
matrix list sens_spring_mat

	
*Save matrix
svmat sens_spring_mat

*Just keep matrix variables
keep sens_spring_mat*
list in 1/5

*Drop empty observation rows
drop if sens_spring_mat1 ==. 
describe // 
list 

*Save as stata & excel file
save "sens_spring_mat.dta", replace
!dx upload sens_spring_mat.dta

export excel sens_spring_mat.xlsx, firstrow(varlabels) replace
!dx upload sens_spring_mat.xlsx


****************

*b) Autumn
 
*Open sensitivity dataset
set more off
use /mnt/project/sensitivity.dta, clear

keep if season =="Autumn" //4377 obs deleted.

*Generate mean & se of each sleep duration day variable.
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 


return list

*Name matrix
matrix sens_autumn_mat = r(StatTotal)	  
matrix list sens_autumn_mat

	
*Save matrix
svmat sens_autumn_mat

*Just keep matrix variables
keep sens_autumn_mat*
list in 1/5

*Drop empty observation rows
drop if sens_autumn_mat1 ==. 
describe // 
list 

*Save as stata & excel file
save "sens_autumn_mat.dta", replace
!dx upload sens_autumn_mat.dta

export excel sens_autumn_mat.xlsx, firstrow(varlabels) replace
!dx upload sens_autumn_mat.xlsx


*******************************************************************************
*5. Create coefficient plots for sleep duration by day (in hours)
******************************************************************

*[Download spring_mat.xlsx manually from DNA Nexus project]

**In stata on desktop**

*Set working directory
cd "....sensitivity_analysis"

*a) Spring

import excel "sens_spring_mat.xlsx", firstrow clear
browse


*Turn dataset into a matrix
mkmat sens_spring_mat1 sens_spring_mat2 sens_spring_mat3 sens_spring_mat4 sens_spring_mat5 sens_spring_mat6 sens_spring_mat7 sens_spring_mat8 sens_spring_mat9 sens_spring_mat10 sens_spring_mat11 sens_spring_mat12 sens_spring_mat13 sens_spring_mat14 sens_spring_mat15, matrix(sens_spring_mat)

matrix list sens_spring_mat

*Create coeffplot
	*Install coefficient plot package
ssc install coefplot
*Create coefplot
coefplot mat(sens_spring_mat), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)


*Save as stata graph, pdf & windows metafile
graph save "sens_spring_coefplot", replace
graph export "sens_spring_coefplot.wmf", replace
graph export "sens_spring_coefplot.pdf", as(pdf) replace 
graph export "sens_spring_coefplot.eps", replace


*b) Autumn
*[Download autumn_mat.xlsx manually from DNA Nexus project]

**In stata on desktop**

*Set working directory
cd "....sensitivity_analysis"

import excel "sens_autumn_mat.xlsx", firstrow clear


*Turn dataset into a matrix
mkmat sens_autumn_mat1 sens_autumn_mat2 sens_autumn_mat3 sens_autumn_mat4 sens_autumn_mat5 sens_autumn_mat6 sens_autumn_mat7 sens_autumn_mat8 sens_autumn_mat9 sens_autumn_mat10 sens_autumn_mat11 sens_autumn_mat12 sens_autumn_mat13 sens_autumn_mat14 sens_autumn_mat15, matrix(sens_autumn_mat)

matrix list sens_autumn_mat

*Create coefplot
coefplot mat(sens_autumn_mat), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)



*Save as stata graph, pdf & windows metafile
graph save "sens_autumn_coefplot", replace
graph export "sens_autumn_coefplot.wmf", replace
graph export "sens_autumn_coefplot.pdf", as(pdf) replace 
graph export "sens_autumn_coefplot.eps", replace



*******************************************************************

*6. Compare sleep duration on Sunday of clock change to Sunday before
***********************************************************************

*a) Spring

*Open dataset
use /mnt/project/sensitivity.dta, clear
set more off
keep if season =="Spring" 


*Histrogram of sleep duration on Sunday before the clock change
hist sleep_dur_sun_before, freq normal
graph save "sens_sun_before_hist_spring", replace
!dx upload sens_sun_before_hist_spring.gph

*Histrogram of sleep dur on Sunday of the clock change
hist sleep_dur_sun_change, freq normal
graph save "sens_sun_change_hist_spring", replace
!dx upload sens_sun_change_hist_spring.gph

*Boxplot
graph box sleep_dur_sun_before sleep_dur_sun_change
graph save "sens_sun_change_before_box_spring", replace
!dx upload sens_sun_change_before_box_spring.gph

*Unpaired t test to compare Sunday of change to Sunday before
ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired

*Two-sample t test with equal variances
*------------------------------------------------------------------------------
*Variable |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
*---------+--------------------------------------------------------------------
*sleep~ge |   1,439    499.1141    2.831594    107.4141    493.5596    504.6686
*sleep_.. |   1,721    564.2189    2.499238    103.6807    559.3171    569.1208
*---------+--------------------------------------------------------------------
*combined |   3,160    534.5715    1.961383    110.2569    530.7258    538.4172
*---------+--------------------------------------------------------------------
*    diff |           -65.10484    3.764883                -72.4867   -57.72297
*------------------------------------------------------------------------------
*    diff = mean(sleep_dur_sun~ge) - mean(sleep_dur_sun~re)        t = -17.2927
*Ho: diff = 0                                     degrees of freedom =     3158
*
*    Ha: diff < 0                 Ha: diff != 0                 Ha: diff > 0
* Pr(T < t) = 0.0000         Pr(|T| > |t|) = 0.0000          Pr(T > t) = 1.0000


*Get actual p value
return list // 4.37055096046e-64

*Power of estimate
*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE diff and 1.96*SE diff 
*Difference in SE = 3.764883 

*-1.96*3.764883  = -7.3791707
*1.96*3.764883 = 7.3791707
*The difference in effect size we have here =  -65.10484
*We are powered to detect a difference of +/-7.3791707. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*******************
*b. Between person t test comparing Sunday of clock change to Sunday before (AUTUMN)

*Open dataset
use /mnt/project/sensitivity.dta, clear
set more off
keep if season =="Autumn" 


*Histrogram of sleep duration on Sunday before the clock change
hist sleep_dur_sun_before, freq normal
graph save "sens_sun_before_hist_autumn", replace
!dx upload sens_sun_before_hist_autumn.gph

*Histrogram of sleep dur on Sunday of the clock change
hist sleep_dur_sun_change, freq normal
graph save "sens_sun_change_hist_autumn", replace
!dx upload sens_sun_change_hist_autumn.gph

*Boxplot
graph box sleep_dur_sun_before sleep_dur_sun_change
graph save "sens_sun_change_before_box_autumn", replace
!dx upload sens_sun_change_before_box_autumn.gph

*Unpaired t test to compare Sunday of change to Sunday before 
ttest sleep_dur_sun_change == sleep_dur_sun_before, unpaired

*Two-sample t test with equal variances
*------------------------------------------------------------------------------
*Variable |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
*---------+--------------------------------------------------------------------
*sleep~ge |   2,588    602.9138    2.100774    106.8714    598.7944    607.0331
*sleep_.. |   2,191    569.9732    2.263151    105.9339     565.535    574.4113
*---------+--------------------------------------------------------------------
*combined |   4,779    587.8117    1.557781    107.6899    584.7577    590.8656
*---------+--------------------------------------------------------------------
*    diff |            32.94059    3.090158                26.88246    38.99873
*------------------------------------------------------------------------------
*    diff = mean(sleep_dur_sun~ge) - mean(sleep_dur_sun~re)        t =  10.6598
*Ho: diff = 0                                     degrees of freedom =     4777
*
*    Ha: diff < 0                 Ha: diff != 0                 Ha: diff > 0
* Pr(T < t) = 1.0000         Pr(|T| > |t|) = 0.0000          Pr(T > t) = 0.0000

*Get actual p value
return list // 3.08690747002e-26

*Power of estimate
*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE diff and 1.96*SE diff 
*Difference in SE = 3.090158 

*-1.96*3.090158    = -6.0567097
*1.96*3.090158   = 6.0567097
*The difference in effect size we have here = 32.94059 
*We are powered to detect a difference of +/-6.0567097. This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.



********************************************************

*7. *Compare sleep duration on Sunday of clock change to Sunday after
***********************************************************************************

*Open dataset
use /mnt/project/sensitivity.dta, clear
set more off



*Loop to do overall graphs & t test of sunday after vs sunday of clock change for Autumn & Spring
levelsof season, local(levels)
foreach lev of local levels{
preserve
keep if season == "`lev'"	
*Histogram of sleep duration on Sunday after the clock change
hist sleep_dur_sun_after, freq normal
graph save "sens_sun_after_hist_`lev'", replace
!dx upload sens_sun_after_hist_`lev'.gph	
*Boxplot sleep duration on sunday of change vs sunday after
graph box sleep_dur_sun_after sleep_dur_sun_change
graph save "sens_sun_change_after_box_`lev'", replace
!dx upload sens_sun_change_after_box_`lev'.gph
*Unpaired t test to compare Sunday of change to Sunday after (Overall)
ttest sleep_dur_sun_change == sleep_dur_sun_after, unpaired
*Get actual p value
return list	
restore
}




*AUTUMN OVERALL ttest results

*Two-sample t test with equal variances
*------------------------------------------------------------------------------
*Variable |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
*---------+--------------------------------------------------------------------
*sleep~ge |   2,588    602.9138    2.100774    106.8714    598.7944    607.0331
*sleep_.. |   2,159    566.1688    2.262856    105.1437    561.7312    570.6064
*---------+--------------------------------------------------------------------
*combined |   4,747    586.2016    1.562368    107.6448    583.1387    589.2646
*---------+--------------------------------------------------------------------
*    diff |            36.74497    3.092232                30.68276    42.80718
*------------------------------------------------------------------------------
*    diff = mean(sleep_dur_sun~ge) - mean(sleep_dur_sun_~r)        t =  11.8830
*Ho: diff = 0                                     degrees of freedom =     4745
*
*    Ha: diff < 0                 Ha: diff != 0                 Ha: diff > 0
* Pr(T < t) = 1.0000         Pr(|T| > |t|) = 0.0000          Pr(T > t) = 0.0000

*Power of estimate
*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE diff and 1.96*SE diff 
*Difference in SE = 3.092232 

*-1.96*3.092232    = -6.0607747
*1.96*3.092232  = 6.0607747
*The difference in effect size we have here = 36.74497
*We are powered to detect a difference of +/-6.0607747. This is much smaller than the difference we detected, so we are well powered to detect differences of the size we found.


*P value: 4.12415621787e-32
************************************

*SPRING OVERALL ttest results

*Two-sample t test with equal variances
*------------------------------------------------------------------------------
*Variable |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
*---------+--------------------------------------------------------------------
*sleep~ge |   1,439    499.1141    2.831594    107.4141    493.5596    504.6686
*sleep_.. |   1,217    560.0145    2.834846    98.89508    554.4527    565.5762
*---------+--------------------------------------------------------------------
*combined |   2,656    527.0191    2.094309    107.9331    522.9125    531.1258
*---------+--------------------------------------------------------------------
*    diff |           -60.90036    4.034496               -68.81143   -52.98928
*------------------------------------------------------------------------------
*    diff = mean(sleep_dur_sun~ge) - mean(sleep_dur_sun_~r)        t = -15.0949
*Ho: diff = 0                                     degrees of freedom =     2654
*
*    Ha: diff < 0                 Ha: diff != 0                 Ha: diff > 0
* Pr(T < t) = 0.0000         Pr(|T| > |t|) = 0.0000          Pr(T > t) = 1.0000


*Power of estimate
*We can calculate the power of our estimates by the following formula, we will have 80% power at 95% level of significance to detect effects outside of the following range:

*-1.96*SE diff and 1.96*SE diff 
*Difference in SE =4.034496  

*-1.96*4.034496 = -7.9076122
*1.96*4.034496  = 7.9076122
*The difference in effect size we have here = -60.90036
*We are powered to detect a difference of +/-7.9076122 . This is smaller than the difference we detected, so we are well powered to detect differences of the size we found.

*p value: 1.86382251770e-49



***************************************************************************************

*8. Comparison of weekdays before & after the clock changes
***********************************************************

*Open dataset
set more off
use /mnt/project/sensitivity.dta, clear

*Keep only the variables we need (eid, sleep duration by day, season)
keep eid sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after season 
describe // 

*Save dataset
save sens_reg.dta, replace
!dx upload sens_reg.dta

****************************

*Reshape from wide to long format

*Rename vars ready for reshaping
rename sleep_dur_mon_before sleepdur1
rename sleep_dur_tue_before sleepdur2
rename sleep_dur_wed_before sleepdur3
rename sleep_dur_thur_before sleepdur4
rename sleep_dur_fri_before sleepdur5
rename sleep_dur_sat_before sleepdur6
rename sleep_dur_mon_after sleepdur7
rename sleep_dur_tue_after sleepdur8
rename sleep_dur_wed_after sleepdur9
rename sleep_dur_thur_after sleepdur10
rename sleep_dur_fri_after sleepdur11
rename sleep_dur_sat_after sleepdur12

*Reshape from wide to long format
reshape long sleepdur, i(eid) j(day)
list in 1/12
describe // 
ssc install unique
unique eid // unqieu eid: 11315. Obs: 135780

*Reorder variables
order eid day sleepdur season
list in 1/1

*Save dataset
save sens_reg_long.dta, replace
!dx upload sens_reg_long.dta

*******************

*Regression - Spring
******************************************************************
*Open dataset
set more off
use /mnt/project/sens_reg_long.dta, clear
keep if season =="Spring" // 83,256 obs deleted.

*Install estout package so can export regression results
ssc install estout

*Comparing the Monday before (day 1) to all other days
****************************************************

*Give value labels to the categorical day variable
label define day_lb 1"Mon before" 2"Tue before" 3"Wed before" 4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day day_lb
tab day

sort eid day

*Run the regression
eststo model1: reg sleepdur i.day, cluster(eid) // this compares day 1 (Monday before) to all the other days.



*Compare Tues before (day 2) to all other days
***********************************************************

*Generate new 'day' variable with the Tuesday before (day 2) as the constant
recode day (2=1)(1=2), generate(day_tuebefore) // Now the Tuesday before is the constant (day 1) and the Monday before is day 2.

*Give new day variable value labels.
label define day_tuebefore_lb 1"Tue before" 2"Mon before" 3"Wed before"  4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_tuebefore day_tuebefore_lb
tab day_tuebefore

sort eid day_tuebefore


eststo model2: reg sleepdur i.day_tuebefore, cluster(eid) 


*Compare day 3 (Wed before) to all other days
************************************************

*Generate new 'day' variable with the Wed before (day 3) as the constant.
recode day (3=1) (1=2) (2=3), generate(day_wedbefore) // Now the Wednesday before is the constant (day 1) and the Monday before is day 2 and the Tuesday before is day 3.

*Give new day variable value labels.
label define day_wedbefore_lb 1"Wed before" 2"Mon before" 3"Tues before" 4"Thurs before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_wedbefore day_wedbefore_lb
tab day_wedbefore

sort eid day_wedbefore

eststo model3: reg sleepdur i.day_wedbefore, cluster(eid) 


*Compare day 4 (Thur before) to all other days
************************************************

*Generate new 'day' variable with the Thur before (day 4) as the constant.
recode day (4=1) (1=2) (2=3) (3=4), generate(day_thurbefore) // Now the Thursday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3 & the Wednesday is day 4.

*Give new day variable value labels.
label define day_thurbefore_lb 1"Thur before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_thurbefore day_thurbefore_lb
tab day_thurbefore

sort eid day_thurbefore

eststo model4: reg sleepdur i.day_thurbefore, cluster(eid) 

*Compare day 5 (Fri before) to all other days
************************************************

*Generate new 'day' variable with the Fri before (day 5) as the constant.
recode day (5=1) (1=2) (2=3) (3=4) (4=5), generate(day_fribefore) // Now the Friday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4 & the Thursday is day 5.

*Give new day variable value labels.
label define day_fribefore_lb 1 "Fri before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_fribefore day_fribefore_lb
tab day_fribefore

sort eid day_fribefore

eststo model5: reg sleepdur i.day_fribefore, cluster(eid) 


*Compare day 6 (Sat before) to all other days
************************************************

*Generate new 'day' variable with the Sat before (day 6) as the constant.
recode day (6=1) (1=2) (2=3) (3=4) (4=5) (5=6), generate(day_satbefore) // Now the Saturday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4, the Thursday is day 5 & the friday is day 6.

*Give new day variable value labels.
label define day_satbefore_lb 1 "Sat before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Fri before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_satbefore day_satbefore_lb
tab day_satbefore

sort eid day_satbefore

eststo model6: reg sleepdur i.day_satbefore, cluster(eid) 



*Export combined regression results
***************************************
*Combine the output from the 3 regression models & save as text file.
estout model1 model2 model3 model4 model5 model6 using sens_springregress.txt, replace cells("b(label(Coef) fmt(%9.2f)) ci(label(95% CI) fmt(%9.2f)) p(label(p value) fmt(%9.4f))") label stats(N, labels("n") fmt(%9.0g))
!dx upload sens_springregress.txt


**Manually download springreg.txt from DNA Nexus project.
*In stata on desktop:

*Import results of regressions into Stata & turn into excel spreadsheet.

	*set working directory*
cd "....sensitivity_analysis"

import delimited using sens_springregress.txt, clear
browse
export excel using sens_springregress.xlsx, replace


**********************************************************************************************************************************

*Regression - Autumn
******************************************************************
*Open dataset
set more off
use /mnt/project/sens_reg_long.dta, clear
keep if season =="Autumn" // 52524 obs deleted.

*Install estout package so can export regression results
ssc install estout

*Comparing the Monday before (day 1) to all other days
****************************************************

*Give value labels to the categorical day variable
label define day_lb 1"Mon before" 2"Tue before" 3"Wed before" 4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day day_lb
tab day

sort eid day

*Run the regression
eststo model1: reg sleepdur i.day, cluster(eid) // this compares day 1 (Monday before) to all the other days.



*Compare Tues before (day 2) to all other days
***********************************************************

*Generate new 'day' variable with the Tuesday before (day 2) as the constant
recode day (2=1)(1=2), generate(day_tuebefore) // Now the Tuesday before is the constant (day 1) and the Monday before is day 2.

*Give new day variable value labels.
label define day_tuebefore_lb 1"Tue before" 2"Mon before" 3"Wed before"  4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_tuebefore day_tuebefore_lb
tab day_tuebefore

sort eid day_tuebefore


eststo model2: reg sleepdur i.day_tuebefore, cluster(eid) 


*Compare day 3 (Wed before) to all other days
************************************************

*Generate new 'day' variable with the Wed before (day 3) as the constant.
recode day (3=1) (1=2) (2=3), generate(day_wedbefore) // Now the Wednesday before is the constant (day 1) and the Monday before is day 2 and the Tuesday before is day 3.

*Give new day variable value labels.
label define day_wedbefore_lb 1"Wed before" 2"Mon before" 3"Tues before" 4"Thurs before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_wedbefore day_wedbefore_lb
tab day_wedbefore

sort eid day_wedbefore

eststo model3: reg sleepdur i.day_wedbefore, cluster(eid) 


*Compare day 4 (Thur before) to all other days
************************************************

*Generate new 'day' variable with the Thur before (day 4) as the constant.
recode day (4=1) (1=2) (2=3) (3=4), generate(day_thurbefore) // Now the Thursday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3 & the Wednesday is day 4.

*Give new day variable value labels.
label define day_thurbefore_lb 1"Thur before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_thurbefore day_thurbefore_lb
tab day_thurbefore

sort eid day_thurbefore

eststo model4: reg sleepdur i.day_thurbefore, cluster(eid) 

*Compare day 5 (Fri before) to all other days
************************************************

*Generate new 'day' variable with the Fri before (day 5) as the constant.
recode day (5=1) (1=2) (2=3) (3=4) (4=5), generate(day_fribefore) // Now the Friday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4 & the Thursday is day 5.

*Give new day variable value labels.
label define day_fribefore_lb 1 "Fri before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_fribefore day_fribefore_lb
tab day_fribefore

sort eid day_fribefore

eststo model5: reg sleepdur i.day_fribefore, cluster(eid) 


*Compare day 6 (Sat before) to all other days
************************************************

*Generate new 'day' variable with the Sat before (day 6) as the constant.
recode day (6=1) (1=2) (2=3) (3=4) (4=5) (5=6), generate(day_satbefore) // Now the Saturday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4, the Thursday is day 5 & the friday is day 6.

*Give new day variable value labels.
label define day_satbefore_lb 1 "Sat before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Fri before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_satbefore day_satbefore_lb
tab day_satbefore

sort eid day_satbefore

eststo model6: reg sleepdur i.day_satbefore, cluster(eid) 



*Export combined regression results
***************************************
*Combine the output from the 3 regression models & save as text file.
estout model1 model2 model3 model4 model5 model6 using sens_autumnregress.txt, replace cells("b(label(Coef) fmt(%9.2f)) ci(label(95% CI) fmt(%9.2f)) p(label(p value) fmt(%9.4f))") label stats(N, labels("n") fmt(%9.0g))
!dx upload sens_autumnregress.txt

**Manually download autumngregress.txt from DNA Nexus project.
*In stata on desktop:

*Import results of regressions into Stata & turn into excel spreadsheet.

	*set working directory*
cd "....sensitivity_analysis"

import delimited using sens_autumnregress.txt, clear
browse
export excel using sens_autumnregress.xlsx, replace



********************************************************************************************

*9. Create sample characteristics table
**********************************

*Install table1_mc
ssc install table1_mc

*help table1_mc

*Open dataset
set more off
use /mnt/project/sensitivity.dta, clear

*Code to create table

table1_mc, by(season) ///
vars( ///
sex bin %4.1f \ ///
age_accel_tert cat %4.1f \ ///
employ_3cats cat %4.1f \ ///
sleep_dur_cats cat %4.1f \ ///
chrono_3cats cat %4.1f %4.1f \ ///
) ///
nospace onecol total(before) ///
saving("sens_table1.xlsx", replace)


*Upload to project
!dx upload sens_table1.xlsx
