clear
global file_path = "/Users/X/Dropbox/x/PHD/22 exploratory studies/2021 04 FB VGI/GIT/Kaplan-Meier estimator/OUT/"
local in_file_name = "$file_path" + "CVGI_KME_events_svi_A5_stata.csv"

import delimited "`in_file_name'"
*geocod index	event	week

*replace `event' = 0 if (`event' >= .)

*tabulate event, generate(dumpEv)
*tabulate week, generate(dumpWk)
*tabulate geocod, generate(dumpGc)

*stset tvar, failure(fail) id(idvar)
*stset duration3, failure(event==1) exit(duration3) enter(time0)

stset week, failure(event==1)
*exit(event) 

sts test geocod

stcox i.geocod, nohr
