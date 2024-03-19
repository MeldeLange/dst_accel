*Naming variables in merged doherty pheno file.
*************************************************

*Open merged doherty & pheno dataset
set more off
use /mnt/project/pheno_doherty.dta, clear
describe


*1. Rename & label pheno variables
*************************************
rename v2 start_wear
label variable start_wear "Start of wear time (90010)"
rename v3 end_wear 
label variable end_wear "End of wear time (90011)"
rename v4 DST_crossover
label variable DST_crossover "Daylight savings time crossover (90018)"
rename v5 sex 
label variable sex "Sex (31)"
rename v6 year_birth
label variable year_birth "Year of birth (34)"
rename v7 month_birth
label variable month_birth "Month of birth (52)"
rename v8 age_assess
label variable age_assess "Age when attended assessment centre (21003_i0)"
rename v9 ethnicity 
label variable ethnicity "Ethnic group (21000_i0)"
rename v10 income 
label variable income "Average household income (738_i0)"
rename v11 bmi
label variable bmi "BMI (21001_i0)"
rename v12 chronotype
label variable chronotype "Chronotype (1180_i0)"
rename v13 insomnia
label variable insomnia "Insomnia (1200_i0)"
rename v14 problem_indicator
label variable problem_indicator "Data problem indicator (90002)"
rename v15 good_wear 
label variable good_wear "Data quality, good wear time (90015)"
rename v16 good_calib
label variable good_calib "Data quality, good calibration (90016)"
rename v17 calibrated_own
label variable calibrated_own "Data quality, calibrated on own data (90017)"
rename v18 recording_error
label variable recording_error "Data recording errors (90182)"
rename v19 interrup_rec_periods
label variable interrup_rec_periods "Interrupted recording periods (90180)"
rename v20 dur_interrup_rec_periods
label variable dur_interrup_rec_periods "Duration of interrupted recording periods (90181)"
rename v21 exceed_8grav_before
label variable exceed_8grav_before "Readings exceeding +/-8 gravities before calibration (90183)"
rename v22 exceed_8grav_after
label variable exceed_8grav_after "Readings exceeding +/-8 gravities after calibration (90185)"
rename v23 max_exceed_8grav_before 
label variable max_exceed_8grav_before "Max readings exceeding +/-8 gravities before calibration (90184)"
rename v24 max_exceed_8grav_after
label variable max_exceed_8grav_after "Max readings exceeding +/-8 gravities after calibration (90186)"
rename v25 total_readings
label variable total_readings "Total data readings (90187)"
rename v26 date_assess
label variable date_assess "Date of attending assessment centre (53_i0)"
rename v27 overall_activity
label variable overall_activity "Overall acceleration average (90012)"

describe //

*2. Rename & label accel variables.
***********************************

*Rename & label overall sleep data.
rename type_sleep_mon_avg sleep_prop_mon
label variable sleep_prop_mon "Average sleep proportion (% time) on Monday"
rename type_sleep_tue_avg sleep_prop_tue
label variable sleep_prop_tue "Average sleep proportion (% time) on Tuesday"
rename type_sleep_wed_avg sleep_prop_wed
label variable sleep_prop_wed "Average sleep proportion (% time) on wednesday"
rename type_sleep_thur_avg sleep_prop_thur
label variable sleep_prop_thur "Average sleep proportion (% time) on Thursday"
rename type_sleep_fri_avg sleep_prop_fri
label variable sleep_prop_fri "Average sleep proportion (% time) on Friday"
rename type_sleep_sat_avg sleep_prop_sat
label variable sleep_prop_sat "Average sleep proportion (% time) on Saturday"
rename type_sleep_sun_avg sleep_prop_sun
label variable sleep_prop_sun "Average sleep proportion (% time) on Sunday"
rename type_sleep_overall sleep_prop_overall
label variable sleep_prop_overall "Average sleep proportion (% time) Overall"
rename type_sleep_weekday sleep_prop_weekday
label variable sleep_prop_weekday "Average sleep proportion (% time) on Weekdays"
rename type_sleep_weekend sleep_prop_weekend
label variable sleep_prop_weekend "Average sleep proportion (% time) on Weekend Days"


