* Set the working directory
set more off
* ssc install estout
* ssc install outreg2
cd "/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Merge"

********************************************************************************
* STEP 1                                                                       *
* Merge Data for 2010-2015                                                     *
*                                                                              *
********************************************************************************

/* foreach file in fmli101x.dta ///
	fmli102.dta ///
	fmli103.dta ///
	fmli104.dta ///
	fmli111.dta ///
	fmli111x.dta ///
	fmli112.dta ///
	fmli113.dta ///
	fmli114.dta ///
	fmli121.dta ///
	fmli121x.dta ///
	fmli122.dta ///
	fmli123.dta ///
	fmli124.dta ///
	fmli131.dta ///
	fmli131x.dta ///
	fmli132.dta ///
	fmli133.dta ///
	fmli134.dta ///
	fmli141.dta ///
	fmli141x.dta ///
	fmli142.dta ///
	fmli143.dta ///
	fmli144.dta ///
	fmli151.dta ///
	fmli151x.dta ///
	fmli152.dta ///
	fmli153.dta ///
	fmli154.dta ///
	fmli161.dta {
	
* Read in the FMLI file
use "`file'", clear

* Convert newid to numeric data type 
destring newid, replace

save "`file'", replace
} */

/* foreach file in mtbi101x.dta ///
	mtbi102.dta ///
	mtbi103.dta ///
	mtbi104.dta ///
	mtbi111.dta ///
	mtbi111x.dta ///
	mtbi112.dta ///
	mtbi113.dta ///
	mtbi114.dta ///
	mtbi121.dta ///
	mtbi121x.dta ///
	mtbi122.dta ///
	mtbi123.dta ///
	mtbi124.dta ///
	mtbi131.dta ///
	mtbi131x.dta ///
	mtbi132.dta ///
	mtbi133.dta ///
	mtbi134.dta ///
	mtbi141.dta ///
	mtbi141x.dta ///
	mtbi142.dta ///
	mtbi143.dta ///
	mtbi144.dta ///
	mtbi151.dta ///
	mtbi151x.dta ///
	mtbi152.dta ///
	mtbi153.dta ///
	mtbi154.dta ///
	mtbi161.dta {

* Read in the MTBI file
use "`file'", clear

* Convert newid to numeric data type 
destring newid, replace

* Keep health expenditure data
keep if (ucc == "580115") ///
	| (ucc == "580116") ///
	| (ucc == "580311") ///
	| (ucc == "580312") ///
	| (ucc == "580901") ///
	| (ucc == "580903") ///
	| (ucc == "580904") ///
	| (ucc == "580905") ///
	| (ucc == "590906") ///
	| (ucc == "580907") ///
	| (ucc == "580400") ///
	| (ucc == "560110") ///
	| (ucc == "560210") ///
	| (ucc == "560310") ///
	| (ucc == "560330") ///
	| (ucc == "560400") ///
	| (ucc == "570111") ///
	| (ucc == "570220") ///
	| (ucc == "570230") ///
	| (ucc == "570240") ///
	| (ucc == "540000") ///
	| (ucc == "550110") ///
	| (ucc == "550320") ///
	| (ucc == "550330") ///
	| (ucc == "550340") ///
	| (ucc == "570901") ///
	| (ucc == "570903")     	        

* Sum over ucc
bysort newid ref_yr ref_mo ucc: egen totcost = total(cost)

* Collapse dataset to new ucc level
keep newid ref_yr ref_mo ucc totcost
duplicates drop

order newid ref_yr ref_mo ucc totcost
reshape wide totcost, i(newid ref_yr ref_mo) j(ucc) string

* Merge with FMLI file 
if "`file'" == "mtbi101x.dta" {
	merge m:1 newid using "fmli101x.dta"
} 
else if "`file'" == "mtbi102.dta" {
	merge m:1 newid using "fmli102.dta"
} 
else if "`file'" == "mtbi103.dta" {
	merge m:1 newid using "fmli103.dta"
} 
else if "`file'" == "mtbi104.dta" {
	merge m:1 newid using "fmli104.dta"
} 
else if "`file'" == "mtbi111.dta" {
	merge m:1 newid using "fmli111.dta"
} 
else if "`file'" == "mtbi111x.dta" {
	merge m:1 newid using "fmli111x.dta"
}
else if "`file'" == "mtbi112.dta" {
	merge m:1 newid using "fmli112.dta"
}
else if "`file'" == "mtbi113.dta" {
	merge m:1 newid using "fmli113.dta"
}
else if "`file'" == "mtbi114.dta" {
	merge m:1 newid using "fmli114.dta"
}
else if "`file'" == "mtbi121.dta" {
	merge m:1 newid using "fmli121.dta"
}
else if "`file'" == "mtbi121x.dta" {
	merge m:1 newid using "fmli121x.dta"
}
else if "`file'" == "mtbi122.dta" {
	merge m:1 newid using "fmli122.dta"
}
else if "`file'" == "mtbi123.dta" {
	merge m:1 newid using "fmli123.dta"
}
else if "`file'" == "mtbi124.dta" {
	merge m:1 newid using "fmli124.dta"
}
else if "`file'" == "mtbi131.dta" {
	merge m:1 newid using "fmli131.dta"
}
else if "`file'" == "mtbi131x.dta" {
	merge m:1 newid using "fmli131x.dta"
}
else if "`file'" == "mtbi132.dta" {
	destring newid, replace
	merge m:1 newid using "fmli132.dta"
}
else if "`file'" == "mtbi133.dta" {
	merge m:1 newid using "fmli133.dta"
}
else if "`file'" == "mtbi134.dta" {
	merge m:1 newid using "fmli134.dta"
}
else if "`file'" == "mtbi141.dta" {
	merge m:1 newid using "fmli141.dta"
}
else if "`file'" == "mtbi141x.dta" {
	merge m:1 newid using "fmli141x.dta"
}
else if "`file'" == "mtbi142.dta" {
	merge m:1 newid using "fmli142.dta"
}
else if "`file'" == "mtbi143.dta" {
	merge m:1 newid using "fmli143.dta"
}
else if "`file'" == "mtbi144.dta" {
	merge m:1 newid using "fmli144.dta"
}
else if "`file'" == "mtbi151.dta" {
	merge m:1 newid using "fmli151.dta"
}
else if "`file'" == "mtbi151x.dta" {
	merge m:1 newid using "fmli151x.dta"
}
else if "`file'" == "mtbi152.dta" {
	merge m:1 newid using "fmli152.dta"
}
else if "`file'" == "mtbi153.dta" {
	merge m:1 newid using "fmli153.dta"
}
else if "`file'" == "mtbi154.dta" {
	merge m:1 newid using "fmli154.dta"
}
else if "`file'" == "mtbi161.dta" {
	merge m:1 newid using "fmli161.dta"
}

* Drop observations missing a state, year, or month identifier
drop if missing(state) | missing(ref_yr) | missing(ref_mo)

/*	as_comp1 = number of males age 16 and over in CU
	as_comp2 = number of females age 16 and over in CU
	as_comp3 = number of males age 2 through 15 in CU
	as_comp4 = number of females age 2 through 15 in CU
	as_comp5 = number of members under age 2 in CU
	fam_size = number of members in CU
	perslt18 = number of children less than 18 in CU
	persot64 = number of persons over 64 in CU
	childage = age of children of reference person
	inclass = income class of CU based on income before taxes
	age_ref = age of reference person
	age2 = age of spouse
	educ_ref = education of referencer person
	educa2 = education of spouse
	marital1 = marital status of reference person
	race2 = race of spouse
	ref_race = race of reference person
	sex_ref = sex of reference person
	sex2 = sex of spouse
*/

