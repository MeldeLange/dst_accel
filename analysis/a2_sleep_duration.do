*Convert sleep proportion to sleep duration & create table S1
**************************************************************************************

*Open doherty dataset
set more off
use /mnt/project/accel7.dta, clear

*1. Generate variables for sleep duration in minutes
***********************************************************************************************************

*Monday - Sunday (24 hours in day = 1440 minutes)
gen sleep_dur_mon = sleep_prop_mon*1440

gen sleep_dur_tue = sleep_prop_tue*1440

gen sleep_dur_wed = sleep_prop_wed*1440

gen sleep_dur_thur = sleep_prop_thur*1440
 
gen sleep_dur_fri = sleep_prop_fri*1440

gen sleep_dur_sat = sleep_prop_sat*1440

gen sleep_dur_sun = sleep_prop_sun*1440 // this is fine for the normal Sundays but the clock change Sundays need further cleaning using the variable sleep_prop_sun_adj (see below). 



*Create variable for start day
gen start_day = . // 11780
replace start_day =1 if clock_change - date_start_wear == 13 // Starting wear 2 Mon before: 835
replace start_day =2 if clock_change - date_start_wear == 11 // Starting wear 2 Wed before: 665
replace start_day =3 if clock_change - date_start_wear == 10 // Starting wear 2 Thur before: 632
replace start_day =4 if clock_change - date_start_wear == 9 // Starting wear 2 Fri before: 934
replace start_day =5 if clock_change - date_start_wear == 8 // Starting wear 2 Sat before: 996
replace start_day =6 if clock_change - date_start_wear == 6 // Starting wear Mon before: 1073
replace start_day =7 if clock_change - date_start_wear == 4 // Starting wear Wed before: 536
replace start_day =8 if clock_change - date_start_wear == 3 // Starting wear Thurs before: 820
replace start_day =9 if clock_change - date_start_wear == 2 // Starting wear Fri before: 701
replace start_day =10 if clock_change - date_start_wear == 1 // Starting wear Sat before: 1073
replace start_day =11 if clock_change - date_start_wear == -1 // Starting wear Mon after: 869
replace start_day =12 if clock_change - date_start_wear == -3 // Starting wear Wed after: 669
replace start_day =13 if clock_change - date_start_wear == -4 // Starting wear Thurs after: 764 
replace start_day =14 if clock_change - date_start_wear == -5 // Starting wear Fri after: 468
replace start_day =15 if clock_change - date_start_wear == -6 // Starting wear Sat after: 745



******
*Create variables for the adjusted Sundays in minutes for Spring (sleep_prop_1380) & Autumn (sleep_prop_1500)
gen sleep_prop_1380 = sleep_prop_sun_adj*1380
gen sleep_prop_1500 = sleep_prop_sun_adj*1500

*Update sleep duration in minutes for Sunday of the clock change in Spring (sleep proportion adjusted variable is already adjusted to be for 23 hours = 1380 minutes)
*People with start days 6-10 have data for the Sunday of the clock change.
replace sleep_dur_sun = sleep_prop_1380 if season =="Spring" & start_day==6 // 379 changes
replace sleep_dur_sun = sleep_prop_1380 if season =="Spring" & start_day==7 // 103 changes
replace sleep_dur_sun = sleep_prop_1380 if season =="Spring" & start_day==8 // 168 changes
replace sleep_dur_sun = sleep_prop_1380 if season =="Spring" & start_day==9 // 352 changes
replace sleep_dur_sun = sleep_prop_1380 if season =="Spring" & start_day==10 // 513 changes
*1515 changes in total = n for Sunday clock change day in Spring.

*Generate variables for sleep duration in minutes for Sunday of the clock change in Autumn (sleep proportion adjusted variable is already adjusted to be for 25 hours = 1500 minutes)
replace sleep_dur_sun = sleep_prop_1500 if season =="Autumn" & start_day==6 // 694 changes
replace sleep_dur_sun = sleep_prop_1500 if season =="Autumn" & start_day==7 // 433 changes
replace sleep_dur_sun = sleep_prop_1500 if season =="Autumn" & start_day==8 // 652 changes
replace sleep_dur_sun = sleep_prop_1500 if season =="Autumn" & start_day==9 // 349 changes
replace sleep_dur_sun = sleep_prop_1500 if season =="Autumn" & start_day==10 // 560 changes
*2688 changes = n for Sunday clock change day in Autumn.


*Save & upload
save accel8.dta, replace
!dx upload accel8.dta


**********************************************************************************

*2. Create sleep duration variables named as to whether day of week is before or after the clock change.


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
replace sleep_dur_sun_before = sleep_dur_sun if start_day == 2
replace sleep_dur_sun_before = sleep_dur_sun if start_day == 3
replace sleep_dur_sun_before = sleep_dur_sun if start_day == 4
replace sleep_dur_sun_before = sleep_dur_sun if start_day == 5


