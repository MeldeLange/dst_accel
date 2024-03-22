*Adjust for the data cleaning done to the hour of the clock change by Doherty et al.
**************************************************************************************

*Open dataset
set more off
use /mnt/project/accel4.dta, clear
describe // 11780 obs. 127 vars.

count if season =="Spring" // 4569
count if season =="Autumn" // 7211


*Spring: clocks go forward 1 hour at 1am on the Sunday. Doherty et al. have added (imputed) an hour of data from 1-2am.
*Autumn: clocks go back 1 hour at 2am on the Sunday. Doherty et al. have overwritten (equivalent of deleting) an hour of data between 1-2am.

*Sleep proportion is calculated from midnight to midnight.
*Hour 0 starts at midnight (so is midnight to 1am)
*It is hour 1 (1am-2am) on the Sunday that we are interested in.

*Do file dc4_average_1am_weekend_sleep_prop calculated that the average sleep proportion at the weekend (for the 96,645 people who wore the accelerometers over weekends that weren't a clock change weekend) is 0.9033677.




*1. Impute sleep proportion for the Sunday 
**********************************************
*Spring deleting a value
gen sleep_prop_sun_adj_spr=(sleep_prop_sun*24-0.90)/23 if season =="Spring" //

*Autumn adjusted
gen sleep_prop_sun_adj_aut=(sleep_prop_sun*24+0.90)/25 if season =="Autumn" //


*Combine these into one adjusted variable for sunday sleep proportion
gen sleep_prop_sun_adj = sleep_prop_sun_adj_spr if season =="Spring" // 
replace sleep_prop_sun_adj = sleep_prop_sun_adj_aut if season =="Autumn" // 

*Check looks ok
list sleep_prop_sun sleep_prop_sun_adj sleep_prop_sun_adj_spr sleep_prop_sun_adj_aut in 1/20

*Save & upload
save accel5.dta, replace
!dx upload accel5.dta