keep newid ref_yr ref_mo totcost540000 totcost550110 totcost550320 ///
	totcost550330 totcost550340 totcost560110 totcost560210 totcost560310 ///
	totcost560330 totcost560400 totcost570111 totcost570220 totcost570230 ///
	totcost570901 totcost570903 totcost580311 totcost580312 totcost580400 ///
	totcost580901 totcost580903 totcost580904 totcost580905 totcost580907 ///
	state finlwt21 as_comp1 as_comp2 as_comp3 as_comp4 as_comp5 fam_size /// 
	perslt18 persot64 childage inclass age_ref age2 educ_ref educa2 /// 
	marital1 race2 ref_race sex_ref sex2
	
* Merge with previous files
merge m:m newid using "merge1.dta"
drop _merge
	
save "merge1.dta", replace
}
*/


********************************************************************************
* STEP 2                                                                       *
* Generate Healthcare Expenditure Variables                                    *
*                                                                              *
********************************************************************************

/* Read in the merged file
use "merge1.dta", clear

* Convert ref_yr and ref_mo to numeric data type 
destring ref_yr ref_mo state childage inclass educ_ref educa2 marital1 race2 ///
	ref_race sex_ref sex2, replace

* Create a Medicaid Expansion time dummy variable
gen time = (state == 02 & ref_yr >= 2015 & ref_mo >= 09) ///
	| (state == 04 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 05 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 06 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 08 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 09 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 10 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 11 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 15 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 17 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 18 & ref_yr >= 2015 & ref_mo >= 02) ///
	| (state == 19 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 21 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 22 & ref_yr >= 2016 & ref_mo >= 07) ///
	| (state == 24 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 25 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 26 & ref_yr >= 2014 & ref_mo >= 04) ///
	| (state == 27 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 30 & ref_yr >= 2016 & ref_mo >= 01) ///
	| (state == 32 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 33 & ref_yr >= 2014 & ref_mo >= 08) ///
	| (state == 34 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 35 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 36 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 38 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 39 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 41 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 42 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 44 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 50 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 53 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 54 & ref_yr >= 2014 & ref_mo >= 01)

* Create a Medicaid Expansion treatment dummy variable
gen treated = (state == 02) ///
	| (state == 04) ///
	| (state == 05) ///
	| (state == 06) ///
	| (state == 08) ///
	| (state == 09) ///
	| (state == 10) ///
	| (state == 11) ///
	| (state == 15) ///
	| (state == 17) ///
	| (state == 18) ///
	| (state == 19) ///
	| (state == 21) ///
	| (state == 22) ///
	| (state == 24) ///
	| (state == 25) ///
	| (state == 26) ///
	| (state == 27) ///
	| (state == 30) ///
	| (state == 32) ///
	| (state == 33) ///
	| (state == 34) ///
	| (state == 35) ///
	| (state == 36) ///
	| (state == 38) ///
	| (state == 39) ///
	| (state == 41) ///
	| (state == 42) ///
	| (state == 44) ///
	| (state == 50) ///
	| (state == 53) ///
	| (state == 54)
	
/*	health insurance = 580311 + 580312 + 580901 + 580903 + 580904 + 580905 
		+ 580907
	medical services = 560110 + 560210 + 560310 + 560330 + 560400 + 570111
		+ 570220 + 570230
	prescription drugs = 540000
	medical supplies = 550110 + 550320 + 550330 + 550340 + 570901 + 570903
	health care = health insurance + medical services + prescription drugs
		+ medical supplies
*/