replace sleep_dur_mon_before = sleep_dur_mon if start_day == 2
replace sleep_dur_mon_before = sleep_dur_mon if start_day == 3
replace sleep_dur_mon_before = sleep_dur_mon if start_day == 4
replace sleep_dur_mon_before = sleep_dur_mon if start_day == 5


replace sleep_dur_tue_before = sleep_dur_tue if start_day == 2
replace sleep_dur_tue_before = sleep_dur_tue if start_day == 3
replace sleep_dur_tue_before = sleep_dur_tue if start_day == 4
replace sleep_dur_tue_before = sleep_dur_tue if start_day == 5
replace sleep_dur_tue_before = sleep_dur_tue if start_day == 6


replace sleep_dur_wed_before = sleep_dur_wed if start_day == 3
replace sleep_dur_wed_before = sleep_dur_wed if start_day == 4
replace sleep_dur_wed_before = sleep_dur_wed if start_day == 5
replace sleep_dur_wed_before = sleep_dur_wed if start_day == 6


replace sleep_dur_thur_before = sleep_dur_thur if start_day == 4
replace sleep_dur_thur_before = sleep_dur_thur if start_day == 5
replace sleep_dur_thur_before = sleep_dur_thur if start_day == 6
replace sleep_dur_thur_before = sleep_dur_thur if start_day == 7


replace sleep_dur_fri_before = sleep_dur_fri if start_day == 5
replace sleep_dur_fri_before = sleep_dur_fri if start_day == 6
replace sleep_dur_fri_before = sleep_dur_fri if start_day == 7
replace sleep_dur_fri_before = sleep_dur_fri if start_day == 8


replace sleep_dur_sat_before = sleep_dur_sat if start_day == 6
replace sleep_dur_sat_before = sleep_dur_sat if start_day == 7
replace sleep_dur_sat_before = sleep_dur_sat if start_day == 8
replace sleep_dur_sat_before = sleep_dur_sat if start_day == 9


replace sleep_dur_sun_change = sleep_dur_sun if start_day == 6
replace sleep_dur_sun_change = sleep_dur_sun if start_day == 7
replace sleep_dur_sun_change = sleep_dur_sun if start_day == 8
replace sleep_dur_sun_change = sleep_dur_sun if start_day == 9
replace sleep_dur_sun_change = sleep_dur_sun if start_day == 10


replace sleep_dur_mon_after = sleep_dur_mon if start_day == 7
replace sleep_dur_mon_after = sleep_dur_mon if start_day == 8
replace sleep_dur_mon_after = sleep_dur_mon if start_day == 9
replace sleep_dur_mon_after = sleep_dur_mon if start_day == 10


replace sleep_dur_tue_after = sleep_dur_tue if start_day == 7
replace sleep_dur_tue_after = sleep_dur_tue if start_day == 8
replace sleep_dur_tue_after = sleep_dur_tue if start_day == 9
replace sleep_dur_tue_after = sleep_dur_tue if start_day == 10
replace sleep_dur_tue_after = sleep_dur_tue if start_day == 11


replace sleep_dur_wed_after = sleep_dur_wed if start_day == 8
replace sleep_dur_wed_after = sleep_dur_wed if start_day == 9
replace sleep_dur_wed_after = sleep_dur_wed if start_day == 10
replace sleep_dur_wed_after = sleep_dur_wed if start_day == 11


replace sleep_dur_thur_after = sleep_dur_thur if start_day == 9
replace sleep_dur_thur_after = sleep_dur_thur if start_day == 10
replace sleep_dur_thur_after = sleep_dur_thur if start_day == 11
replace sleep_dur_thur_after = sleep_dur_thur if start_day == 12

replace sleep_dur_fri_after = sleep_dur_fri if start_day == 10
replace sleep_dur_fri_after = sleep_dur_fri if start_day == 11
replace sleep_dur_fri_after = sleep_dur_fri if start_day == 12
replace sleep_dur_fri_after = sleep_dur_fri if start_day == 13


replace sleep_dur_sat_after = sleep_dur_sat if start_day == 11
replace sleep_dur_sat_after = sleep_dur_sat if start_day == 12
replace sleep_dur_sat_after = sleep_dur_sat if start_day == 13
replace sleep_dur_sat_after = sleep_dur_sat if start_day == 14

replace sleep_dur_sun_after = sleep_dur_sun if start_day == 11
replace sleep_dur_sun_after = sleep_dur_sun if start_day == 12
replace sleep_dur_sun_after = sleep_dur_sun if start_day == 13
replace sleep_dur_sun_after = sleep_dur_sun if start_day == 14
replace sleep_dur_sun_after = sleep_dur_sun if start_day == 15


