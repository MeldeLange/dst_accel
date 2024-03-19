*Data cleaning - Doherty accelerometer data
*******************************************
*******************************************


*1. Converting derived Doherty accelerometer dataset (UK Biobank return 1942) to .dta files
*******************************************************************
*Done in Stata on my desktop

*Set working directory


*Import text file
import delimited using dohertyLindgren-ukb11867-accPhenotypes.txt, clear

*Check looks ok
describe 
browse

*Save as a .dta file
save doherty.dta, replace


****************************************************************
*2. Cut dataset down to just sleep variables (dataset is 166,629 KB)

*Set working directory


*Open dataset
use doherty.dta, clear

*Only keep eid & sleep variables
keep *sleep* *eid*

*Rename eid variable ready to merge with UKB data
rename eid86626 eid

*Save as new file (1024 KB)
save doherty_sleep.dta, replace

*This file was then manually uploaded to DNA Nexus.


*********************************************************************

*3. Prepare UKB pheno from DNA Nexus data for merging with accelerometer data
******************************************************************************
*A dashboard containing sociodemographic variables plus variables needed to clean the accelerometer data was created in DNA Nexus & saved as a .csv file.

*Import pheno csv file
import delimited /mnt/project/accel_pheno.csv, clear
describe // obs: 502,364. vars: 27. (v4 = DST crossover)

*Save phenotype data as stata .dta file & upload to DNA Nexus project
save accel_pheno.dta, replace
!dx upload accel_pheno.dta

****************************************


*3. Merge Doherty & phenotype data
***********************************


***Need to go out of JupyterLab and then back in again to use .dta file saved in DNA Nexus project

*Open phenotype data
set more off
use /mnt/project/accel_pheno.dta, clear
describe

*Merge Doherty & phenotype data (pheno data = master, Doherty = using)
merge 1:1 eid using /mnt/project/doherty_sleep.dta

* Result                           # of obs.
*    -----------------------------------------
*    not matched                       398,736
*        from master                   398,736  (_merge==1)
*        from using                          0  (_merge==2)
*
*    matched                           103,628  (_merge==3)
*    -----------------------------------------

*Rename merge variable
rename _merge _merge_doherty_pheno

*Explore merged dataset
set more off
describe


*Just keep those in the Doherty dataset (using dataset)
keep if _merge_doherty_pheno == 3 // 398,736 obs deleted.
describe // 103,628. vars: 110.
drop _merge_doherty_pheno

*Check Doherty data has people with DST crossover
tab v4 // 1: 4,541. 0 = 99,083.
*Yes it does.

*Save & upload
save pheno_doherty.dta, replace
!dx upload pheno_doherty.dta
