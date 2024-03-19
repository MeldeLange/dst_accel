*Cleaning sociodemographic variables
************************************

*Import extra variables from DNA Nexus dashboard (sleep duration & employment status)

*Import csv file
import delimited /mnt/project/sleepdur_emp.csv, clear
describe
list in 1/5

*Rename variables
rename v2 sleep_dur
label variable sleep_dur "sleep duration in hours (inc naps) category (1160)"
rename v3 employ 
label variable employ "current employment status category (6142)"
describe

*Save as .dta file & upload to DNA Nexus
save sleepdur_emp.dta, replace
!dx upload sleepdur_emp.dta


***Need to go out of JupyterLab and then back in again to use .dta file saved in DNA Nexus project

*Merge extra variables with main dataset.

*Open main dataset (use as master)
set more off
use /mnt/project/accel5.dta, clear
describe // 8714 obs. 130 vars.

merge 1:1 eid using /mnt/project/sleepdur_emp.dta
rename _merge _merge_sleepdur_emp


* Result                           # of obs.
*    -----------------------------------------
*    not matched                       493,650
*        from master                         0  (_merge==1)
*        from using                    493,650  (_merge==2)
*
*    matched                             8,714  (_merge==3)
*    -----------------------------------------

*Just keep those in main dataset (master)
count if _merge_sleepdur_emp ==3 // 8714
keep if _merge_sleepdur_emp ==3 // 493,650 obs deleted.
drop _merge_sleepdur_emp
describe // 8714 obs. 132 vars.


*Save & upload
save accel6.dta, replace
!dx upload accel6.dta

*****************************************************************************************

*Clean variables needed for table 1 & for stratification.


*Open doherty dataset
set more off
use /mnt/project/accel6.dta, clear
describe

*1. Sex
tab sex, missing
label define sex_lb 1"Male" 0"Female"
label values sex sex_lb
tab sex, missing

***********************************************************

*2. Age when wearing accelerometer
*Create new variable with 3 age categories.
sum age_accel // 
sum age_accel, detail

xtile age_accel_tert = age_accel, nq(3)
tab age_accel_tert
table age_accel_tert, contents(min age_accel max age_accel)

*Tertiles 1: 43-58. 2: 59-67. 3: 68-78.

********************************************************************

*3. Ethnicity
*Recode into 6 top level categories
tab ethnicity, missing
recode ethnicity (-3 -1 =.)
tab ethnicity, missing
recode ethnicity (1=1) (2=2) (3=3) (4=4) (5=5) (6=6) (1001=1) (1002=1) (1003=1) (2001=2) (2002=2) (2003=2) (2004=2)(3001=3) (3002=3) (3003=3) (3004=3) (4001=4) (4002=4) (4003=4)
tab ethnicity
label define ethnicity_lb 1 "White" 2 "Mixed" 3 "Asian/Asian British" 4 "Black/Black British" 5 "Chinese" 6 "Other"
label values ethnic ethnicity_lb
tab ethnicity

*******************************************************************************

*4. Chronotype
*Recode chronotype so -1 = no preference
tab chronotype, missing
recode chronotype (-3 =.)
tab chronotype
recode chronotype (1=1) (2=2) (-1=3) (3=4) (4=5)
tab chronotype
label define chronotype_lb 1 "Definite morning" 2 "Morning more than evening" 3 "No preference" 4 "Evening more than morning" 5 "Definite evening"  
label values chronotype chronotype_lb
tab chronotype, missing


*Recode to create a 3 category variable for chronotype
tab chronotype, missing
recode chronotype (1=1) (2=1) (3=2) (4=3) (5=3), gen (chrono_3cats) 
label define chrono_3cats_lb 1 "Morning" 2 "No preference" 3 "Evening"
label values chrono_3cats chrono_3cats_lb
tab chrono_3cats, missing

************************************************************************

