*Create table S2: Sleep duration by day in minutes
***************************************************
*Reopen doherty dataset
set more off
use /mnt/project/accel10.dta, clear


*1. Create matrices for Spring overall & stratified in minutes


*1a) Overall

keep if season =="Spring" // 7211 obs deleted
*Generate mean & se of each sleep duration day variable.
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save 


return list

*Name matrix
matrix spring_mat_mins = r(StatTotal)	  
matrix list spring_mat_mins

	
*Save matrix
svmat spring_mat_mins

*Just keep matrix variables
keep spring_mat_mins*
list in 1/5

*Drop empty observation rows
drop if spring_mat_mins1 ==. 
describe // 
list 

*Save as stata & excel file
save "spring_mat_mins.dta", replace
!dx upload spring_mat_mins.dta

export excel spring_mat_mins.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_mins.xlsx

**************************************

*1b) Sex

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear

keep if season =="Spring"

levelsof sex, local(levels)

foreach lev of local levels{
preserve
keep if sex == `lev'	
display "sex = `lev'" 
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save 
return list
matrix spring_mat_mins_sex_`lev' = r(StatTotal)	  
matrix list spring_mat_mins_sex_`lev'
svmat spring_mat_mins_sex_`lev'
save "spring_mat_mins_sex_`lev'.dta", replace
!dx upload spring_mat_mins_sex_`lev'.dta
keep spring_mat_mins_sex_`lev'*
drop if spring_mat_mins_sex_`lev'1 ==.
export excel spring_mat_mins_sex_`lev'.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_mins_sex_`lev'.xlsx
restore
}


*********************************
*1c) Age


*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Spring" 


levelsof age_accel_tert, local(levels)

foreach lev of local levels{
preserve
keep if age_accel_tert == `lev'
display "age = `lev'" 
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save 
return list
matrix spring_mat_mins_age_`lev' = r(StatTotal)	  
matrix list spring_mat_mins_age_`lev'
svmat spring_mat_mins_age_`lev'
save "spring_mat_mins_age_`lev'.dta", replace
!dx upload spring_mat_mins_age_`lev'.dta
keep spring_mat_mins_age_`lev'*
drop if spring_mat_mins_age_`lev'1 ==.
export excel spring_mat_mins_age_`lev'.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_mins_age_`lev'.xlsx
restore
}

****************************************

*1d) Chronotype

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Spring"  

levelsof chrono_3cats, local(levels)

foreach lev of local levels{
preserve
keep if chrono_3cats == `lev'
display "chronotype = `lev'" 
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save 
return list
matrix spring_mat_mins_chrono_`lev' = r(StatTotal)	  
matrix list spring_mat_mins_chrono_`lev'
svmat spring_mat_mins_chrono_`lev'
save "spring_mat_mins_chrono_`lev'.dta", replace
!dx upload spring_mat_mins_chrono_`lev'.dta
keep spring_mat_mins_chrono_`lev'*
*drop if spring_mat_mins_chrono_`lev'* ==.
export excel spring_mat_mins_chrono_`lev'.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_mins_chrono_`lev'.xlsx
restore
}

*******************************************

*1e) Sleep duration

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Spring"  


levelsof sleep_dur_cats, local(levels)

foreach lev of local levels{
preserve
keep if sleep_dur_cats == `lev'
display "sleep duration = `lev'" 
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save  
return list
matrix spring_mat_mins_sleepdur_`lev' = r(StatTotal)	  
matrix list spring_mat_mins_sleepdur_`lev'
svmat spring_mat_mins_sleepdur_`lev'
save "spring_mat_mins_sleepdur_`lev'.dta", replace
!dx upload spring_mat_mins_sleepdur_`lev'.dta
keep spring_mat_mins_sleepdur_`lev'*
drop if spring_mat_mins_sleepdur_`lev'1 ==.
export excel spring_mat_mins_sleepdur_`lev'.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_mins_sleepdur_`lev'.xlsx
restore
}

**************************************

*1f) Employment

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Spring"  


levelsof employ_3cats, local(levels)

