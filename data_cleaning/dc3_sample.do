*Remove anyone without up-to-quality Doherty accelerometer data.
********************************************************************

*1. Quality control for Doherty accelerometer data
**************************************************

*Open dataset with variables named
set more off
use /mnt/project/accel.dta, clear
describe


*Generate flag variable for overall acceleration over 100mg.
gen overall_act_over100 =0
replace overall_act_over100=1 if overall_activity>100 & overall_activity<. // 32 real changes.
tab overall_act_over100 // 1: 32. 0: 103,596.
label variable overall_act_over100 "Overall activity over 100mg? 1=yes"



*Generate variable for % of readings exceeding +/- 8g before calibration 
gen percent_clipped_before_calib = exceed_8grav_before / total_readings * 100
summarize percent_clipped_before_calib

*Generate variable for those with over 1 percent clipped before calibration (0= <=1%, 1=>1%) 
gen over_1perc_clipped_before_calib =0
replace over_1perc_clipped_before_calib =1 if percent_clipped_before_calib >1 & percent_clipped_before_calib<. // 2 changes made.
tab over_1perc_clipped_before_calib // 0: 103,626. 1: 2.
label variable over_1perc_clipped_before_calib "Over 1% clipped before calibration? 1 = yes"


*Generate variable for % of readings exceeding +/- 8g after calibration 
gen percent_clipped_after_calib = exceed_8grav_after / total_readings * 100
summarize percent_clipped_after_calib


*Generate variable for those with over 1 percent clipped after calibration (0= <=1%, 1=>1%) 
generate over_1perc_clipped_after_calib=0
replace over_1perc_clipped_after_calib=1  if percent_clipped_after_calib >1 & percent_clipped_after_calib<. // 3 changes made.
tab over_1perc_clipped_after_calib // 0: 103,625. 1: 3.
label variable over_1perc_clipped_after_calib "Over 1% clipped after calibration? 1 = yes"

*Generate variable for over 1% clipped before OR after calibration (1 = yes)
gen over_1perc_clipped_BorA =0
replace over_1perc_clipped_BorA =1 if over_1perc_clipped_before_calib ==1 | over_1perc_clipped_after_calib ==1 // 3 changes made.
tab over_1perc_clipped_BorA // 0: 103,625. 1: 3.
label variable over_1perc_clipped_BorA "Over 1% clipped before/after calibration? 1 = yes"


*Generate Remove variable for Doherty sleep accel data (1=remove these cases)
gen remove = 1 if good_calib ==0 | good_wear ==0 | over_1perc_clipped_BorA ==1 | overall_act_over100 ==1 // 96,649 mising values generated.
tab remove // 1: 6,979.


*Drop anyone with poor quality Doherty data
drop if remove ==1 // 6979 obs deleted.
describe // 96,649 obs: vars: 116.

*Save & upload
save accel2.dta, replace
!dx upload accel2.dta


*********************************************************************************


*2. Drop anyone without start_wear and end_wear
count if start_wear =="" //4
count if end_wear =="" //4

drop if start_wear =="" // 4 obs deleted
drop if end_wear =="" // 0 obs deleted.

describe // obs: 96,645


**********************************************************************

*3. Reformat dates (start_wear, end_wear, date_assess)

list start_wear end_wear date_assess in 1/5

**Check current format is YMD - yes date_assess is this format.
*But start_wear and end_wear are string 24 and have times not just dates.

*Convert start of accel wear and end of accel wear to just the dates (not times)
gen date_start_wear = substr(start_wear, 1,10) 
list start_wear date_start_wear in 1/5

gen date_end_wear = substr(end_wear, 1,10)
list end_wear date_end_wear in 1/5


*Convert date of assessment centre from string to stata elapsed date format
	generate date_assess_stata = date(date_assess, "YMD")
	list eid date_assess date_assess_stata in 1/5
	
	*Make elapsed date readable
	format date_assess_stata %d
	list eid date_assess date_assess_stata in 1/5
	
	*Rename variable back to original name
	drop date_assess
	rename date_assess_stata date_assess
	list eid date_assess in 1/5
	

*Convert date of start of wear from string to stata elapsed date format
	generate date_start_wear_stata = date(date_start_wear, "YMD")
	list eid date_start_wear date_start_wear_stata in 1/5
	
	*Make elapsed date readable
	format date_start_wear_stata %d
	list eid date_start_wear date_start_wear_stata in 1/5
	
	*Rename variable back to original name
	drop date_start_wear
	rename date_start_wear_stata date_start_wear
	list eid date_start_wear in 1/5
	

*Convert date of end of wear from string to stata elapsed date format
	generate date_end_wear_stata = date(date_end_wear, "YMD")
	list eid date_end_wear date_end_wear_stata in 1/5
	
	*Make elapsed date readable
	format date_end_wear_stata %d
	list eid date_end_wear date_end_wear_stata in 1/5
	
	*Rename variable back to original name
	drop date_end_wear
	rename date_end_wear_stata date_end_wear
	list eid date_end_wear in 1/5
	

*Look at what years we have data for
ssc install summdate
summdate date_start_wear // min: 1 June 2013. Max 23rd Dec 2015.
summdate date_end_wear // min: 8th June 2013. Max: 30th Dec 2015.

**************************************************************

*4. Drop people without 7 days of wear time.
*Create var for total number of accel days
gen accel_days = date_end_wear - date_start_wear
list date_start_wear date_end_wear accel_days in 1/5
sum accel_days // min:3. max: 7.
count if accel_days == 3 // 184
count if accel_days == 4 // 398
count if accel_days ==5 // 579
count if accel_days == 6 // 890
count if accel_days == 7 // 94,594


