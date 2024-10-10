# About:


## 

.snp and .prc files must have the same name.

Moreover, they must be placed in their respective directories (/usr2/sched/ & /usr2/proc/)

File names must be less than 18 characters.

check_sband.py at this stage is a copy of checkdata.py...
We need to adapt it to only plot the first 8 (or 16) channels of the DBBC.


### NOTE:

For consistency, let's use log=sband_rfi

## Procedure:

1. Load the log file
2. Move to source (<s>could this be done in .snp</s> This is now done in snap.)
3. Load in the first .prc files
4. Set a scan name
5. Turn on disk_record
6. Wait 10 seconds (!+10s)
7. Turn off disk record
8. Run check_data (the plotting script)
9. Repeat steps 4 -> 8 for the other .prc file


## The .prc files:

These are simple modifications of `vo4269nn.prc`

Together they cover [2.1, 2.6] GHz:

`sband_rf_1.prc` ranges from 2100 to 2356 MHz,
`sband_rf_2.prc` ranges from 2356 to 2612 MHz.

The range we would like to cover is [2.1, 2.5] GHz.

<s>
Together they cover [2.1, 2.4] GHz:
`sband_rf_1.prc` ranges from 2100 to 2356 MHz,
`sband_rf_2.prc` ranges from 2144 to 2400 MHz.
</s>

## The .snp file:

...an attempt to automate some of the steps described in the above procedure.

_v1 is minimal (the more likely of the two that we will use).
_v2 is an attempt to automate it all, just run `scheudle=sband_as_v2`

## The plotting script:

On the FSNS, we would run `checkmk5`... 
which runs `/usr2/oper/bin/check_data &` which runs 
`/usr2/oper/bin/checkdata.py 'lognm' checkmk5.data &` 
which runs `scan_check`...

But do we even have scan check for the flexbuff...
