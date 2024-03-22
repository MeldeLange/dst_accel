*Convert sleep proportion to sleep duration & create table S1
**************************************************************************************

*Open doherty dataset
set more off
use /mnt/project/accel7.dta, clear

*1. Generate variables for sleep duration in minutes
***********************************************************************************************************

*Monday - Saturday (24 hours in day = 1440 minutes)
gen sleep_dur_mon = sleep_prop_mon*1440

gen sleep_dur_tue = sleep_prop_tue*1440

gen sleep_dur_wed = sleep_prop_wed*1440

gen sleep_dur_thur = sleep_prop_thur*1440
 
gen sleep_dur_fri = sleep_prop_fri*1440

gen sleep_dur_sat = sleep_prop_sat*1440

*Generate variable for sleep duration in minutes for Sunday of the clock change in Spring (sleep proportion is already adjusted to be for 23 hours = 1380 minutes)
gen sleep_dur_sun=.
replace sleep_dur_sun= sleep_prop_sun_adj*1380 if season =="Spring"


*Generate variables for sleep duration in minutes for Sunday of the clock change in Autumn (sleep proportion is already adjusted to be for 25 hours = 1500 minutes)
replace sleep_dur_sun= sleep_prop_sun_adj*1500 if season =="Autumn"

*Save & upload
save accel8.dta, replace
!dx upload accel8.dta


**********************************************************************************

*2. Create sleep duration variables named as to whether day of week is before or after the clock change.

*Create variable for start day
gen start_day = . // 
replace start_day =xx if clock_change - date_start_wear == 13 // Starting wear 2 Mon before:
replace start_day =xx if clock_change - date_start_wear == 12 // Starting wear 2 Tues before:
replace start_day =xx if clock_change - date_start_wear == 11 // Starting wear 2 Wed before:
replace start_day =xx if clock_change - date_start_wear == 10 // Starting wear 2 Thur before:
replace start_day =xx if clock_change - date_start_wear == 9 // Starting wear 2 Fri before:
replace start_day =xx if clock_change - date_start_wear == 8 // Starting wear 2 Sat before: 996
replace start_day =xx if clock_change - date_start_wear == 6 // Starting wear Mon before: 1073
replace start_day =xx if clock_change - date_start_wear == 4 // Starting wear Wed before: 536
replace start_day =xx if clock_change - date_start_wear == 3 // Starting wear Thurs before: 820
replace start_day =10 if clock_change - date_start_wear == 2 // Starting wear Fri before: 701
replace start_day =11 if clock_change - date_start_wear == 1 // Starting wear Sat before: 1073
replace start_day =12 if clock_change - date_start_wear == -1 // Starting wear Mon after: 869
replace start_day =13 if clock_change - date_start_wear == -3 // Starting wear Wed after: 669
replace start_day =14 if clock_change - date_start_wear == -4 // Starting wear Thurs after: 764 
replace start_day =15 if clock_change - date_start_wear == -5 // Starting wear Fri after: 468
replace start_day =16 if clock_change - date_start_wear == -6 // Starting wear Sat after: 745


*Create sleep dur by day in our study period
gen sleep_dur_sun_before = .
gen sleep_dur_mon_before  = .
gen sleep_dur_tue_before = .
gen sleep_dur_wed_before = .
gen sleep_dur_thur_before = .
gen sleep_dur_fri_before = .
gen sleep_dur_sat_before = .
gen sleep_dur_sun_change = .
gen sleep_dur_mon_after = .
gen sleep_dur_tue_after = .
gen sleep_dur_wed_after = .
gen sleep_dur_thur_after = .
gen sleep_dur_fri_after = .
gen sleep_dur_sat_after = .
gen sleep_dur_sun_after = .


