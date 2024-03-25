*1.Spring - Weekday regressions stratified by sex, age, sleep duration, chronotype and employment category.

******************************************************************
*Open dataset
set more off
use /mnt/project/reg_long.dta, clear
keep if season =="Spring" // 86,532 obs deleted.

*Install estout package so can export regression results
ssc install estout

*1a) Comparing the Monday before (day 1) to all other days
****************************************************

*Give value labels to the categorical day variable
label define day_lb 1"Mon before" 2"Tue before" 3"Wed before" 4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day day_lb
tab day


*1b) Compare Tues before (day 2) to all other days
***********************************************************

*Generate new 'day' variable with the Tuesday before (day 2) as the constant
recode day (2=1)(1=2), generate(day_tuebefore) // Now the Tuesday before is the constant (day 1) and the Monday before is day 2.

*Give new day variable value labels.
label define day_tuebefore_lb 1"Tue before" 2"Mon before" 3"Wed before"  4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_tuebefore day_tuebefore_lb
tab day_tuebefore

*1c) Compare day 3 (Wed before) to all other days
************************************************

*Generate new 'day' variable with the Wed before (day 3) as the constant.
recode day (3=1) (1=2) (2=3), generate(day_wedbefore) // Now the Wednesday before is the constant (day 1) and the Monday before is day 2 and the Tuesday before is day 3.

*Give new day variable value labels.
label define day_wedbefore_lb 1"Wed before" 2"Mon before" 3"Tues before" 4"Thurs before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_wedbefore day_wedbefore_lb
tab day_wedbefore

*1d) Compare day 4 (Thur before) to all other days
************************************************

*Generate new 'day' variable with the Thur before (day 4) as the constant.
recode day (4=1) (1=2) (2=3) (3=4), generate(day_thurbefore) // Now the Thursday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3 & the Wednesday is day 4.

*Give new day variable value labels.
label define day_thurbefore_lb 1"Thur before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_thurbefore day_thurbefore_lb
tab day_thurbefore

*1e) Compare day 5 (Fri before) to all other days
************************************************

*Generate new 'day' variable with the Fri before (day 5) as the constant.
recode day (5=1) (1=2) (2=3) (3=4) (4=5), generate(day_fribefore) // Now the Friday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4 & the Thursday is day 5.

*Give new day variable value labels.
label define day_fribefore_lb 1 "Fri before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_fribefore day_fribefore_lb
tab day_fribefore

*1f) Compare day 6 (Sat before) to all other days
************************************************

*Generate new 'day' variable with the Sat before (day 6) as the constant.
recode day (6=1) (1=2) (2=3) (3=4) (4=5) (5=6), generate(day_satbefore) // Now the Saturday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4, the Thursday is day 5 & the friday is day 6.

*Give new day variable value labels.
label define day_satbefore_lb 1 "Sat before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Fri before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_satbefore day_satbefore_lb
tab day_satbefore


*1g) Run the regressions stratified
foreach varname of varlist sex age_accel_tert chrono_3cats sleep_dur_cats employ_3cats {
	
bysort `varname': eststo: reg sleepdur i.day, cluster(eid) // this compares day 1 (Monday before) to all the other days.	
bysort `varname': eststo: reg sleepdur i.day_tuebefore, cluster(eid) // this compares day 2 (Tuesday before) to all the other days.
bysort `varname': eststo: reg sleepdur i.day_wedbefore, cluster(eid) // this compares day 3 (Wed before) to all the other days.
bysort `varname': eststo: reg sleepdur i.day_thurbefore, cluster(eid) // this compares day 4 (Thurs before) to all other days.
bysort `varname': eststo: reg sleepdur i.day_fribefore, cluster(eid) // this compares day 5 (Friday before) to all other days.
bysort `varname': eststo: reg sleepdur i.day_satbefore, cluster(eid) // this compares day 6 (Sat before) to all other days.

estout est* using springregress_`varname'.txt, replace cells("b(label(Coef) fmt(%9.2f)) ci(label(95% CI) fmt(%9.2f)) p(label(p value) fmt(%9.4f))") label stats(N, labels("n") fmt(%9.0g))
!dx upload springregress_`varname'.txt
eststo clear

}

***********************************************
**Manually download spring text files from DNA Nexus
***********************************************


*2. Autumn - Weekday regressions stratified by sex, age, sleep duration, chronotype and employment category.

******************************************************************
*Open dataset
set more off
use /mnt/project/reg_long.dta, clear
keep if season =="Autumn" // 54828 obs deleted.

*Install estout package so can export regression results
ssc install estout

*2a) Comparing the Monday before (day 1) to all other days
****************************************************

