*Analysis - Creating table 1
**********************************

*Install table1_mc
ssc install table1_mc

*help table1_mc

*Open dataset
set more off
use /mnt/project/accel7.dta, clear

*Code to create table

table1_mc, by(season) ///
vars( ///
sex bin %4.1f \ ///
age_accel_tert cat %4.1f \ ///
employ_3cats cat %4.1f \ ///
sleep_dur_cats cat %4.1f \ ///
chrono_3cats cat %4.1f %4.1f \ ///
) ///
nospace onecol total(before) ///
saving("table1.xlsx", replace)


*Upload to project
!dx upload table1.xlsx