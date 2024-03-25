*Regression analyses comparing individual weekdays after vs before clock changes
********************************************************************************

*Analysis - regression of sleep on weekdays before & after
**********************************************************


*1. Select the variables we want
*************************************

*Open dataset
set more off
use /mnt/project/accel10.dta, clear

*Keep only the variables we need (eid, sleep duration by day, season, plus stratifying variables (age, sex, chronotype, self-reported sleep duration, employment status)) 
keep eid sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after season sex age_accel_tert chrono_3cats sleep_dur_cats employ_3cats
describe // obs 11780. vars 19.

*Save dataset
save reg.dta, replace
!dx upload reg.dta


*2. Reshape from wide to long format
***************************************

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
describe // 141,360 obs. 9 vars.
ssc install unique
unique eid // unique eids: 11780

*Reorder variables
order eid day sleepdur season
list in 1/1

*Save dataset
save reg_long.dta, replace
!dx upload reg_long.dta


******************************************************************
*3. Regression - Spring
******************************************************************
*Open dataset
set more off
use /mnt/project/reg_long.dta, clear
keep if season =="Spring" // 86,532 obs deleted.

*Install estout package so can export regression results
ssc install estout

*3a) Comparing the Monday before (day 1) to all other days
****************************************************

*Give value labels to the categorical day variable
label define day_lb 1"Mon before" 2"Tue before" 3"Wed before" 4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day day_lb
tab day

sort eid day

*Run the regression
eststo model1: reg sleepdur i.day, cluster(eid) // this compares day 1 (Monday before) to all the other days.



*3b) Compare Tues before (day 2) to all other days
***********************************************************

*Generate new 'day' variable with the Tuesday before (day 2) as the constant
recode day (2=1)(1=2), generate(day_tuebefore) // Now the Tuesday before is the constant (day 1) and the Monday before is day 2.

*Give new day variable value labels.
label define day_tuebefore_lb 1"Tue before" 2"Mon before" 3"Wed before"  4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_tuebefore day_tuebefore_lb
tab day_tuebefore

sort eid day_tuebefore


eststo model2: reg sleepdur i.day_tuebefore, cluster(eid) 


*3c) Compare day 3 (Wed before) to all other days
************************************************

*Generate new 'day' variable with the Wed before (day 3) as the constant.
recode day (3=1) (1=2) (2=3), generate(day_wedbefore) // Now the Wednesday before is the constant (day 1) and the Monday before is day 2 and the Tuesday before is day 3.

*Give new day variable value labels.
label define day_wedbefore_lb 1"Wed before" 2"Mon before" 3"Tues before" 4"Thurs before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_wedbefore day_wedbefore_lb
tab day_wedbefore

sort eid day_wedbefore

eststo model3: reg sleepdur i.day_wedbefore, cluster(eid) 


*3d) Compare day 4 (Thur before) to all other days
************************************************

*Generate new 'day' variable with the Thur before (day 4) as the constant.
recode day (4=1) (1=2) (2=3) (3=4), generate(day_thurbefore) // Now the Thursday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3 & the Wednesday is day 4.

*Give new day variable value labels.
label define day_thurbefore_lb 1"Thur before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_thurbefore day_thurbefore_lb
tab day_thurbefore

sort eid day_thurbefore

eststo model4: reg sleepdur i.day_thurbefore, cluster(eid) 

*3e) Compare day 5 (Fri before) to all other days
************************************************

*Generate new 'day' variable with the Fri before (day 5) as the constant.
recode day (5=1) (1=2) (2=3) (3=4) (4=5), generate(day_fribefore) // Now the Friday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4 & the Thursday is day 5.

*Give new day variable value labels.
label define day_fribefore_lb 1 "Fri before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_fribefore day_fribefore_lb
tab day_fribefore

sort eid day_fribefore

eststo model5: reg sleepdur i.day_fribefore, cluster(eid) 


*3f) Compare day 6 (Sat before) to all other days
************************************************

*Generate new 'day' variable with the Sat before (day 6) as the constant.
recode day (6=1) (1=2) (2=3) (3=4) (4=5) (5=6), generate(day_satbefore) // Now the Saturday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4, the Thursday is day 5 & the friday is day 6.

*Give new day variable value labels.
label define day_satbefore_lb 1 "Sat before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Fri before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_satbefore day_satbefore_lb
tab day_satbefore

sort eid day_satbefore

eststo model6: reg sleepdur i.day_satbefore, cluster(eid) 





*3g) Export combined regression results
***************************************
*Combine the output from the 3 regression models & save as text file.
estout model1 model2 model3 model4 model5 model6 using springregress.txt, replace cells("b(label(Coef) fmt(%9.2f)) ci(label(95% CI) fmt(%9.2f)) p(label(p value) fmt(%9.4f))") label stats(N, labels("n") fmt(%9.0g))
!dx upload springregress.txt