*Rename & label overall hourly data.
rename type_sleep_hourofday0 sleep_prop_hour_0
label variable sleep_prop_hour_0 "Average sleep proportion in hour 0"
rename type_sleep_hourofday1 sleep_prop_hour_1
label variable sleep_prop_hour_1 "Average sleep proportion in hour 1"
rename type_sleep_hourofday2 sleep_prop_hour_2
label variable sleep_prop_hour_2 "Average sleep proportion in hour 2"
rename type_sleep_hourofday3 sleep_prop_hour_3
label variable sleep_prop_hour_3 "Average sleep proportion in hour 3"
rename type_sleep_hourofday4 sleep_prop_hour_4
label variable sleep_prop_hour_4 "Average sleep proportion in hour 4"
rename type_sleep_hourofday5 sleep_prop_hour_5
label variable sleep_prop_hour_5 "Average sleep proportion in hour 5"
rename type_sleep_hourofday6 sleep_prop_hour_6
label variable sleep_prop_hour_6 "Average sleep proportion in hour 6"
rename type_sleep_hourofday7 sleep_prop_hour_7
label variable sleep_prop_hour_7 "Average sleep proportion in hour 7"
rename type_sleep_hourofday8 sleep_prop_hour_8
label variable sleep_prop_hour_8 "Average sleep proportion in hour 8"
rename type_sleep_hourofday9 sleep_prop_hour_9
label variable sleep_prop_hour_9 "Average sleep proportion in hour 9"
rename type_sleep_hourofday10 sleep_prop_hour_10
label variable sleep_prop_hour_10 "Average sleep proportion in hour 10"
rename type_sleep_hourofday11 sleep_prop_hour_11
label variable sleep_prop_hour_11 "Average sleep proportion in hour 11"
rename type_sleep_hourofday12 sleep_prop_hour_12
label variable sleep_prop_hour_12 "Average sleep proportion in hour 12"
rename type_sleep_hourofday13 sleep_prop_hour_13
label variable sleep_prop_hour_13 "Average sleep proportion in hour 13"
rename type_sleep_hourofday14 sleep_prop_hour_14
label variable sleep_prop_hour_14 "Average sleep proportion in hour 14"
rename type_sleep_hourofday15 sleep_prop_hour_15
label variable sleep_prop_hour_15 "Average sleep proportion in hour 15"
rename type_sleep_hourofday16 sleep_prop_hour_16
label variable sleep_prop_hour_16 "Average sleep proportion in hour 16"
rename type_sleep_hourofday17 sleep_prop_hour_17
label variable sleep_prop_hour_17 "Average sleep proportion in hour 17"
rename type_sleep_hourofday18 sleep_prop_hour_18
label variable sleep_prop_hour_18 "Average sleep proportion in hour 18"
rename type_sleep_hourofday19 sleep_prop_hour_19
label variable sleep_prop_hour_19 "Average sleep proportion in hour 19"
rename type_sleep_hourofday20 sleep_prop_hour_20
label variable sleep_prop_hour_20 "Average sleep proportion in hour 20"
rename type_sleep_hourofday21 sleep_prop_hour_21
label variable sleep_prop_hour_21 "Average sleep proportion in hour 21"
rename type_sleep_hourofday22 sleep_prop_hour_22
label variable sleep_prop_hour_22 "Average sleep proportion in hour 22"
rename type_sleep_hourofday23 sleep_prop_hour_23
label variable sleep_prop_hour_23 "Average sleep proportion in hour 23"


