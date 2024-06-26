*Create coefficient plots of mean sleep duration by day (in hours)
*******************************************************************

*Convert sleep duration by day from minutes to hours.

*Reopen doherty dataset
set more off
use /mnt/project/accel9.dta, clear

gen hours_sun_before = sleep_dur_sun_before / 60
gen hours_mon_before = sleep_dur_mon_before / 60
gen hours_tue_before = sleep_dur_tue_before / 60
gen hours_wed_before = sleep_dur_wed_before / 60
gen hours_thur_before = sleep_dur_thur_before / 60
gen hours_fri_before = sleep_dur_fri_before / 60
gen hours_sat_before = sleep_dur_sat_before / 60
gen hours_sun_change = sleep_dur_sun_change / 60
gen hours_mon_after = sleep_dur_mon_after / 60
gen hours_tue_after = sleep_dur_tue_after / 60
gen hours_wed_after = sleep_dur_wed_after / 60
gen hours_thur_after = sleep_dur_thur_after / 60
gen hours_fri_after = sleep_dur_fri_after / 60
gen hours_sat_after = sleep_dur_sat_after / 60
gen hours_sun_after = sleep_dur_sun_after / 60


list hours_sun_before sleep_dur_sun_before in 1/2
list hours_sun_after sleep_dur_sun_after in 1/2

*Save & upload
save accel10.dta, replace
!dx upload accel10.dta

************************************************************

*2.Create matrices for Spring & Autumn
***************************************
*a) Spring

keep if season =="Spring"

*Generate mean & se of each sleep duration day variable.
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 


return list

*Name matrix
matrix spring_mat = r(StatTotal)	  
matrix list spring_mat

	
*Save matrix
svmat spring_mat

*Just keep matrix variables
keep spring_mat*
list in 1/5

*Drop empty observation rows
drop if spring_mat1 ==. 
describe // 2 obs. 15 vars.
list 

*Save as stata & excel file
save "spring_mat.dta", replace
!dx upload spring_mat.dta

export excel spring_mat.xlsx, firstrow(varlabels) replace
!dx upload spring_mat.xlsx

 *b) Autumn
 
 *Reopen doherty dataset
set more off
use /mnt/project/accel10.dta, clear

keep if season =="Autumn"

*Generate mean & se of each sleep duration day variable.
tabstat hours_sun_before hours_mon_before hours_tue_before hours_wed_before hours_thur_before hours_fri_before hours_sat_before hours_sun_change hours_mon_after hours_tue_after hours_wed_after hours_thur_after hours_fri_after hours_sat_after hours_sun_after, stats(mean sem) save 


return list

*Name matrix
matrix autumn_mat = r(StatTotal)	  
matrix list autumn_mat

	
*Save matrix
svmat autumn_mat

*Just keep matrix variables
keep autumn_mat*
list in 1/5

*Drop empty observation rows
drop if autumn_mat1 ==. 
describe // 2 obs. 15 vars.
list 

*Save as stata & excel file
save "autumn_mat.dta", replace
!dx upload autumn_mat.dta

export excel autumn_mat.xlsx, firstrow(varlabels) replace
!dx upload autumn_mat.xlsx

 
*****************************************************************************

*3. Create coefficient plots
*****************************

*[Download spring_mat.xlsx manually from DNA Nexus project]

**In stata on desktop**

*Set working directory


*a) Spring

import excel "spring_mat.xlsx", firstrow clear


*Turn dataset into a matrix
mkmat spring_mat1 spring_mat2 spring_mat3 spring_mat4 spring_mat5 spring_mat6 spring_mat7 spring_mat8 spring_mat9 spring_mat10 spring_mat11 spring_mat12 spring_mat13 spring_mat14 spring_mat15, matrix(spring_mat)

matrix list spring_mat

*Create coeffplot
	*Install coefficient plot package
ssc install coefplot
*Create coefplot
coefplot mat(spring_mat), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)


*Save as stata graph, pdf & windows metafile
graph save "spring_coefplot", replace
graph export "spring_coefplot.wmf", replace
graph export "spring_coefplot.pdf", as(pdf) replace 
graph export "spring_coefplot.eps", replace


*b) Autumn
*[Download autumn_mat.xlsx manually from DNA Nexus project]

**In stata on desktop**

*Set working directory