**Manually download springreg.txt from DNA Nexus project.
*In stata on desktop:

*Import results of regressions into Stata & turn into excel spreadsheet.

	*set working directory*
	

import delimited using springregress.txt, clear
browse
export excel using springregress.xlsx, replace



****************************************************************************************************************************************

******************************************************************
*4. Regression - Autumn
******************************************************************
*Open dataset
set more off
use /mnt/project/reg_long.dta, clear
keep if season =="Autumn" // 54828 obs deleted.

*Install estout package so can export regression results
ssc install estout

*4a) Comparing the Monday before (day 1) to all other days
****************************************************

*Give value labels to the categorical day variable
label define day_lb 1"Mon before" 2"Tue before" 3"Wed before" 4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day day_lb
tab day

sort eid day

*Run the regression
eststo model1: reg sleepdur i.day, cluster(eid) // this compares day 1 (Monday before) to all the other days.



*4b) Compare Tues before (day 2) to all other days
***********************************************************

*Generate new 'day' variable with the Tuesday before (day 2) as the constant
recode day (2=1)(1=2), generate(day_tuebefore) // Now the Tuesday before is the constant (day 1) and the Monday before is day 2.

*Give new day variable value labels.
label define day_tuebefore_lb 1"Tue before" 2"Mon before" 3"Wed before"  4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_tuebefore day_tuebefore_lb
tab day_tuebefore

sort eid day_tuebefore


eststo model2: reg sleepdur i.day_tuebefore, cluster(eid) 


*4c) Compare day 3 (Wed before) to all other days
************************************************

*Generate new 'day' variable with the Wed before (day 3) as the constant.
recode day (3=1) (1=2) (2=3), generate(day_wedbefore) // Now the Wednesday before is the constant (day 1) and the Monday before is day 2 and the Tuesday before is day 3.

*Give new day variable value labels.
label define day_wedbefore_lb 1"Wed before" 2"Mon before" 3"Tues before" 4"Thurs before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_wedbefore day_wedbefore_lb
tab day_wedbefore

sort eid day_wedbefore

eststo model3: reg sleepdur i.day_wedbefore, cluster(eid) 


*4d) Compare day 4 (Thur before) to all other days
************************************************

*Generate new 'day' variable with the Thur before (day 4) as the constant.
recode day (4=1) (1=2) (2=3) (3=4), generate(day_thurbefore) // Now the Thursday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3 & the Wednesday is day 4.

*Give new day variable value labels.
label define day_thurbefore_lb 1"Thur before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_thurbefore day_thurbefore_lb
tab day_thurbefore

sort eid day_thurbefore

eststo model4: reg sleepdur i.day_thurbefore, cluster(eid) 

*4e) Compare day 5 (Fri before) to all other days
************************************************

*Generate new 'day' variable with the Fri before (day 5) as the constant.
recode day (5=1) (1=2) (2=3) (3=4) (4=5), generate(day_fribefore) // Now the Friday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4 & the Thursday is day 5.

*Give new day variable value labels.
label define day_fribefore_lb 1 "Fri before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_fribefore day_fribefore_lb
tab day_fribefore

sort eid day_fribefore

eststo model5: reg sleepdur i.day_fribefore, cluster(eid) 


*4f) Compare day 6 (Sat before) to all other days
************************************************

*Generate new 'day' variable with the Sat before (day 6) as the constant.
recode day (6=1) (1=2) (2=3) (3=4) (4=5) (5=6), generate(day_satbefore) // Now the Saturday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4, the Thursday is day 5 & the friday is day 6.

*Give new day variable value labels.
label define day_satbefore_lb 1 "Sat before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Fri before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_satbefore day_satbefore_lb
tab day_satbefore

sort eid day_satbefore

eststo model6: reg sleepdur i.day_satbefore, cluster(eid) 



*4g) Export combined regression results
***************************************
*Combine the output from the 3 regression models & save as text file.
estout model1 model2 model3 model4 model5 model6 using autumnregress.txt, replace cells("b(label(Coef) fmt(%9.2f)) ci(label(95% CI) fmt(%9.2f)) p(label(p value) fmt(%9.4f))") label stats(N, labels("n") fmt(%9.0g))
!dx upload autumnregress.txt

**Manually download autumngregress.txt from DNA Nexus project.
*In stata on desktop:

*Import results of regressions into Stata & turn into excel spreadsheet.

	*set working directory*


import delimited using autumnregress.txt, clear
browse
export excel using autumnregress.xlsx, replace