*Rename & label weekday hourly data
rename type_sleep_weekday0 sleep_prop_weekday_hour_0
label variable sleep_prop_weekday_hour_0 "Average sleep proportion weekday hour 0"
rename type_sleep_weekday1 sleep_prop_weekday_hour_1
label variable sleep_prop_weekday_hour_1 "Average sleep proportion weekday hour 1"
rename type_sleep_weekday2 sleep_prop_weekday_hour_2
label variable sleep_prop_weekday_hour_2 "Average sleep proportion weekday hour 2"
rename type_sleep_weekday3 sleep_prop_weekday_hour_3
label variable sleep_prop_weekday_hour_3 "Average sleep proportion weekday hour 3"
rename type_sleep_weekday4 sleep_prop_weekday_hour_4
label variable sleep_prop_weekday_hour_4 "Average sleep proportion weekday hour 4"
rename type_sleep_weekday5 sleep_prop_weekday_hour_5
label variable sleep_prop_weekday_hour_5 "Average sleep proportion weekday hour 5"
rename type_sleep_weekday6 sleep_prop_weekday_hour_6
label variable sleep_prop_weekday_hour_6 "Average sleep proportion weekday hour 6"
rename type_sleep_weekday7 sleep_prop_weekday_hour_7
label variable sleep_prop_weekday_hour_7 "Average sleep proportion weekday hour 7"
rename type_sleep_weekday8 sleep_prop_weekday_hour_8
label variable sleep_prop_weekday_hour_8 "Average sleep proportion weekday hour 8"
rename type_sleep_weekday9 sleep_prop_weekday_hour_9
label variable sleep_prop_weekday_hour_9 "Average sleep proportion weekday hour 9"
rename type_sleep_weekday10 sleep_prop_weekday_hour_10
label variable sleep_prop_weekday_hour_10 "Average sleep proportion weekday hour 10"
rename type_sleep_weekday11 sleep_prop_weekday_hour_11
label variable sleep_prop_weekday_hour_11 "Average sleep proportion weekday hour 11"
rename type_sleep_weekday12 sleep_prop_weekday_hour_12
label variable sleep_prop_weekday_hour_12 "Average sleep proportion weekday hour 12"
rename type_sleep_weekday13 sleep_prop_weekday_hour_13
label variable sleep_prop_weekday_hour_13 "Average sleep proportion weekday hour 13"
rename type_sleep_weekday14 sleep_prop_weekday_hour_14
label variable sleep_prop_weekday_hour_14 "Average sleep proportion weekday hour 14"
rename type_sleep_weekday15 sleep_prop_weekday_hour_15
label variable sleep_prop_weekday_hour_15 "Average sleep proportion weekday hour 15"
rename type_sleep_weekday16 sleep_prop_weekday_hour_16
label variable sleep_prop_weekday_hour_16 "Average sleep proportion weekday hour 16"
rename type_sleep_weekday17 sleep_prop_weekday_hour_17
label variable sleep_prop_weekday_hour_17 "Average sleep proportion weekday hour 17"
rename type_sleep_weekday18 sleep_prop_weekday_hour_18
label variable sleep_prop_weekday_hour_18 "Average sleep proportion weekday hour 18"
rename type_sleep_weekday19 sleep_prop_weekday_hour_19
label variable sleep_prop_weekday_hour_19 "Average sleep proportion weekday hour 19"
rename type_sleep_weekday20 sleep_prop_weekday_hour_20
label variable sleep_prop_weekday_hour_20 "Average sleep proportion weekday hour 20"
rename type_sleep_weekday21 sleep_prop_weekday_hour_21
label variable sleep_prop_weekday_hour_21 "Average sleep proportion weekday hour 21"
rename type_sleep_weekday22 sleep_prop_weekday_hour_22
label variable sleep_prop_weekday_hour_22 "Average sleep proportion weekday hour 22"
rename type_sleep_weekday23 sleep_prop_weekday_hour_23
label variable sleep_prop_weekday_hour_23 "Average sleep proportion weekday hour 23"