replace sleep_dur_sun_before = sleep_dur_sun if start_day == 1
replace sleep_dur_mon_before = sleep_dur_mon if start_day == 1
replace sleep_dur_tue_before = sleep_dur_tue if start_day == 1
replace sleep_dur_tue_before = sleep_dur_tue if start_day == 2
replace sleep_dur_wed_before = sleep_dur_wed if start_day == 1
replace sleep_dur_wed_before = sleep_dur_wed if start_day == 2
replace sleep_dur_thur_before = sleep_dur_thur if start_day == 1
replace sleep_dur_thur_before = sleep_dur_thur if start_day == 2
replace sleep_dur_thur_before = sleep_dur_thur if start_day == 3
replace sleep_dur_fri_before = sleep_dur_fri if start_day == 1
replace sleep_dur_fri_before = sleep_dur_fri if start_day == 2
replace sleep_dur_fri_before = sleep_dur_fri if start_day == 3
replace sleep_dur_fri_before = sleep_dur_fri if start_day == 4
replace sleep_dur_sat_before = sleep_dur_sat if start_day == 2
replace sleep_dur_sat_before = sleep_dur_sat if start_day == 3
replace sleep_dur_sat_before = sleep_dur_sat if start_day == 4
replace sleep_dur_sat_before = sleep_dur_sat if start_day == 5
replace sleep_dur_sun_change = sleep_dur_sun if start_day == 2
replace sleep_dur_sun_change = sleep_dur_sun if start_day == 3
replace sleep_dur_sun_change = sleep_dur_sun if start_day == 4
replace sleep_dur_sun_change = sleep_dur_sun if start_day == 5
replace sleep_dur_sun_change = sleep_dur_sun if start_day == 6
replace sleep_dur_mon_after = sleep_dur_mon if start_day == 3
replace sleep_dur_mon_after = sleep_dur_mon if start_day == 4
replace sleep_dur_mon_after = sleep_dur_mon if start_day == 5
replace sleep_dur_mon_after = sleep_dur_mon if start_day == 6
replace sleep_dur_tue_after = sleep_dur_tue if start_day == 3
replace sleep_dur_tue_after = sleep_dur_tue if start_day == 4
replace sleep_dur_tue_after = sleep_dur_tue if start_day == 5
replace sleep_dur_tue_after = sleep_dur_tue if start_day == 6
replace sleep_dur_tue_after = sleep_dur_tue if start_day == 7
replace sleep_dur_wed_after = sleep_dur_wed if start_day == 4
replace sleep_dur_wed_after = sleep_dur_wed if start_day == 5
replace sleep_dur_wed_after = sleep_dur_wed if start_day == 6
replace sleep_dur_wed_after = sleep_dur_wed if start_day == 7
replace sleep_dur_thur_after = sleep_dur_thur if start_day == 5
replace sleep_dur_thur_after = sleep_dur_thur if start_day == 6
replace sleep_dur_thur_after = sleep_dur_thur if start_day == 7
replace sleep_dur_thur_after = sleep_dur_thur if start_day == 8
replace sleep_dur_fri_after = sleep_dur_fri if start_day == 6
replace sleep_dur_fri_after = sleep_dur_fri if start_day == 7
replace sleep_dur_fri_after = sleep_dur_fri if start_day == 8
replace sleep_dur_fri_after = sleep_dur_fri if start_day == 9
replace sleep_dur_sat_after = sleep_dur_sat if start_day == 7
replace sleep_dur_sat_after = sleep_dur_sat if start_day == 8
replace sleep_dur_sat_after = sleep_dur_sat if start_day == 9
replace sleep_dur_sat_after = sleep_dur_sat if start_day == 10
replace sleep_dur_sun_after = sleep_dur_sun if start_day == 7
replace sleep_dur_sun_after = sleep_dur_sun if start_day == 8
replace sleep_dur_sun_after = sleep_dur_sun if start_day == 9
replace sleep_dur_sun_after = sleep_dur_sun if start_day == 10
replace sleep_dur_sun_after = sleep_dur_sun if start_day == 11

*Save & upload
save accel9.dta, replace
!dx upload accel9.dta


***************************************
*3. Create table S1

*Spring
tab start_day if season =="Spring"

