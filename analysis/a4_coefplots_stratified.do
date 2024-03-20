*Create coefficient plots of sleep duration by day (hours) stratified by sociodemographics
*******************************************************************************************


*1. Create & save matrices of mean & SE of mean for sleep duration by day.
***************************************************************************

*a) Spring
**********

************

**Sex

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear

keep if season =="Spring" 

levelsof sex, local(levels)

foreach lev of local levels{
preserve
display "sex = `lev'" 
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 
return list
matrix spring_mat_sex_`lev' = r(StatTotal)	  
matrix list spring_mat_sex_`lev'
svmat spring_mat_sex_`lev'
save "spring_mat_sex_`lev'.dta", replace
!dx upload spring_mat_sex_`lev'.dta
keep spring_mat_sex_`lev'*
drop if spring_mat_sex_`lev'1 ==.
export excel spring_mat_sex_`lev'.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_sex_`lev'.xlsx
restore
}



**Age

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Spring" 


levelsof age_accel_tert, local(levels)

foreach lev of local levels{
preserve
display "age = `lev'" 
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 
return list
matrix spring_mat_age_`lev' = r(StatTotal)	  
matrix list spring_mat_age_`lev'
svmat spring_mat_age_`lev'
save "spring_mat_age_`lev'.dta", replace
!dx upload spring_mat_age_`lev'.dta
keep spring_mat_age_`lev'*
drop if spring_mat_age_`lev'1 ==.
export excel spring_mat_age_`lev'.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_age_`lev'.xlsx
restore
}

******************************



*Chronotype

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Spring"  

levelsof chrono_3cats, local(levels)

foreach lev of local levels{
preserve
display "chronotype = `lev'" 
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 
return list
matrix spring_mat_chrono_`lev' = r(StatTotal)	  
matrix list spring_mat_chrono_`lev'
svmat spring_mat_chrono_`lev'
save "spring_mat_chrono_`lev'.dta", replace
!dx upload spring_mat_chrono_`lev'.dta
keep spring_mat_chrono_`lev'*
*drop if spring_mat_chrono_`lev'* ==.
export excel spring_mat_chrono_`lev'.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_chrono_`lev'.xlsx
restore
}

**********************

*Sleep duration

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Spring"  


levelsof sleep_dur_cats, local(levels)

foreach lev of local levels{
preserve
display "sleep duration = `lev'" 
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save  
return list
matrix spring_mat_sleepdur_`lev' = r(StatTotal)	  
matrix list spring_mat_sleepdur_`lev'
svmat spring_mat_sleepdur_`lev'
save "spring_mat_sleepdur_`lev'.dta", replace
!dx upload spring_mat_sleepdur_`lev'.dta
keep spring_mat_sleepdur_`lev'*
drop if spring_mat_sleepdur_`lev'1 ==.
export excel spring_mat_sleepdur_`lev'.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_sleepdur_`lev'.xlsx
restore
}

***********

*Employment

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Spring"  


levelsof employ_3cats, local(levels)

foreach lev of local levels{
preserve
display "employment = `lev'" 
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 
return list
matrix spring_mat_employ_`lev' = r(StatTotal)	  
matrix list spring_mat_employ_`lev'
svmat spring_mat_employ_`lev'
save "spring_mat_employ_`lev'.dta", replace
!dx upload spring_mat_employ_`lev'.dta
keep spring_mat_employ_`lev'*
drop if spring_mat_employ_`lev'1 ==.
export excel spring_mat_employ_`lev'.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_employ_`lev'.xlsx
restore
}



*****************************************************************************************************************

*b) Autumn
**********

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear

keep if season =="Autumn" 

************

**Sex

levelsof sex, local(levels)
foreach lev of local levels{
preserve
display "sex = `lev'" 
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 
return list
matrix autumn_mat_sex_`lev' = r(StatTotal)	  
matrix list autumn_mat_sex_`lev'
svmat autumn_mat_sex_`lev'
save "autumn_mat_sex_`lev'.dta", replace
!dx upload autumn_mat_sex_`lev'.dta
keep autumn_mat_sex_`lev'*
drop if autumn_mat_sex_`lev'1 ==.
export excel autumn_mat_sex_`lev'.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_sex_`lev'.xlsx
restore
}