*5. Sleep duration
tab sleep_dur, missing
recode sleep_dur (-3 -1 =.)
tab sleep_dur, missing
summarize sleep_dur // min: 1. Max: 15. Mean: 7.170787 (3115 obs)
	*Remove extreme values of sleep duration (>18 hours & <3) as per this paper https://link.springer.com/article/10.1007/s10654-023-00981-x which says "Extreme responses of less than 3 h or more than 18 h were excluded to avoid improbable short or long sleep durations confounded by poor health."
replace sleep_dur =. if sleep_dur >18 // 0
replace sleep_dur =. if sleep_dur <3 // 2 changed to missing.
sum sleep_dur //  Mean: 7.176193. Min: 3. Max: 18.


*Sleep duration recode into 3 categories
*Sleep foundation: 
*adults aged 26-64: 7-9 hours = recommended. (Less than 6 hours / > 10 hours not recommended.)
*adults aged >=65 7-8 hours = recommended. (Less than 5 hours / >9 hours not recommended.)
*Therefore in both age categories >=7 hours is recommended.
*Becky's paper uses 3 categories: 6 or less, 7-8 and 9 or more.
tab sleep_dur, missing
recode sleep_dur (3 4 5 6 =1) (7 8 = 2) (9 10 11 12 13 14 15 16 17 18 = 3), generate (sleep_dur_cats) 
tab sleep_dur_cats, missing
tab sleep_dur_cats
label define sleep_dur_cats_lb 1"<=6 hours" 2"7-8 hours" 3"9 or more hours"
label values sleep_dur_cats sleep_dur_cats_lb
tab sleep_dur_cats, missing
tab sleep_dur_cats // <=6 hours: 1819, 7-8 hours: 6307. =>8 hours: 552.


********************************************************************************************
*6. Employment status
*We are simplifying the categories for this to reduce it to 3 categories. Anyone that has a 1 at all (employed/self-employed) counts as employed (1), anyone who has a 2 at all counts as retired (2). If they don't have a 1 or a 2 (including -7 "none of the above") they are put in the 'other' category (3). Prefer not to answer (-3) is coded as missing.

tab employ, missing
	*Generate new variable for employ_3cats
generate employ_3cats =0
replace employ_3cats =3 if employ == "-7"
replace employ_3cats =. if employ == "-3"
replace employ_3cats =. if employ == "" 
tab employ_3cats, missing