recode totcost540000 totcost550110 totcost550320 ///
	totcost550330 totcost550340 totcost560110 totcost560210 totcost560310 ///
	totcost560330 totcost560400 totcost570111 totcost570220 totcost570230 ///
	totcost570901 totcost570903 totcost580311 totcost580312 totcost580400 ///
	totcost580901 totcost580903 totcost580904 totcost580905 totcost580907 ///
	(miss = 0)

* Generate a new variable for each type of expenditure
gen insurance = totcost580311 ///
	+ totcost580312 ///
	+ totcost580901 ///
	+ totcost580903 ///
	+ totcost580904 ///
	+ totcost580905 ///
	+ totcost580907 ///

gen medservices = totcost560110 ///
	+ totcost560210 ///
	+ totcost560310 ///
	+ totcost560330 ///
	+ totcost560400 ///
	+ totcost570111 ///
	+ totcost570220 ///
	+ totcost570230 ///
	
gen drugs = totcost540000

gen medsupplies = totcost550110 ///
	+ totcost550320 ///
	+ totcost550330 ///
	+ totcost550340 ///
	+ totcost570901 ///
	+ totcost570903 ///
	
gen healthcare = insurance + medservices + drugs + medsupplies

/*	as_comp1 = number of males age 16 and over in CU
	as_comp2 = number of females age 16 and over in CU
	as_comp3 = number of males age 2 through 15 in CU
	as_comp4 = number of females age 2 through 15 in CU
	as_comp5 = number of members under age 2 in CU
	fam_size = number of members in CU
	perslt18 = number of children less than 18 in CU
	persot64 = number of persons over 64 in CU
	childage = age of children of reference person
	inclass = income class of CU based on income before taxes
	age_ref = age of reference person
	age2 = age of spouse
	educ_ref = education of reference person
	educa2 = education of spouse
	marital1 = marital status of reference person
	race2 = race of spouse
	ref_race = race of reference person
	sex_ref = sex of reference person
	sex2 = sex of spouse
*/