*Save & upload
save accel9.dta, replace
!dx upload accel9.dta


***************************************
*3. Create table S1

*Spring
tab start_day if season =="Spring"

* start_day |      Freq.     Percent        Cum.
*------------+-----------------------------------
*          1 |        403        8.82        8.82
*          2 |        243        5.32       14.14
*          3 |        240        5.25       19.39
*          4 |        493       10.79       30.18
*          5 |        406        8.89       39.07
*          6 |        379        8.30       47.36
*          7 |        103        2.25       49.62
*          8 |        168        3.68       53.29
*          9 |        352        7.70       61.00
*         10 |        513       11.23       72.23
*         11 |        467       10.22       82.45
*         12 |        193        4.22       86.67
*         13 |        262        5.73       92.41
*         14 |        119        2.60       95.01
*         15 |        228        4.99      100.00
*------------+-----------------------------------
*      Total |      4,569      100.00



sum sleep_dur_sun_before if season =="Spring" // obs: 1,785 Mean:  564.2864
sum sleep_dur_mon_before if season =="Spring" // obs: 1,382 Mean:   521.2758
sum sleep_dur_tue_before if season =="Spring" //   1,761 Mean:  515.8426 
sum  sleep_dur_wed_before if season =="Spring" //  1,518 Mean:  510.5573  
sum  sleep_dur_thur_before if season =="Spring" //  1,381 Mean: 517.6831   
sum  sleep_dur_fri_before if season =="Spring" // 1,056 Mean: 514.7727   
sum  sleep_dur_sat_before if season =="Spring" // 1,002 Mean: 554.6299   
sum  sleep_dur_sun_change if season =="Spring" // 1,515 Mean: 499.4162   
sum  sleep_dur_mon_after if season =="Spring" //   1,136 Mean:  524.7254  
sum  sleep_dur_tue_after if season =="Spring" //  1,603 Mean: 521.7687   
sum  sleep_dur_wed_after if season =="Spring" // 1,500 Mean: 520.0896   
sum  sleep_dur_thur_after if season =="Spring" // 1,525 Mean:516.7381   
sum  sleep_dur_fri_after if season =="Spring" //  1,435 Mean: 533.7834   
sum  sleep_dur_sat_after if season =="Spring" // 1,041  Mean: 544.1706   
sum  sleep_dur_sun_after if season =="Spring" //  1,269  Mean: 560.556  

*Sleep duration on Sun of clock change is 65 mins less than Sunday before.
*Sleep duration on Sun of clock change is 61 mins less than the Sunday after.

*Autumn
tab start_day if season =="Autumn"

*  start_day |      Freq.     Percent        Cum.
* ------------+-----------------------------------
*           1 |        432        5.99        5.99
*           2 |        422        5.85       11.84
*           3 |        392        5.44       17.28
*           4 |        441        6.12       23.39
*           5 |        590        8.18       31.58
*           6 |        694        9.62       41.20
*           7 |        433        6.00       47.21
*           8 |        652        9.04       56.25
*           9 |        349        4.84       61.09
*          10 |        560        7.77       68.85
*          11 |        402        5.57       74.43
*          12 |        476        6.60       81.03
*          13 |        502        6.96       87.99
*          14 |        349        4.84       92.83
*          15 |        517        7.17      100.00
* ------------+-----------------------------------
*       Total |      7,211      100.00



sum sleep_dur_sun_before if season =="Autumn" // 2,277    569.4299
sum sleep_dur_mon_before if season =="Autumn" //  1,845    523.7151 
sum sleep_dur_tue_before if season =="Autumn" // 2,539    522.8975
sum sleep_dur_wed_before if season =="Autumn" // 2,117     521.801
sum sleep_dur_thur_before if season =="Autumn" // 2,158    520.2017 
sum sleep_dur_fri_before if season =="Autumn" // 2,369    521.7553 
sum sleep_dur_sat_before if season =="Autumn" // 2,128    541.0692
sum sleep_dur_sun_change if season =="Autumn" // 2,688    602.8179
sum sleep_dur_mon_after if season =="Autumn" // 1,994    525.8889
sum sleep_dur_tue_after if season =="Autumn" //  2,396    527.0184
sum sleep_dur_wed_after if season =="Autumn" // 1,963    523.1609
sum sleep_dur_thur_after if season =="Autumn" // 1,787    523.4606
sum sleep_dur_fri_after if season =="Autumn" //  1,940    525.1398
sum sleep_dur_sat_after if season =="Autumn" // 1,729    538.7882
sum sleep_dur_sun_after if season =="Autumn" // 2,246    565.3122

*Sleep duration on Sun of clock change is 33 minutes higher than the Sunday before.
*Sleep duration on Sun of clock change is 38 minutes higher than the Sunday after.