*Drop those without 7 days of accelerometer wear
drop if accel_days !=7 // 2051 obs deleted
describe // 94,594 obs. 119 vars.

*Save & upload quality controlled dataset
save accel3.dta, replace
!dx upload accel3.dta

**************************************************************

*5. Cut sample down to people starting to wear accelerometer in right months. 
	

	*Create variable that is year of actigraphy wear
g year = year(date_start_wear)
list date_start_wear year in 1/5
tab year // 2013: 11,174. 2014: 42,715. 2015: 40,715.
	
	*Create variable that is month of actigraphy wear
g month = month(date_start_wear)
list date_start_wear month in 1/5
tab month // March: 7063. April: 7553. October: 10,873. November 9,276.
	
	*Cut sample down to those starting to wear accelerometer in March, April, October or November
keep if month ==3 | month ==4 | month ==10 | month ==11 // 59829 obs deleted.
describe // 34,766 obs. 121 vars.

*****************************************************************

*6. Generate clock change variable

*Create season variable.
generate season = ""
	replace season = "Spring" if month ==3 
	replace season = "Spring" if month ==4
	replace season = "Autumn" if month ==10
	replace season = "Autumn" if month ==11
	tab season 


*Create date of clock change var based on year & spring/autumn clock change var. **mdy creates the date in stata elapsed time.
	generate clock_change = mdy(00,00,0000)
	replace clock_change = mdy(03,31,2013) if year == 2013 & season == "Spring" 
	replace clock_change = mdy(10,27,2013) if year == 2013 & season == "Autumn" 
	replace clock_change = mdy(03,30,2014) if year == 2014 & season == "Spring" 
	replace clock_change = mdy(10,26,2014) if year == 2014 & season == "Autumn" 
	replace clock_change = mdy(03,29,2015) if year == 2015 & season == "Spring" 
	replace clock_change = mdy(10,25,2015) if year == 2015 & season == "Autumn" 
	
*Make elapsed clock_change date readable
	generate clock_change_stata = clock_change
	format clock_change_stata %d
	*Rename variable back to original name
	drop clock_change
	rename clock_change_stata clock_change
	list clock_change in 1/5
	
**************************************************************************************


*7.Only keep people who have usable data (not day 1) for the 15-day period of the Sunday before the clock change (=7 days before - so need to start wearing accelerometer 8 days before) to the Sunday after the clock change (=7 days after - so need to start wearing accelerometer 6 days after).
*So we have people starting on the Saturday before the clock change to the Saturday after the clock change.

count if clock_change - date_start_wear == 8 // Starting wear Sat before: 996
count if clock_change - date_start_wear == 7 // Starting wearSun before: 0
count if clock_change - date_start_wear == 6 // Starting wear Mon before: 1,073
count if clock_change - date_start_wear == 5 // Starting wear Tues before: 0
count if clock_change - date_start_wear == 4 // Starting wear Wed before: 536
count if clock_change - date_start_wear == 3 // Starting wear Thurs before: 820
count if clock_change - date_start_wear == 2 // Starting wear Fri before: 701
count if clock_change - date_start_wear == 1 // Starting wear Sat before:1,073
count if clock_change - date_start_wear == 0 // Starting wear Sun of clock change: 0	
count if clock_change - date_start_wear == -1 // Starting wear Mon after: 869
count if clock_change - date_start_wear == -2 // Starting wear Tues after: 0
count if clock_change - date_start_wear == -3 // Starting wear Wed after: 669
count if clock_change - date_start_wear == -4 // Starting wear Thurs after: 764
count if clock_change - date_start_wear == -5 // Starting wear Fri after: 468
count if clock_change - date_start_wear == -6 // Starting wear Sat after: 745


keep if clock_change - date_start_wear == 8 | clock_change - date_start_wear == 7 | clock_change - date_start_wear == 6 | clock_change - date_start_wear == 5 | clock_change - date_start_wear == 4 | clock_change - date_start_wear == 3 | clock_change - date_start_wear == 2 | clock_change - date_start_wear == 1 | clock_change - date_start_wear == 0 | clock_change - date_start_wear == -1 | clock_change - date_start_wear == -2 | clock_change - date_start_wear == -3 | clock_change - date_start_wear == -4 | clock_change - date_start_wear == -5 | clock_change - date_start_wear == -6 // 26,051 obs deleted
describe // 8714 obs. 123 vars.


************************************************************************	

*8. Generate variable for age when starting wearing accelerometer

	*Create difference between date of starting to wear accelerometer & baseline assessment date (in days)
	gen date_diff = date_start_wear - date_assess
	list date_diff date_start_wear date_assess in 1/5

	*Convert difference to years
	gen date_diff_yrs = date_diff/365.25
	list date_diff date_diff_yrs in 1/5
	
	*Round difference between accelerometer wear & baseline to whole years
	gen date_diff_wholeyrs = round(date_diff_yrs,1.00) 
	list date_diff_yrs date_diff_wholeyrs in 1/5
	

	*Generate age at accelelerometer wear 
	list age_assess in 1/10
	gen age_accel = age_assess+date_diff_wholeyrs
	list age_assess date_diff_wholeyrs age_accel in 1/5

	sum age_accel //  obs: 8714. Mean 61.91198. Min: 43. Max. 78.

************************************************************************	

*9. Save & upload
save accel4.dta, replace
!dx upload accel4.dta