keep newid ref_yr ref_mo insurance medservices drugs medsupplies ///
	healthcare state finlwt21 as_comp1 as_comp2 as_comp3 as_comp4 ///
	as_comp5 fam_size perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 marital1 race2 ref_race sex_ref sex2 time treated
	
label variable newid "CU"
label variable ref_yr "Year"
label variable ref_mo "Month"
label variable insurance "Health insurance expenditures"
label variable medservices "Medical service expenditures"
label variable drugs "Prescription drug expenditures"
label variable medsupplies "Medical supply expenditures"
label variable healthcare "Health care expenditures"
label variable state "State"
label variable finlwt21 "Population weight"
label variable as_comp1 "Number of males age 16 and over"
label variable as_comp2 "Number of females age 16 and over"
label variable as_comp3 "Number of males age 2 through 15"
label variable as_comp4 "Number of females age 2 through 15"
label variable as_comp5 "Number of members under age 2"
label variable fam_size "Number of members"
label variable perslt18 "Number of children less than 18"
label variable persot64 "Number of persons over 64"
label variable childage "Age of children"
label variable inclass "Income class"
label variable age_ref "Age of reference person"
label variable age2 "Age of spouse"
label variable educ_ref "Education of reference person"
label variable educa2 "Education of spouse"
label variable marital1 "Marital status of reference person"
label variable race2 "Race of spouse"
label variable ref_race "Race of reference person"
label variable sex_ref "Sex of reference person"
label variable sex2 "Sex of spouse"
label variable time "Medicaid expansion indicator"
label variable treated "Medicaid expansion states"

drop if (age_ref < 18) | (age_ref > 64)

save "merge2.dta", replace
*/


********************************************************************************
* STEP 3                                                                       *
* Run Difference in Differences Regressions                                    *
*                                                                              *
********************************************************************************

* Read in the merged file
use "merge2.dta", clear

sum insurance medservices drugs medsupplies healthcare if treated == 0
sum insurance medservices drugs medsupplies healthcare if treated == 1

tab state ref_yr

* Calculate the DID estimator	
quietly reg insurance time i.state i.ref_yr perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2 [w = finlwt21]
outreg2 using ///
	"/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Regression1.docx", ///
	replace label ///
	keep (time perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2) ///
	addtext (State FE, YES, Year FE, YES)
 
quietly reg medservices time i.state i.ref_yr perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2 [w = finlwt21]
outreg2 using ///
	"/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Regression1.docx", ///
	append label ///
	keep (time perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2) ///
	addtext (State FE, YES, Year FE, YES)
 
quietly reg drugs time i.state i.ref_yr perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2 [w = finlwt21]
outreg2 using ///
	"/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Regression2.docx", ///
	replace label ///
	keep (time perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2) ///
	addtext (State FE, YES, Year FE, YES)
 
quietly reg medsupplies time i.state i.ref_yr perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2 [w = finlwt21]
outreg2 using ///
	"/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Regression2.docx", ///
	append label ///
	keep (time perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2) ///
	addtext (State FE, YES, Year FE, YES)
 
quietly reg healthcare time i.state i.ref_yr perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2 [w = finlwt21]
outreg2 using ///
	"/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Regression3.docx", ///
	replace label ///
	keep (time perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2) ///
	addtext (State FE, YES, Year FE, YES)
	

********************************************************************************
* STEP 4                                                                       *
* Robustness Checks                                                            *
*                                                                              *
********************************************************************************

* Read in the merged file
use "merge2.dta", clear

* Create a Medicaid Expansion time dummy variable for 1 year before
gen time1 = (state == 02 & ref_yr >= 2014 & ref_mo >= 09) ///
	| (state == 04 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 05 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 06 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 08 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 09 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 10 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 11 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 15 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 17 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 18 & ref_yr >= 2014 & ref_mo >= 02) ///
	| (state == 19 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 21 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 22 & ref_yr >= 2015 & ref_mo >= 07) ///
	| (state == 24 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 25 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 26 & ref_yr >= 2013 & ref_mo >= 04) ///
	| (state == 27 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 30 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 32 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 33 & ref_yr >= 2013 & ref_mo >= 08) ///
	| (state == 34 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 35 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 36 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 38 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 39 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 41 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 42 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 44 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 50 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 53 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 54 & ref_yr >= 2013 & ref_mo >= 01)
	