*Give value labels to the categorical day variable
label define day_lb 1"Mon before" 2"Tue before" 3"Wed before" 4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day day_lb
tab day


*2b) Compare Tues before (day 2) to all other days
***********************************************************

*Generate new 'day' variable with the Tuesday before (day 2) as the constant
recode day (2=1)(1=2), generate(day_tuebefore) // Now the Tuesday before is the constant (day 1) and the Monday before is day 2.

*Give new day variable value labels.
label define day_tuebefore_lb 1"Tue before" 2"Mon before" 3"Wed before"  4"Thur before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_tuebefore day_tuebefore_lb
tab day_tuebefore

*2c) Compare day 3 (Wed before) to all other days
************************************************

*Generate new 'day' variable with the Wed before (day 3) as the constant.
recode day (3=1) (1=2) (2=3), generate(day_wedbefore) // Now the Wednesday before is the constant (day 1) and the Monday before is day 2 and the Tuesday before is day 3.

*Give new day variable value labels.
label define day_wedbefore_lb 1"Wed before" 2"Mon before" 3"Tues before" 4"Thurs before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_wedbefore day_wedbefore_lb
tab day_wedbefore

*2d) Compare day 4 (Thur before) to all other days
************************************************

*Generate new 'day' variable with the Thur before (day 4) as the constant.
recode day (4=1) (1=2) (2=3) (3=4), generate(day_thurbefore) // Now the Thursday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3 & the Wednesday is day 4.

*Give new day variable value labels.
label define day_thurbefore_lb 1"Thur before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Fri before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_thurbefore day_thurbefore_lb
tab day_thurbefore

*2e) Compare day 5 (Fri before) to all other days
************************************************

*Generate new 'day' variable with the Fri before (day 5) as the constant.
recode day (5=1) (1=2) (2=3) (3=4) (4=5), generate(day_fribefore) // Now the Friday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4 & the Thursday is day 5.

*Give new day variable value labels.
label define day_fribefore_lb 1 "Fri before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Sat before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_fribefore day_fribefore_lb
tab day_fribefore

*2f) Compare day 6 (Sat before) to all other days
************************************************

*Generate new 'day' variable with the Sat before (day 6) as the constant.
recode day (6=1) (1=2) (2=3) (3=4) (4=5) (5=6), generate(day_satbefore) // Now the Saturday before is the constant (day 1) and the Monday before is day 2, the Tuesday before is day 3, the Wednesday is day 4, the Thursday is day 5 & the friday is day 6.

*Give new day variable value labels.
label define day_satbefore_lb 1 "Sat before" 2"Mon before" 3"Tues before" 4"Wed before" 5"Thur before" 6"Fri before" 7"Mon after" 8"Tue after" 9"Wed after" 10"Thur after" 11"Fri after" 12"Sat after"
label values day_satbefore day_satbefore_lb
tab day_satbefore


*2g) Run the regressions stratified
foreach varname of varlist sex age_accel_tert chrono_3cats sleep_dur_cats employ_3cats {
	
bysort `varname': eststo: reg sleepdur i.day, cluster(eid) // this compares day 1 (Monday before) to all the other days.	
bysort `varname': eststo: reg sleepdur i.day_tuebefore, cluster(eid) // this compares day 2 (Tuesday before) to all the other days.
bysort `varname': eststo: reg sleepdur i.day_wedbefore, cluster(eid) // this compares day 3 (Wed before) to all the other days.
bysort `varname': eststo: reg sleepdur i.day_thurbefore, cluster(eid) // this compares day 4 (Thurs before) to all other days.
bysort `varname': eststo: reg sleepdur i.day_fribefore, cluster(eid) // this compares day 5 (Friday before) to all other days.
bysort `varname': eststo: reg sleepdur i.day_satbefore, cluster(eid) // this compares day 6 (Sat before) to all other days.

estout est* using autumnregress_`varname'.txt, replace cells("b(label(Coef) fmt(%9.2f)) ci(label(95% CI) fmt(%9.2f)) p(label(p value) fmt(%9.4f))") label stats(N, labels("n") fmt(%9.0g))
!dx upload autumnregress_`varname'.txt
eststo clear

}


*3.  Convert Spring & Autumn stratification text files into excel spreadsheets
*****************************************************************************

*In stata on desktop: 
*Run all of this text in one go otherwise it doesn't work due to local macro!


*Save all stratification text files as excel files (Spring & Autumn)

	*set working directory*


*Create a local macro for my files in the directory
local myfilelist : dir "." files "*.txt"
*Loop to save txt files as excel files
foreach file of local myfilelist{
	import delimited using `file', clear
	local outfile = subinstr("`file'",".txt","",.)
	export excel using `outfile'.xlsx, replace
		
}