replace employ_3cats =1 if employ== "1"
replace employ_3cats =1 if employ == "1|2"
replace employ_3cats =1 if employ == "1|2|3"
replace employ_3cats =1 if employ == "1|2|3|4"
replace employ_3cats =1 if employ == "1|2|3|4|5|6|7"
replace employ_3cats =1 if employ == "1|2|3|4|6"
replace employ_3cats =1 if employ == "1|2|3|6"
replace employ_3cats =1 if employ == "1|2|3|6|7"
replace employ_3cats =1 if employ == "1|2|3|7"
replace employ_3cats =1 if employ == "1|2|4"
replace employ_3cats =1 if employ == "1|2|4|6"
replace employ_3cats =1 if employ == "1|2|4|7"
replace employ_3cats =1 if employ == "1|2|5"
replace employ_3cats =1 if employ == "1|2|6"
replace employ_3cats =1 if employ == "1|2|6|7"
replace employ_3cats =1 if employ == "1|2|7"
replace employ_3cats =1 if employ == "1|3"
replace employ_3cats =1 if employ == "1|3|4"
replace employ_3cats =1 if employ == "1|3|4|6"
replace employ_3cats =1 if employ == "1|3|5"
replace employ_3cats =1 if employ == "1|3|5|6"
replace employ_3cats =1 if employ == "1|3|6"
replace employ_3cats =1 if employ == "1|3|6|7"
replace employ_3cats =1 if employ == "1|3|7"
replace employ_3cats =1 if employ == "1|4"
replace employ_3cats =1 if employ == "1|4|5"
replace employ_3cats =1 if employ == "1|4|6"
replace employ_3cats =1 if employ == "1|4|7"
replace employ_3cats =1 if employ == "1|5"
replace employ_3cats =1 if employ == "1|5|6"
replace employ_3cats =1 if employ == "1|5|7"
replace employ_3cats =1 if employ == "1|6"
replace employ_3cats =1 if employ == "1|6|7"
replace employ_3cats =1 if employ == "1|7"
replace employ_3cats =2 if employ == "2"
replace employ_3cats =2 if employ == "2|3"
replace employ_3cats =2 if employ == "2|3|4"
replace employ_3cats =2 if employ == "2|3|4|5"
replace employ_3cats =2 if employ == "2|3|4|5|6"
replace employ_3cats =2 if employ == "2|3|4|6"
replace employ_3cats =2 if employ == "2|3|4|6|7"
replace employ_3cats =2 if employ == "2|3|5"
replace employ_3cats =2 if employ == "2|3|5|6"
replace employ_3cats =2 if employ == "2|3|6"
replace employ_3cats =2 if employ == "2|3|6|7"
replace employ_3cats =2 if employ == "2|3|7"
replace employ_3cats =2 if employ == "2|4"
replace employ_3cats =2 if employ == "2|4|5"
replace employ_3cats =2 if employ == "2|4|5|6"
replace employ_3cats =2 if employ == "2|4|6"
replace employ_3cats =2 if employ == "2|4|6|7"
replace employ_3cats =2 if employ == "2|4|7"
replace employ_3cats =2 if employ == "2|5"
replace employ_3cats =2 if employ == "2|5|6"
replace employ_3cats =2 if employ == "2|5|7"
replace employ_3cats =2 if employ == "2|6"
replace employ_3cats =2 if employ == "2|6|7"
replace employ_3cats =2 if employ == "2|7"
replace employ_3cats =3 if employ == "3"
replace employ_3cats =3 if employ == "3|4"
replace employ_3cats =3 if employ == "3|4|5"
replace employ_3cats =3 if employ == "3|4|5|7"
replace employ_3cats =3 if employ == "3|4|6"
replace employ_3cats =3 if employ == "3|4|6|7"
replace employ_3cats =3 if employ == "3|5"
replace employ_3cats =3 if employ == "3|5|6"
replace employ_3cats =3 if employ == "3|5|6|7"
replace employ_3cats =3 if employ == "3|5|7"
replace employ_3cats =3 if employ == "3|6"
replace employ_3cats =3 if employ == "3|6|7"
replace employ_3cats =3 if employ == "3|7"
replace employ_3cats =3 if employ == "4"
replace employ_3cats =3 if employ == "4|5"
replace employ_3cats =3 if employ == "4|5|6"
replace employ_3cats =3 if employ == "4|5|7"
replace employ_3cats =3 if employ == "4|6"
replace employ_3cats =3 if employ == "4|6|7"
replace employ_3cats =3 if employ == "4|7"
replace employ_3cats =3 if employ == "5"
replace employ_3cats =3 if employ == "5|6"
replace employ_3cats =3 if employ == "5|6|7"
replace employ_3cats =3 if employ == "5|7"
replace employ_3cats =3 if employ == "6"
replace employ_3cats =3 if employ == "6|7"
replace employ_3cats =3 if employ == "7"

tab employ_3cats, missing

	*label the employ_3cats variable
	label variable employ_3cats "Current employment status"


		*Create value labels for employ_3cats

label define employ_3cats_lb 1 "Paid employment/self-employed" 2 "Retired" 3 "Other"
label values employ_3cats employ_3cats_lb
tab employ_3cats, missing // 5245 employed. 2817 retired. 630 other. 22 missing.

******************************************************************************************

*7.Income
*"Do not know" (-1) and "Prefer not to answer" (-3) recoded to missing.
tab income , missing
recode income (-3 -1 =.)
tab income , missing
label define income_lb 1"<£18,000" 2 "£18,000-£30,999" 3 "£31,000-£51,999" 4 "£52,000-£100,000" 5 ">£100,000"
label values income income_lb
tab income , missing

*****************************************************
*Save & upload
save accel7.dta, replace
!dx upload accel7.dta