* Create a Medicaid Expansion time dummy variable for 2 years before
gen time2 = (state == 02 & ref_yr >= 2013 & ref_mo >= 09) ///
	| (state == 04 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 05 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 06 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 08 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 09 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 10 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 11 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 15 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 17 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 18 & ref_yr >= 2013 & ref_mo >= 02) ///
	| (state == 19 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 21 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 22 & ref_yr >= 2014 & ref_mo >= 07) ///
	| (state == 24 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 25 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 26 & ref_yr >= 2012 & ref_mo >= 04) ///
	| (state == 27 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 30 & ref_yr >= 2014 & ref_mo >= 01) ///
	| (state == 32 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 33 & ref_yr >= 2012 & ref_mo >= 08) ///
	| (state == 34 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 35 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 36 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 38 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 39 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 41 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 42 & ref_yr >= 2013 & ref_mo >= 01) ///
	| (state == 44 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 50 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 53 & ref_yr >= 2012 & ref_mo >= 01) ///
	| (state == 54 & ref_yr >= 2012 & ref_mo >= 01)
	
* Create a Medicaid Expansion time dummy variable for 1 year later
gen time3 = (state == 02 & ref_yr >= 2016 & ref_mo >= 09) ///
	| (state == 04 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 05 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 06 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 08 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 09 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 10 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 11 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 15 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 17 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 18 & ref_yr >= 2016 & ref_mo >= 02) ///
	| (state == 19 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 21 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 22 & ref_yr >= 2017 & ref_mo >= 07) ///
	| (state == 24 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 25 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 26 & ref_yr >= 2015 & ref_mo >= 04) ///
	| (state == 27 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 30 & ref_yr >= 2017 & ref_mo >= 01) ///
	| (state == 32 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 33 & ref_yr >= 2015 & ref_mo >= 08) ///
	| (state == 34 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 35 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 36 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 38 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 39 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 41 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 42 & ref_yr >= 2016 & ref_mo >= 01) ///
	| (state == 44 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 50 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 53 & ref_yr >= 2015 & ref_mo >= 01) ///
	| (state == 54 & ref_yr >= 2015 & ref_mo >= 01)

label variable time2 "Medicaid expansion indicator -2 years"
label variable time1 "Medicaid expansion indicator -1 year"
label variable time3 "Medicaid expansion indicator +1 year"

* Calculate the DID estimator	
quietly reg insurance time time1 time2 time3 i.state i.ref_yr perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2 [w = finlwt21]
outreg2 using ///
	"/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Regression4.docx", ///
	replace label ///
	keep (time time1 time2 time3 perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2) ///
	addtext (State FE, YES, Year FE, YES)
 
quietly reg medservices time time1 time2 time3 i.state i.ref_yr perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2 [w = finlwt21]
outreg2 using ///
	"/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Regression4.docx", ///
	append label ///
	keep (time time1 time2 time3 perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2) ///
	addtext (State FE, YES, Year FE, YES)
 
quietly reg drugs time time1 time2 time3 i.state i.ref_yr perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2 [w = finlwt21]
outreg2 using ///
	"/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Regression5.docx", ///
	replace label ///
	keep (time time1 time2 time3 perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2) ///
	addtext (State FE, YES, Year FE, YES)
 
quietly reg medsupplies time time1 time2 time3 i.state i.ref_yr perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2 [w = finlwt21]
outreg2 using ///
	"/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Regression5.docx", ///
	append label ///
	keep (time time1 time2 time3 perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2) ///
	addtext (State FE, YES, Year FE, YES)
 
quietly reg healthcare time time1 time2 time3 i.state i.ref_yr perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2 [w = finlwt21]
outreg2 using ///
	"/Users/lamiya/Documents/Lamiya's Work/UVA- Fourth Year/ECON 4990:4999/Regression6.docx", ///
	replace label ///
	keep (time time1 time2 time3 perslt18 persot64 childage inclass age_ref ///
	age2 educ_ref educa2 race2 ref_race sex_ref sex2) ///
	addtext (State FE, YES, Year FE, YES)