*  start_day |      Freq.     Percent        Cum.
*------------+-----------------------------------
*          1 |        406       12.73       12.73
*          2 |        379       11.88       24.61
*          3 |        103        3.23       27.84
*          4 |        168        5.27       33.10
*          5 |        352       11.03       44.14
*          6 |        513       16.08       60.22
*          7 |        467       14.64       74.86
*          8 |        193        6.05       80.91
*          9 |        262        8.21       89.12
*         10 |        119        3.73       92.85
*         11 |        228        7.15      100.00
*------------+-----------------------------------
*      Total |      3,190      100.00


sum sleep_dur_sun_before if season =="Spring" // Obs: 406. Mean: 512.1754
sum sleep_dur_mon_before if season =="Spring" // Obs: 406. Mean: 517.9389 
sum sleep_dur_tue_before if season =="Spring" // Obs: 785. Mean: 514.0341 
sum  sleep_dur_wed_before if season =="Spring" // Obs: 785. Mean: 508.3659
sum  sleep_dur_thur_before if season =="Spring" // Obs: 888. Mean: 516.6162
sum  sleep_dur_fri_before if season =="Spring" // Obs: 1,056. Mean: 514.7727
sum  sleep_dur_sat_before if season =="Spring" // Obs: 1,002. Mean: 554.6299 
sum  sleep_dur_sun_change if season =="Spring" // Obs:  1,515. Mean: 499.4162
sum  sleep_dur_mon_after if season =="Spring" // Obs: 1,136. Mean: 524.7254  
sum  sleep_dur_tue_after if season =="Spring" // Obs: 1,603. Mean: 521.7687
sum  sleep_dur_wed_after if season =="Spring" // Obs: 1,500. Mean: 520.0896
sum  sleep_dur_thur_after if season =="Spring" // Obs: 1,525. Mean: 516.7381
sum  sleep_dur_fri_after if season =="Spring" // Obs: 1,435. Mean: 533.7834
sum  sleep_dur_sat_after if season =="Spring" // Obs: 1,041. Mean: 544.1706
sum  sleep_dur_sun_after if season =="Spring" // Obs: 1,269. Mean: 506.556 


*Autumn
tab start_day if season =="Autumn"

*start_day |      Freq.     Percent        Cum.
*------------+-----------------------------------
*          1 |        590       10.68       10.68
*          2 |        694       12.56       23.24
*          3 |        433        7.84       31.08
*          4 |        652       11.80       42.89
*          5 |        349        6.32       49.20
*          6 |        560       10.14       59.34
*          7 |        402        7.28       66.62
*          8 |        476        8.62       75.24
*          9 |        502        9.09       84.32
*         10 |        349        6.32       90.64
*         11 |        517        9.36      100.00
*------------+-----------------------------------
*      Total |      5,524      100.00


sum sleep_dur_sun_before if season =="Autumn" // obs: 590. mean: 623.5078.
sum sleep_dur_mon_before if season =="Autumn" // obs: 590. mean: 523.5986.
sum sleep_dur_tue_before if season =="Autumn" // obs: 1,284. mean: 522.9421.
sum sleep_dur_wed_before if season =="Autumn" // obs: 1,284. mean: 521.0131.
sum sleep_dur_thur_before if season =="Autumn" // obs: 1,717. mean: 518.5929.
sum sleep_dur_fri_before if season =="Autumn" // obs: 2,369. mean: 521.7553.
sum sleep_dur_sat_before if season =="Autumn" // obs: 2,128. mean: 541.0692.
sum sleep_dur_sun_change if season =="Autumn" // obs: 2,688. mean: 602.8179.
sum sleep_dur_mon_after if season =="Autumn" // obs: 1,994. mean: 525.8889.
sum sleep_dur_tue_after if season =="Autumn" // obs:  2,396. mean: 527.0184 .
sum sleep_dur_wed_after if season =="Autumn" // obs: 1,963. mean: 523.1609.
sum sleep_dur_thur_after if season =="Autumn" // obs: 1,787. mean: 523.4606.
sum sleep_dur_fri_after if season =="Autumn" // obs: 1,940. mean: 525.1398.
sum sleep_dur_sat_after if season =="Autumn" // obs: 1,729. mean: 538.7882.
sum sleep_dur_sun_after if season =="Autumn" // obs: 2,246. mean: 619.3122.