foreach lev of local levels{
preserve
keep if employ_3cats == `lev'
display "employment = `lev'" 
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save 
return list
matrix spring_mat_mins_employ_`lev' = r(StatTotal)	  
matrix list spring_mat_mins_employ_`lev'
svmat spring_mat_mins_employ_`lev'
save "spring_mat_mins_employ_`lev'.dta", replace
!dx upload spring_mat_mins_employ_`lev'.dta
keep spring_mat_mins_employ_`lev'*
drop if spring_mat_mins_employ_`lev'1 ==.
export excel spring_mat_mins_employ_`lev'.xlsx, firstrow(varlabels) replace
!dx upload spring_mat_mins_employ_`lev'.xlsx
restore
}



************************************************************

*2. Create matrices for Autumn overall & stratified in minutes

 
 *Reopen doherty dataset
set more off
use /mnt/project/accel10.dta, clear

keep if season =="Autumn" // 4569 obs deleted.


*2a) Overall
*Generate mean & se of each sleep duration day variable.
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save 


return list

*Name matrix
matrix autumn_mat_mins = r(StatTotal)	  
matrix list autumn_mat_mins
	
*Save matrix
svmat autumn_mat_mins

*Just keep matrix variables
keep autumn_mat_mins*
list in 1/5

*Drop empty observation rows
drop if autumn_mat_mins1 ==. 
describe //
list 

*Save as stata & excel file
save "autumn_mat_mins.dta", replace
!dx upload autumn_mat_mins.dta

export excel autumn_mat_mins.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_mins.xlsx


**************************************

*2b) Sex

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear

keep if season =="Autumn"

levelsof sex, local(levels)

foreach lev of local levels{
preserve
keep if sex == `lev'	
display "sex = `lev'" 
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save 
return list
matrix autumn_mat_mins_sex_`lev' = r(StatTotal)	  
matrix list autumn_mat_mins_sex_`lev'
svmat autumn_mat_mins_sex_`lev'
save "autumn_mat_mins_sex_`lev'.dta", replace
!dx upload autumn_mat_mins_sex_`lev'.dta
keep autumn_mat_mins_sex_`lev'*
drop if autumn_mat_mins_sex_`lev'1 ==.
export excel autumn_mat_mins_sex_`lev'.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_mins_sex_`lev'.xlsx
restore
}


*********************************
*2c) Age


*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Autumn" 


levelsof age_accel_tert, local(levels)

foreach lev of local levels{
preserve
keep if age_accel_tert == `lev'
display "age = `lev'" 
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save 
return list
matrix autumn_mat_mins_age_`lev' = r(StatTotal)	  
matrix list autumn_mat_mins_age_`lev'
svmat autumn_mat_mins_age_`lev'
save "autumn_mat_mins_age_`lev'.dta", replace
!dx upload autumn_mat_mins_age_`lev'.dta
keep autumn_mat_mins_age_`lev'*
drop if autumn_mat_mins_age_`lev'1 ==.
export excel autumn_mat_mins_age_`lev'.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_mins_age_`lev'.xlsx
restore
}

****************************************

*2d) Chronotype

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Autumn"  

levelsof chrono_3cats, local(levels)

foreach lev of local levels{
preserve
keep if chrono_3cats == `lev'
display "chronotype = `lev'" 
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save 
return list
matrix autumn_mat_mins_chrono_`lev' = r(StatTotal)	  
matrix list autumn_mat_mins_chrono_`lev'
svmat autumn_mat_mins_chrono_`lev'
save "autumn_mat_mins_chrono_`lev'.dta", replace
!dx upload autumn_mat_mins_chrono_`lev'.dta
keep autumn_mat_mins_chrono_`lev'*
drop if autumn_mat_mins_chrono_`lev'1 ==.
export excel autumn_mat_mins_chrono_`lev'.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_mins_chrono_`lev'.xlsx
restore
}

*******************************************

*2e) Sleep duration

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Autumn"  


levelsof sleep_dur_cats, local(levels)

foreach lev of local levels{
preserve
keep if sleep_dur_cats == `lev'
display "sleep duration = `lev'" 
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save  
return list
matrix autumn_mat_mins_sleepdur_`lev' = r(StatTotal)	  
matrix list autumn_mat_mins_sleepdur_`lev'
svmat autumn_mat_mins_sleepdur_`lev'
save "autumn_mat_mins_sleepdur_`lev'.dta", replace
!dx upload autumn_mat_mins_sleepdur_`lev'.dta
keep autumn_mat_mins_sleepdur_`lev'*
drop if autumn_mat_mins_sleepdur_`lev'1 ==.
export excel autumn_mat_mins_sleepdur_`lev'.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_mins_sleepdur_`lev'.xlsx
restore
}

**************************************

*2f) Employment

*Reopen doherty dataset
clear
set more off
use /mnt/project/accel10.dta, clear
keep if season =="Autumn"  


levelsof employ_3cats, local(levels)

foreach lev of local levels{
preserve
keep if employ_3cats == `lev'
display "employment = `lev'" 
tabstat sleep_dur_sun_before sleep_dur_mon_before sleep_dur_tue_before sleep_dur_wed_before sleep_dur_thur_before sleep_dur_fri_before sleep_dur_sat_before sleep_dur_sun_change sleep_dur_mon_after sleep_dur_tue_after sleep_dur_wed_after sleep_dur_thur_after sleep_dur_fri_after sleep_dur_sat_after sleep_dur_sun_after, stats(mean sem) save 
return list
matrix autumn_mat_mins_employ_`lev' = r(StatTotal)	  
matrix list autumn_mat_mins_employ_`lev'
svmat autumn_mat_mins_employ_`lev'
save "autumn_mat_mins_employ_`lev'.dta", replace
!dx upload autumn_mat_mins_employ_`lev'.dta
keep autumn_mat_mins_employ_`lev'*
drop if autumn_mat_mins_employ_`lev'1 ==.
export excel autumn_mat_mins_employ_`lev'.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat_mins_employ_`lev'.xlsx
restore
}
