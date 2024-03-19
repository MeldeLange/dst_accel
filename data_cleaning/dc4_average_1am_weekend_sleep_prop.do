*To adjust for Doherty data cleaning we need to calculate the average weekend sleep proportion at 1am of people not affected by the clock change.
***********************************************************************************************************************************************

*Open previous dataset with variables named & Doherty quality control performed.
set more off
use /mnt/project/accel2.dta, clear
describe // 96,649 obs. 116 vars.

*1. Repeat further participant removal steps.

*a) Drop anyone without start_wear and end_wear
count if start_wear =="" //4
count if end_wear =="" //4

drop if start_wear =="" // 4 obs deleted
drop if end_wear =="" // 0 obs deleted.

describe // obs: 96,645


*************************************************************
*b) Drop anyone without 7 days of accelerometer wear

	** Reformat dates (start_wear, end_wear, date_assess)

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
	
*Drop people without 7 days of wear time.
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
drop if accel_days !=7 // 2,051 obs deleted.
describe // 94,594. vars: 119.

****************************************************************

*2. Drop people who were wearing accelerometer at DST crossover
count if DST_crossover==1 // 4,203
drop if DST_crossover==1 // 4,203 obs deleted.
describe // 90,391 obs. 119 vars.


*********************************************************************

*3. Calculate mean proportion of sleep bewteen 1-2am on the weekend of people not affected by clock changes
sum sleep_prop_weekend_hour_1 // the mean sleep proportion between 1-2am on a weekend is: 0.9033677

**************************************************************************************************

*4. Save file
save pheno_doherty_nocrossover.dta, replace
!dx upload pheno_doherty_nocrossover.dta

