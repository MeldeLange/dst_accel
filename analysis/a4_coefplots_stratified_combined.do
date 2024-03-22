*Create combined coefficient plots of sleep duration by day (hours) stratified by sociodemographics
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
keep if sex == `lev'	
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
keep if age_accel_tert == `lev'
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
keep if chrono_3cats == `lev'
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
keep if sleep_dur_cats == `lev'
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
keep if employ_3cats == `lev'
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
keep if sex == `lev'
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
keep if age_accel_tert == `lev'
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
keep if chrono_3cats == `lev'
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
keep if sleep_dur_cats == `lev'
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
keep if employ_3cats == `lev'
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



*2. Create coefplots combining the strata of each sociodemographic characteristic
**********************************************************************************

*Set working directory


*1. SEX

foreach season in spring autumn {
*Import matrix for women
import excel "`season'_mat_sex_0.xlsx", firstrow clear
rename `season'_mat_sex_01 Sun_before
rename `season'_mat_sex_02 Mon_before
rename `season'_mat_sex_03 Tue_before
rename `season'_mat_sex_04 Wed_before
rename `season'_mat_sex_05 Thur_before
rename `season'_mat_sex_06 Fri_before
rename `season'_mat_sex_07 Sat_before
rename `season'_mat_sex_08 Sun_change
rename `season'_mat_sex_09 Mon_after
rename `season'_mat_sex_010 Tue_after
rename `season'_mat_sex_011 Wed_after
rename `season'_mat_sex_012 Thur_after
rename `season'_mat_sex_013 Fri_after
rename `season'_mat_sex_014 Sat_after
rename `season'_mat_sex_015 Sun_after
*Save dataset
save `season'_female.dta, replace

******

*Import matrix for men
import excel "`season'_mat_sex_1.xlsx", firstrow clear
rename `season'_mat_sex_11 Sun_before
rename `season'_mat_sex_12 Mon_before
rename `season'_mat_sex_13 Tue_before
rename `season'_mat_sex_14 Wed_before
rename `season'_mat_sex_15 Thur_before
rename `season'_mat_sex_16 Fri_before
rename `season'_mat_sex_17 Sat_before
rename `season'_mat_sex_18 Sun_change
rename `season'_mat_sex_19 Mon_after
rename `season'_mat_sex_110 Tue_after
rename `season'_mat_sex_111 Wed_after
rename `season'_mat_sex_112 Thur_after
rename `season'_mat_sex_113 Fri_after
rename `season'_mat_sex_114 Sat_after
rename `season'_mat_sex_115 Sun_after
*Save dataset
save `season'_male.dta, replace

******

*Append the 2 datasets
use `season'_male.dta, clear
append using `season'_female.dta
save `season'_sex_append.dta, replace

******

*Create the matrices

use `season'_sex_append.dta, clear

*Turn data for males into matrix (only keep first  rows)
preserve
keep in 1/2

mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_male_matrix)

matrix list `season'_male_matrix 
restore

*Turn data for females into matrix (only keep rows 3 and 4)

drop in 1/2

mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_female_matrix)

matrix list `season'_female_matrix 

*********************

*Create combined coefficient plots

	*Install coefficient plot package
ssc install coefplot