import excel "autumn_mat.xlsx", firstrow clear


*Turn dataset into a matrix
mkmat autumn_mat1 autumn_mat2 autumn_mat3 autumn_mat4 autumn_mat5 autumn_mat6 autumn_mat7 autumn_mat8 autumn_mat9 autumn_mat10 autumn_mat11 autumn_mat12 autumn_mat13 autumn_mat14 autumn_mat15, matrix(autumn_mat)

matrix list autumn_mat

*Create coefplot
coefplot mat(autumn_mat), se(2) vertical xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" 8 "Sun" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) graphregion(color(white)) plotregion(lc(white)) ylabel(, nogrid)



*Save as stata graph, pdf & windows metafile
graph save "autumn_coefplot", replace
graph export "autumn_coefplot.wmf", replace
graph export "autumn_coefplot.pdf", as(pdf) replace 
graph export "autumn_coefplot.eps", replace


****************************************************************

*4. Coefplots with clock change Sunday highlighted

**In stata on desktop**

*Set working directory


*a) Spring
mat X= [9.4047728, 8.6879301, 8.5973768, 8.5092888, 8.6280518, 8.5795450, 9.2438326, 8.3236036, 8.7454224, 8.6961451, 8.6681604, 8.6123018, 8.8963900, 9.0695105, 9.3426008 \ 0.0413847, 0.0459214, 0.0388625, 0.0413338, 0.0475106, 0.0516914, 0.0604865, 0.0464254, 0.0498264, 0.0401147, 0.0431181, 0.0414889, 0.0469337, 0.0509452, 0.0472376]

matrix list X


mat Xh= J(rowsof(X), colsof(X), .z)
mat Xh[1,8]= X[1,8]
mat Xh[2,8]= X[2,8]
mat X[1,8]= .z
mat X[2,8]= .z


coefplot (mat(X), se(2) color(gray) ciopts(lc(gray)))  \ ///
(mat(Xh),  offset(0) se(2) msymbol(S) color(black) ciopts(lc(black))), ///
vert nokey xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) ylabel(, nogrid) nokey ///
xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" ///
8 "{bf:Sun*}" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") ///
note(*Sunday of clock changes)

*Save as stata graph, pdf & windows metafile
graph save "spring_clock_coefplot", replace
graph export "spring_clock_coefplot.wmf", replace
graph export "spring_clock_coefplot.pdf", as(pdf) replace 
graph export "spring_clock_coefplot.eps", replace


*b) Autumn
clear matrix
mat X= [9.4903822, 8.7285852, 8.7149582, 8.6966839, 8.6700277, 8.6959219, 9.0178194, 10.0469646, 8.7648144, 8.7836390, 8.7193480, 8.7243423, 8.7523298, 8.9798031, 9.4218702 \ 0.0371699, 0.0407324, 0.0350937, 0.0359445, 0.0359799, 0.0343243, 0.0384910, 0.0343172, 0.0365113, 0.0333091, 0.0381684, 0.0385606, 0.0384786, 0.0414793, 0.0374347]

matrix list X


mat Xh= J(rowsof(X), colsof(X), .z)
mat Xh[1,8]= X[1,8]
mat Xh[2,8]= X[2,8]
mat X[1,8]= .z
mat X[2,8]= .z


coefplot (mat(X), se(2) color(gray) ciopts(lc(gray)))  \ ///
(mat(Xh),  offset(0) se(2) msymbol(S) color(black) ciopts(lc(black))), ///
vert nokey xtitle("Day", height(5)) ytitle("Mean sleep duration (hours) +/-SEM", height(5)) ylabel(, nogrid) nokey ///
xlab(1 "Sun" 2 "Mon" 3 "Tue" 4 "Wed" 5 "Thur" 6 "Fri" 7 "Sat" ///
8 "{bf:Sun*}" 9 "Mon" 10 "Tue" 11 "Wed" 12 "Thur" 13 "Fri" 14 "Sat" 15 "Sun") ///
note(*Sunday of clock changes)

*Save as stata graph, pdf & windows metafile
graph save "autumn_clock_coefplot", replace
graph export "autumn_clock_coefplot.wmf", replace
graph export "autumn_clock_coefplot.pdf", as(pdf) replace 
graph export "autumn_clock_coefplot.eps", replace