*Rename & label weekend hourly data
rename type_sleep_weekend0 sleep_prop_weekend_hour_0
label variable sleep_prop_weekend_hour_0 "Average sleep proportion weekend hour 0"
rename type_sleep_weekend1 sleep_prop_weekend_hour_1
label variable sleep_prop_weekend_hour_1 "Average sleep proportion weekend hour 1"
rename type_sleep_weekend2 sleep_prop_weekend_hour_2
label variable sleep_prop_weekend_hour_2 "Average sleep proportion weekend hour 2"
rename type_sleep_weekend3 sleep_prop_weekend_hour_3
label variable sleep_prop_weekend_hour_3 "Average sleep proportion weekend hour 3"
rename type_sleep_weekend4 sleep_prop_weekend_hour_4
label variable sleep_prop_weekend_hour_4 "Average sleep proportion weekend hour 4"
rename type_sleep_weekend5 sleep_prop_weekend_hour_5
label variable sleep_prop_weekend_hour_5 "Average sleep proportion weekend hour 5"
rename type_sleep_weekend6 sleep_prop_weekend_hour_6
label variable sleep_prop_weekend_hour_6 "Average sleep proportion weekend hour 6"
rename type_sleep_weekend7 sleep_prop_weekend_hour_7
label variable sleep_prop_weekend_hour_7 "Average sleep proportion weekend hour 7"
rename type_sleep_weekend8 sleep_prop_weekend_hour_8
label variable sleep_prop_weekend_hour_8 "Average sleep proportion weekend hour 8"
rename type_sleep_weekend9 sleep_prop_weekend_hour_9
label variable sleep_prop_weekend_hour_9 "Average sleep proportion weekend hour 9"
rename type_sleep_weekend10 sleep_prop_weekend_hour_10
label variable sleep_prop_weekend_hour_10 "Average sleep proportion weekend hour 10"
rename type_sleep_weekend11 sleep_prop_weekend_hour_11
label variable sleep_prop_weekend_hour_11 "Average sleep proportion weekend hour 11"
rename type_sleep_weekend12 sleep_prop_weekend_hour_12
label variable sleep_prop_weekend_hour_12 "Average sleep proportion weekend hour 12"
rename type_sleep_weekend13 sleep_prop_weekend_hour_13
label variable sleep_prop_weekday_hour_13 "Average sleep proportion weekday hour 13"
rename type_sleep_weekend14 sleep_prop_weekend_hour_14
label variable sleep_prop_weekend_hour_14 "Average sleep proportion weekend hour 14"
rename type_sleep_weekend15 sleep_prop_weekend_hour_15
label variable sleep_prop_weekend_hour_15 "Average sleep proportion weekend hour 15"
rename type_sleep_weekend16 sleep_prop_weekend_hour_16
label variable sleep_prop_weekend_hour_16 "Average sleep proportion weekend hour 16"
rename type_sleep_weekend17 sleep_prop_weekend_hour_17
label variable sleep_prop_weekend_hour_17 "Average sleep proportion weekend hour 17"
rename type_sleep_weekend18 sleep_prop_weekend_hour_18
label variable sleep_prop_weekend_hour_18 "Average sleep proportion weekend hour 18"
rename type_sleep_weekend19 sleep_prop_weekend_hour_19
label variable sleep_prop_weekend_hour_19 "Average sleep proportion weekend hour 19"
rename type_sleep_weekend20 sleep_prop_weekend_hour_20
label variable sleep_prop_weekend_hour_20 "Average sleep proportion weekend hour 20"
rename type_sleep_weekend21 sleep_prop_weekend_hour_21
label variable sleep_prop_weekend_hour_21 "Average sleep proportion weekend hour 21"
rename type_sleep_weekend22 sleep_prop_weekend_hour_22
label variable sleep_prop_weekend_hour_22 "Average sleep proportion weekend hour 22"
rename type_sleep_weekend23 sleep_prop_weekend_hour_23
label variable sleep_prop_weekend_hour_23 "Average sleep proportion weekend hour 23"

*Check looks ok.
describe

*Save & upload
save accel.dta, replace
!dx upload accel.dta