*Blue & red version
coefplot (mat(`season'_male_matrix), label(Men) ms(O) msize(vsmall) mc(edkblue) ciopts(lc(edkblue) lwidth(vthin)) offset(-0.10)) (mat(`season'_female_matrix), label(Women) ms(T) msize(vsmall) mc(erose) ciopts(lc(erose) lwidth(vthin)) offset(0.10)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\sex_colour_`season'_coefplot", replace
graph export "graphs\sex_colour_`season'_coefplot.wmf", replace
graph export "graphs\sex_colour_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\sex_colour_`season'_coefplot.eps", replace

******************

*Black & white version
set scheme s1mono
coefplot (mat(`season'_male_matrix), label(Men) ms(O) msize(vsmall) ciopts(lwidth(vthin)) offset(-0.10)) (mat(`season'_female_matrix), label(Women) ms(T) msize(vsmall) mc(%40) ciopts(lc(%40) lwidth(vthin)) offset(0.10)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\sex_mono_`season'_coefplot", replace
graph export "graphs\sex_mono_`season'_coefplot.wmf", replace
graph export "graphs\sex_mono_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\sex_mono_`season'_coefplot.eps", replace


***********************************************

*Version with thicker CIs and biggerpoint estimates for powerpoint presentations
*help markersizestyle
*help linewidthstyle

*Blue & red version
coefplot (mat(`season'_male_matrix), label(Men) ms(O) msize(small) mc(edkblue) ciopts(lc(edkblue) lwidth(medium)) offset(-0.10)) (mat(`season'_female_matrix), label(Women) ms(T) msize(small) mc(erose) ciopts(lc(erose) lwidth(medium)) offset(0.10)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\sex_presentation_colour_`season'_coefplot", replace
graph export "graphs\sex_presentation_colour_`season'_coefplot.wmf", replace
graph export "graphs\sex_presentation_colour_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\sex_presentation_colour_`season'_coefplot.eps", replace

*******************

*Black & white version
set scheme s1mono
coefplot (mat(`season'_male_matrix), label(Men) ms(O) msize(small) ciopts(lwidth(medium)) offset(-0.10)) (mat(`season'_female_matrix), label(Women) ms(T) msize(small) mc(%40) ciopts(lc(%40) lwidth(medium)) offset(0.10)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\sex_presentation_mono_`season'_coefplot", replace
graph export "graphs\sex_presentation_mono_`season'_coefplot.wmf", replace
graph export "graphs\sex_presentation_mono_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\sex_presentation_mono_`season'_coefplot.eps", replace

}


***************************************************************

*b) AGE

*Set working directory




foreach season in spring autumn {
*Import & clean matrices for strata of age

*Create a local macro for age files in the directory
local myfilelist : dir "." files "`season'_mat_age*.xlsx"

*Loop to open & reformat each file & save as .dta file.
foreach file of local myfilelist{
	import excel using `file', firstrow clear
	local name = subinstr("`file'",".xlsx","",.)
	local dataname = subinstr("`name'","_mat","",.)
rename `name'1 Sun_before
rename `name'2 Mon_before
rename `name'3 Tue_before
rename `name'4 Wed_before
rename `name'5 Thur_before
rename `name'6 Fri_before
rename `name'7 Sat_before
rename `name'8 Sun_change
rename `name'9 Mon_after
rename `name'10 Tue_after
rename `name'11 Wed_after
rename `name'12 Thur_after
rename `name'13 Fri_after
rename `name'14 Sat_after
rename `name'15 Sun_after
save "`dataname'.dta", replace	
}



******

*Append the 3 datasets

use `season'_age_1.dta, clear
append using `season'_age_2
append using `season'_age_3 
save `season'_age_append.dta, replace

******

*Create the matrices

use `season'_age_append.dta, clear
browse

*Turn data for age1 into matrix (only keep first 2 rows)
preserve
keep in 1/2

mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_age1_matrix)

matrix list `season'_age1_matrix 
restore

*Turn data for age2 into matrix (only keep rows 3 and 4)
preserve
keep in 3/4

mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_age2_matrix)

matrix list `season'_age2_matrix 
restore

*Turn data for age3 into matrix (only keep rows 5 and 6)
keep in 5/6
mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_age3_matrix)
matrix list `season'_age3_matrix

*********************

*Create combined coefficient plots


*Blue & red version
coefplot (mat(`season'_age1_matrix), label(Age 43-58) ms(O) msize(vsmall) mc(edkblue) ciopts(lc(edkblue) lwidth(vthin)) offset(-0.20)) (mat(`season'_age2_matrix), label(Age 59-67) ms(T) msize(vsmall) mc(erose) ciopts(lc(erose) lwidth(vthin)) offset(0.00)) (mat(`season'_age3_matrix), label(Age 68-78) ms(D) msize(vsmall) mc(eltgreen) ciopts(lc(eltgreen) lwidth(vthin)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\age_colour_`season'_coefplot", replace
graph export "graphs\age_colour_`season'coefplot.wmf", replace
graph export "graphs\age_colour_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\age_colour_`season'_coefplot.eps", replace

******************

*Black & white version
set scheme s1mono
coefplot (mat(`season'_age1_matrix), label(Age 43-58) ms(O) msize(vsmall) ciopts(lwidth(vthin)) offset(-0.20)) (mat(`season'_age2_matrix), label(Age 59-67) ms(T) msize(vsmall) mc(%40) ciopts(lc(%40) lwidth(vthin)) offset(0.00))(mat(`season'_age3_matrix), label(Age 68-78) ms(D) msize(vsmall) mc(%60) ciopts(lc(%60) lwidth(vthin)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\age_mono_`season'_coefplot", replace
graph export "graphs\age_mono_`season'_coefplot.wmf", replace
graph export "graphs\age_mono_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\age_mono_`season'_coefplot.eps", replace


***********************************************

*Version with thicker CIs and biggerpoint estimates for powerpoint presentations
*help markersizestyle
*help linewidthstyle

*Blue & red version
coefplot (mat(`season'_age1_matrix), label(Age 43-59) ms(O) msize(small) mc(edkblue) ciopts(lc(edkblue) lwidth(medium)) offset(-0.20)) (mat(`season'_age2_matrix), label(Age 60-67) ms(T) msize(small) mc(erose) ciopts(lc(erose) lwidth(medium)) offset(0.00)) (mat(`season'_age3_matrix), label(Age 68-77) ms(D) msize(small) mc(eltgreen) ciopts(lc(eltgreen) lwidth(medium)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)


*Save as stata graph, pdf & windows metafile
graph save "graphs\age_presentation_colour_`season'_coefplot", replace
graph export "graphs\age_presentation_colour_`season'_coefplot.wmf", replace
graph export "graphs\age_presentation_colour_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\age_presentation_colour_`season'_coefplot.eps", replace

*******************

*Black & white version
set scheme s1mono
coefplot (mat(`season'_age1_matrix), label(Age 43-58) ms(O) msize(small) ciopts(lwidth(medium)) offset(-0.20)) (mat(`season'_age2_matrix), label(Age 59-67) ms(T) msize(small) mc(%40) ciopts(lc(%40) lwidth(medium)) offset(0.00))(mat(`season'_age3_matrix), label(Age 68-78) ms(D) msize(small) mc(%60) ciopts(lc(%60) lwidth(medium)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\age_presentation_mono_`season'_coefplot", replace
graph export "graphs\age_presentation_mono_`season'_coefplot.wmf", replace
graph export "graphs\age_presentation_mono_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\age_presentation_mono_`season'_coefplot.eps", replace

}


************************************************

*c) EMPLOYMENT STATUS

*Set working directory


foreach season in spring autumn {
*Import & clean matrices for strata of employment

*Create a local macro for age files in the directory
local myfilelist : dir "." files "`season'_mat_employ*.xlsx"

*Loop to open & reformat each file & save as .dta file.
foreach file of local myfilelist{
	import excel using `file', firstrow clear
	local name = subinstr("`file'",".xlsx","",.)
	local dataname = subinstr("`name'","_mat","",.)
rename `name'1 Sun_before
rename `name'2 Mon_before
rename `name'3 Tue_before
rename `name'4 Wed_before
rename `name'5 Thur_before
rename `name'6 Fri_before
rename `name'7 Sat_before
rename `name'8 Sun_change
rename `name'9 Mon_after
rename `name'10 Tue_after
rename `name'11 Wed_after
rename `name'12 Thur_after
rename `name'13 Fri_after
rename `name'14 Sat_after
rename `name'15 Sun_after
save "`dataname'.dta", replace	
}



******

*Append the 3 datasets

use `season'_employ_1.dta, clear
append using `season'_employ_2
append using `season'_employ_3 
browse

save `season'_employ_append.dta, replace

******

*Create the matrices

use `season'_employ_append.dta, clear
browse

*Turn data for employ1 into matrix (only keep first  rows)
preserve
keep in 1/2

mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_employ1_matrix)

matrix list `season'_employ1_matrix 
restore

*Turn data for employ2 into matrix (only keep rows 3 and 4)
preserve
keep in 3/4

mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_employ2_matrix)

matrix list `season'_employ2_matrix 
restore

*Turn data for employ3 into matrix (only keep rows 5 and 6)
keep in 5/6
mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_employ3_matrix)
matrix list `season'_employ3_matrix


*********************

*Create combined coefficient plots

*Blue & red version
coefplot (mat(`season'_employ1_matrix), label(Employed) ms(O) msize(vsmall) mc(edkblue) ciopts(lc(edkblue) lwidth(vthin)) offset(-0.20)) (mat(`season'_employ2_matrix), label(Retired) ms(T) msize(vsmall) mc(erose) ciopts(lc(erose) lwidth(vthin)) offset(0.00)) (mat(`season'_employ3_matrix), label(Other) ms(D) msize(vsmall) mc(eltgreen) ciopts(lc(eltgreen) lwidth(vthin)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\employ_colour_`season'_coefplot", replace
graph export "graphs\employ_colour_`season'_coefplot.wmf", replace
graph export "graphs\employ_colour_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\employ_colour_`season'_coefplot.eps", replace

******************

*Black & white version
set scheme s1mono
coefplot (mat(`season'_employ1_matrix), label(Employed) ms(O) msize(vsmall) ciopts(lwidth(vthin)) offset(-0.20)) (mat(`season'_employ2_matrix), label(Retired) ms(T) msize(vsmall) mc(%40) ciopts(lc(%40) lwidth(vthin)) offset(0.00))(mat(`season'_employ3_matrix), label(Other) ms(D) msize(vsmall) mc(%60) ciopts(lc(%60) lwidth(vthin)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\employ_mono_`season'_coefplot", replace
graph export "graphs\employ_mono_`season'_coefplot.wmf", replace
graph export "graphs\employ_mono_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\employ_mono_`season'_coefplot.eps", replace


***********************************************

*Version with thicker CIs and biggerpoint estimates for powerpoint presentations
*help markersizestyle
*help linewidthstyle

*Blue & red version
coefplot (mat(`season'_employ1_matrix), label(Employed) ms(O) msize(small) mc(edkblue) ciopts(lc(edkblue) lwidth(medium)) offset(-0.20)) (mat(`season'_employ2_matrix), label(Retired) ms(T) msize(small) mc(erose) ciopts(lc(erose) lwidth(medium)) offset(0.00)) (mat(`season'_employ3_matrix), label(Other) ms(D) msize(small) mc(eltgreen) ciopts(lc(eltgreen) lwidth(medium)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)


*Save as stata graph, pdf & windows metafile
graph save "graphs\employ_presentation_colour_`season'_coefplot", replace
graph export "graphs\employ_presentation_colour_`season'_coefplot.wmf", replace
graph export "graphs\employ_presentation_colour_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\employ_presentation_colour_`season'_coefplot.eps", replace

*******************

*Black & white version
set scheme s1mono
coefplot (mat(`season'_employ1_matrix), label(Employed) ms(O) msize(small) ciopts(lwidth(medium)) offset(-0.20)) (mat(`season'_employ2_matrix), label(Retired) ms(T) msize(small) mc(%40) ciopts(lc(%40) lwidth(medium)) offset(0.00))(mat(`season'_employ3_matrix), label(Other) ms(D) msize(small) mc(%60) ciopts(lc(%60) lwidth(medium)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\employ_presentation_mono_`season'_coefplot", replace
graph export "graphs\employ_presentation_mono_`season'_coefplot.wmf", replace
graph export "graphs\employ_presentation_mono_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\employ_presentation_mono_`season'_coefplot.eps", replace

}

************************************************

*d) SLEEP DURATION

*Set working directory


foreach season in spring autumn {
*Import & clean matrices for strata of sleep duration

*Create a local macro for age files in the directory
local myfilelist : dir "." files "`season'_mat_sleepdur*.xlsx"

*Loop to open & reformat each file & save as .dta file.
foreach file of local myfilelist{
	import excel using `file', firstrow clear
	local name = subinstr("`file'",".xlsx","",.)
	local dataname = subinstr("`name'","_mat","",.)
rename `name'1 Sun_before
rename `name'2 Mon_before
rename `name'3 Tue_before
rename `name'4 Wed_before
rename `name'5 Thur_before
rename `name'6 Fri_before
rename `name'7 Sat_before
rename `name'8 Sun_change
rename `name'9 Mon_after
rename `name'10 Tue_after
rename `name'11 Wed_after
rename `name'12 Thur_after
rename `name'13 Fri_after
rename `name'14 Sat_after
rename `name'15 Sun_after
save "`dataname'.dta", replace	
}



******

*Append the 3 datasets

use `season'_sleepdur_1.dta, clear
append using `season'_sleepdur_2
append using `season'_sleepdur_3 
browse

save `season'_sleepdur_append.dta, replace

******

*Create the matrices

use `season'_sleepdur_append.dta, clear
browse

*Turn data for sleepdur1 into matrix (only keep first  rows)
preserve
keep in 1/2

mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_sleepdur1_matrix)

matrix list `season'_sleepdur1_matrix 
restore

*Turn data for sleepdur2 into matrix (only keep rows 3 and 4)
preserve
keep in 3/4

mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_sleepdur2_matrix)

matrix list `season'_sleepdur2_matrix 
restore

*Turn data for sleepdur3 into matrix (only keep rows 5 and 6)
keep in 5/6
mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_sleepdur3_matrix)

matrix list `season'_sleepdur3_matrix


*********************

*Create combined coefficient plots

*Blue & red version
coefplot (mat(`season'_sleepdur1_matrix), label(<=6 hours) ms(O) msize(vsmall) mc(edkblue) ciopts(lc(edkblue) lwidth(vthin)) offset(-0.20)) (mat(`season'_sleepdur2_matrix), label(7-8 hours) ms(T) msize(vsmall) mc(erose) ciopts(lc(erose) lwidth(vthin)) offset(0.00)) (mat(`season'_sleepdur3_matrix), label(>=9 hours) ms(D) msize(vsmall) mc(eltgreen) ciopts(lc(eltgreen) lwidth(vthin)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\sleepdur_colour_`season'_coefplot", replace
graph export "graphs\sleepdur_colour_`season'_coefplot.wmf", replace
graph export "graphs\sleepdur_colour_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\sleepdur_colour_`season'_coefplot.eps", replace

******************

*Black & white version
set scheme s1mono
coefplot (mat(`season'_sleepdur1_matrix), label(<=6 hours) ms(O) msize(vsmall) ciopts(lwidth(vthin)) offset(-0.20)) (mat(`season'_sleepdur2_matrix), label(7-8 hours) ms(T) msize(vsmall) mc(%40) ciopts(lc(%40) lwidth(vthin)) offset(0.00))(mat(`season'_sleepdur3_matrix), label(>=9 hours) ms(D) msize(vsmall) mc(%60) ciopts(lc(%60) lwidth(vthin)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\sleepdur_mono_`season'_coefplot", replace
graph export "graphs\sleepdur_mono_`season'_coefplot.wmf", replace
graph export "graphs\sleepdur_mono_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\sleepdur_mono_`season'_coefplot.eps", replace


***********************************************

*Version with thicker CIs and biggerpoint estimates for powerpoint presentations
*help markersizestyle
*help linewidthstyle

*Blue & red version
coefplot (mat(`season'_sleepdur1_matrix), label(<=6 hours) ms(O) msize(small) mc(edkblue) ciopts(lc(edkblue) lwidth(medium)) offset(-0.20)) (mat(`season'_sleepdur2_matrix), label(7-8 hours) ms(T) msize(small) mc(erose) ciopts(lc(erose) lwidth(medium)) offset(0.00)) (mat(`season'_sleepdur3_matrix), label(>=9 hours) ms(D) msize(small) mc(eltgreen) ciopts(lc(eltgreen) lwidth(medium)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)


*Save as stata graph, pdf & windows metafile
graph save "graphs\sleepdur_presentation_colour_`season'_coefplot", replace
graph export "graphs\sleepdur_presentation_colour_`season'_coefplot.wmf", replace
graph export "graphs\sleepdur_presentation_colour_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\sleepdur_presentation_colour_`season'_coefplot.eps", replace

*******************

*Black & white version
set scheme s1mono
coefplot (mat(`season'_sleepdur1_matrix), label(<=6 hours) ms(O) msize(small) ciopts(lwidth(medium)) offset(-0.20)) (mat(`season'_sleepdur2_matrix), label(7-8 hours) ms(T) msize(small) mc(%40) ciopts(lc(%40) lwidth(medium)) offset(0.00))(mat(`season'_sleepdur3_matrix), label(>=9 hours) ms(D) msize(small) mc(%60) ciopts(lc(%60) lwidth(medium)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\sleepdur_presentation_mono_`season'_coefplot", replace
graph export "graphs\sleepdur_presentation_mono_`season'_coefplot.wmf", replace
graph export "graphs\sleepdur_presentation_mono_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\sleepdur_presentation_mono_`season'_coefplot.eps", replace

}

************************************************

*e) CHRONOTYPE

*Set working directory


*Remove extra empty rows in spring chronotype excel files.
import excel using spring_mat_chrono_1.xlsx, firstrow clear
browse
keep in 1/2
export excel using spring_mat_chrono_1.xlsx, firstrow(varlabels) replace

import excel using spring_mat_chrono_2.xlsx, firstrow clear
browse
keep in 1/2
export excel using spring_mat_chrono_2.xlsx, firstrow(varlabels) replace

import excel using spring_mat_chrono_3.xlsx, firstrow clear
browse
keep in 1/2
export excel using spring_mat_chrono_3.xlsx, firstrow(varlabels) replace


foreach season in spring autumn {

*Import & clean matrices for strata of chronotype

*Create a local macro for chrono files in the directory
local myfilelist : dir "." files "`season'_mat_chrono*.xlsx"

*Loop to open & reformat each file & save as .dta file.
foreach file of local myfilelist{
	import excel using `file', firstrow clear
	local name = subinstr("`file'",".xlsx","",.)
	local dataname = subinstr("`name'","_mat","",.)
rename `name'1 Sun_before
rename `name'2 Mon_before
rename `name'3 Tue_before
rename `name'4 Wed_before
rename `name'5 Thur_before
rename `name'6 Fri_before
rename `name'7 Sat_before
rename `name'8 Sun_change
rename `name'9 Mon_after
rename `name'10 Tue_after
rename `name'11 Wed_after
rename `name'12 Thur_after
rename `name'13 Fri_after
rename `name'14 Sat_after
rename `name'15 Sun_after
save "`dataname'.dta", replace	
}



******

*Append the 3 datasets

use `season'_chrono_1.dta, clear
append using `season'_chrono_2
append using `season'_chrono_3
browse

save `season'_chrono_append.dta, replace

******

*Create the matrices

use `season'_chrono_append.dta, clear
browse

*Turn data for chrono1 into matrix (only keep first  rows)
preserve
keep in 1/2

mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_chrono1_matrix)

matrix list `season'_chrono1_matrix 
restore

*Turn data for chrono2 into matrix (only keep rows 3 and 4)
preserve
keep in 3/4

mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_chrono2_matrix)

matrix list `season'_chrono2_matrix 
restore

*Turn data for chrono3 into matrix (only keep rows 5 and 6)
keep in 5/6
mkmat Sun_before Mon_before Tue_before Wed_before Thur_before Fri_before Sat_before Sun_change Mon_after Tue_after Wed_after Thur_after Fri_after Sat_after Sun_after, matrix(`season'_chrono3_matrix)
matrix list `season'_chrono3_matrix

*********************

*Create combined coefficient plots

*Blue & red version
coefplot (mat(`season'_chrono1_matrix), label(Morning) ms(O) msize(vsmall) mc(edkblue) ciopts(lc(edkblue) lwidth(vthin)) offset(-0.20)) (mat(`season'_chrono2_matrix), label(No preference) ms(T) msize(vsmall) mc(erose) ciopts(lc(erose) lwidth(vthin)) offset(0.00)) (mat(`season'_chrono3_matrix), label(Evening) ms(D) msize(vsmall) mc(eltgreen) ciopts(lc(eltgreen) lwidth(vthin)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\chrono_colour_`season'_coefplot", replace
graph export "graphs\chrono_colour_`season'_coefplot.wmf", replace
graph export "graphs\chrono_colour_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\chrono_colour_`season'_coefplot.eps", replace

******************

*Black & white version
set scheme s1mono
coefplot (mat(`season'_chrono1_matrix), label(Morning) ms(O) msize(vsmall) ciopts(lwidth(vthin)) offset(-0.20)) (mat(`season'_chrono2_matrix), label(No preference) ms(T) msize(vsmall) mc(%40) ciopts(lc(%40) lwidth(vthin)) offset(0.00))(mat(`season'_chrono3_matrix), label(Evening) ms(D) msize(vsmall) mc(%60) ciopts(lc(%60) lwidth(vthin)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\chrono_mono_`season'_coefplot", replace
graph export "graphs\chrono_mono_`season'_coefplot.wmf", replace
graph export "graphs\chrono_mono_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\chrono_mono_`season'_coefplot.eps", replace


***********************************************

*Version with thicker CIs and biggerpoint estimates for powerpoint presentations
*help markersizestyle
*help linewidthstyle

*Blue & red version
coefplot (mat(`season'_chrono1_matrix), label(Morning) ms(O) msize(small) mc(edkblue) ciopts(lc(edkblue) lwidth(medium)) offset(-0.20)) (mat(`season'_chrono2_matrix), label(No preference) ms(T) msize(small) mc(erose) ciopts(lc(erose) lwidth(medium)) offset(0.00)) (mat(`season'_chrono3_matrix), label(Evening) ms(D) msize(small) mc(eltgreen) ciopts(lc(eltgreen) lwidth(medium)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)


*Save as stata graph, pdf & windows metafile
graph save "graphs\chrono_presentation_colour_`season'_coefplot", replace
graph export "graphs\chrono_presentation_colour_`season'_coefplot.wmf", replace
graph export "graphs\chrono_presentation_colour_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\chrono_presentation_colour_`season'_coefplot.eps", replace

*******************

*Black & white version
set scheme s1mono
coefplot (mat(`season'_chrono1_matrix), label(Morning) ms(O) msize(small) ciopts(lwidth(medium)) offset(-0.20)) (mat(`season'_chrono2_matrix), label(No preference) ms(T) msize(small) mc(%40) ciopts(lc(%40) lwidth(medium)) offset(0.00))(mat(`season'_chrono3_matrix), label(Evening) ms(D) msize(small) mc(%60) ciopts(lc(%60) lwidth(medium)) offset(0.20)), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)

*Save as stata graph, pdf & windows metafile
graph save "graphs\chrono_presentation_mono_`season'_coefplot", replace
graph export "graphs\chrono_presentation_mono_`season'_coefplot.wmf", replace
graph export "graphs\chrono_presentation_mono_`season'_coefplot.pdf", as(pdf) replace 
graph export "graphs\chrono_presentation_mono_`season'_coefplot.eps", replace

}
************************************************************************************************************************************************************************************
******************************************************************************************