*************

**AGE

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear

keep if season =="Autumn" 


levelsof age_accel_tert, local(levels)
foreach lev of local levels{
preserve
display "age = `lev'" 
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save  
return list
matrix autumn_mat_age_`lev' = r(StatTotal)	  
matrix list autumn_mat_age_`lev'
svmat autumn_mat_age_`lev'
save "autumn_mat_age_`lev'.dta", replace
!dx upload autumn_mat_age_`lev'.dta
keep autumn_mat_age_`lev'*
drop if autumn_mat_age_`lev'1 ==.
export excel autumn_mat_age_`lev'.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_age_`lev'.xlsx
restore
}



********
*Chronotype

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear

keep if season =="Autumn" 

levelsof chrono_3cats, local(levels)

foreach lev of local levels{
preserve
display "chronotype = `lev'" 
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 
return list
matrix autumn_mat_chrono_`lev' = r(StatTotal)	  
matrix list autumn_mat_chrono_`lev'
svmat autumn_mat_chrono_`lev'
save "autumn_mat_chrono_`lev'.dta", replace
!dx upload autumn_mat_chrono_`lev'.dta
keep autumn_mat_chrono_`lev'*
drop if autumn_mat_chrono_`lev'1 ==.
export excel autumn_mat_chrono_`lev'.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_chrono_`lev'.xlsx
restore
}


*Sleep duration

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear

keep if season =="Autumn"  

levelsof sleep_dur_cats, local(levels)

foreach lev of local levels{
preserve
display "sleep duration = `lev'" 
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 
return list
matrix autumn_mat_sleepdur_`lev' = r(StatTotal)	  
matrix list autumn_mat_sleepdur_`lev'
svmat autumn_mat_sleepdur_`lev'
save "autumn_mat_sleepdur_`lev'.dta", replace
!dx upload autumn_mat_sleepdur_`lev'.dta
keep autumn_mat_sleepdur_`lev'*
drop if autumn_mat_sleepdur_`lev'1 ==.
export excel autumn_mat_sleepdur_`lev'.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_sleepdur_`lev'.xlsx
restore
}



*Employment

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear

keep if season =="Autumn" 

levelsof employ_3cats, local(levels)

foreach lev of local levels{
preserve
display "employment = `lev'" 
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 
return list
matrix autumn_mat_employ_`lev' = r(StatTotal)	  
matrix list autumn_mat_employ_`lev'
svmat autumn_mat_employ_`lev'
save "autumn_mat_employ_`lev'.dta", replace
!dx upload autumn_mat_employ_`lev'.dta
keep autumn_mat_employ_`lev'*
drop if autumn_mat_employ_`lev'1 ==.
export excel autumn_mat_employ_`lev'.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_employ_`lev'.xlsx
restore
}



****************************************************************************************

*2. Create coefficient plots for matrices

*SPRING
********

**Manually download excel matrices from DNA Nexus & save to desktop*
*In Stata on desktop*

*Set working directory


*Create a local macro for spring sex files in the directory
local myfilelist : dir "." files "spring_mat_*.xlsx"

*Loop to open files
foreach file of local myfilelist{
	import excel using `file', firstrow clear
	local name = subinstr("`file'",".xlsx","",.)
	mkmat spring_mat*, matrix(`name')
	matrix list `name' 
	ssc install coefplot
	coefplot mat(`name'), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)
graph save "`name'_coefplot", replace
graph export "`name'_coefplot.wmf", replace
graph export "`name'_coefplot.pdf", as(pdf) replace 
graph export "`name'_coefplot.eps", replace
		
}




*AUTUMN
*******

*Set working directory


*Create a local macro for spring sex files in the directory
local myfilelist : dir "." files "autumn_mat_*.xlsx"

*Loop to open files
foreach file of local myfilelist{
	import excel using `file', firstrow clear
	local name = subinstr("`file'",".xlsx","",.)
	mkmat autumn_mat*, matrix(`name')
	matrix list `name' 
	ssc install coefplot
	coefplot mat(`name'), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)
graph save "`name'_coefplot", replace
graph export "`name'_coefplot.wmf", replace
graph export "`name'_coefplot.pdf", as(pdf) replace 
graph export "`name'_coefplot.eps", replace
		
}