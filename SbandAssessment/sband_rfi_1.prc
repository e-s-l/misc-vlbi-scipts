define  proc_library  24269114159x
" NYALE13N default VGOS obs library
" Manually constructed outside DRUDG
"< DBBC3_DDC            rack >< FlexBuff recorder 1>
enddef
define  exper_initi   24269114159
proc_library
sched_initi
fb=dts_id?
fb=os_rev?
fb_status
enddef
define  setupbb       24269114210
pcalon
tpicd=stop
core3hbb=$
fb_mode=vdif,,,64
fb_mode
fb_config
dbbcbb32
ifdbb
cont_enable
bbc_gain=all,agc
tpicd=no,100
tpicd
enddef
define  dbbcbb32      24269114227x9x
bbc001=2100,a,32.0
bbc002=2132,a,32.0
bbc003=2164,a,32.0
bbc004=2196,a,32.0
bbc005=2228,a,32.0
bbc006=2260,a,32.0
bbc007=2292,a,32.0
bbc008=2324,a,32.0
bbc009=2100,b,32.0
bbc010=2132,b,32.0
bbc011=2164,b,32.0
bbc012=2196,b,32.0
bbc013=2228,b,32.0
bbc014=2260,b,32.0
bbc015=2292,b,32.0
bbc016=2324,b,32.0
bbc017=1979.6,c,32.0
bbc018=2011.6,c,32.0
bbc019=2075.6,c,32.0
bbc020=2139.6,c,32.0
bbc021=2235.6,c,32.0
bbc022=2363.6,c,32.0
bbc023=2395.6,c,32.0
bbc024=2427.6,c,32.0
bbc025=1979.6,d,32.0
bbc026=2011.6,d,32.0
bbc027=2075.6,d,32.0
bbc028=2139.6,d,32.0
bbc029=2235.6,d,32.0
bbc030=2363.6,d,32.0
bbc031=2395.6,d,32.0
bbc032=2427.6,d,32.0
bbc033=859.6,e,32.0
bbc034=891.6,e,32.0
bbc035=955.6,e,32.0
bbc036=1019.6,e,32.0
bbc037=1115.6,e,32.0
bbc038=1243.6,e,32.0
bbc039=1275.6,e,32.0
bbc040=1307.6,e,32.0
bbc041=859.6,f,32.0
bbc042=891.6,f,32.0
bbc043=955.6,f,32.0
bbc044=1019.6,f,32.0
bbc045=1115.6,f,32.0
bbc046=1243.6,f,32.0
bbc047=1275.6,f,32.0
bbc048=1307.6,f,32.0
bbc049=919.6,g,32.0
bbc050=951.6,g,32.0
bbc051=1015.6,g,32.0
bbc052=1079.6,g,32.0
bbc053=1175.6,g,32.0
bbc054=1303.6,g,32.0
bbc055=1335.6,g,32.0
bbc056=1367.6,g,32.0
bbc057=919.6,h,32.0
bbc058=951.6,h,32.0
bbc059=1015.6,h,32.0
bbc060=1079.6,h,32.0
bbc061=1175.6,h,32.0
bbc062=1303.6,h,32.0
bbc063=1335.6,h,32.0
bbc064=1367.6,h,32.0
enddef
define  ifdbb       2124269114228x
ifa=1,agc,32000
ifb=1,agc,32000
ifc=2,agc,32000
ifd=2,agc,32000
ife=2,agc,32000
iff=2,agc,32000
ifg=2,agc,32000
ifh=2,agc,32000
lo=
lo=loa,0,usb,lcp
lo=lob,0,usb,rcp
lo=loc,7700,lsb,lcp
lo=lod,7700,lsb,rcp
lo=loe,7700,lsb,lcp
lo=lof,7700,lsb,rcp
lo=log,11600,lsb,lcp
lo=loh,11600,lsb,rcp
enddef
define  core3hbb      24269114210
core3h=1,vsi_bitmask 0xcccccccc
core3h=2,vsi_bitmask 0xcccccccc
core3h=3,vsi_bitmask 0x33333333
core3h=4,vsi_bitmask 0x33333333
core3h=5,vsi_bitmask 0x33333333
core3h=6,vsi_bitmask 0x33333333
core3h=7,vsi_bitmask 0x33333333
core3h=8,vsi_bitmask 0x33333333
core3h_mode=begin,force
core3h_mode=1,,0xcccccccc,,64.0,$
core3h_mode=2,,0xcccccccc,,64.0,$
core3h_mode=3,,0x33333333,,64.0,$
core3h_mode=4,,0x33333333,,64.0,$
core3h_mode=5,,0x33333333,,64.0,$
core3h_mode=6,,0x33333333,,64.0,$
core3h_mode=7,,0x33333333,,64.0,$
core3h_mode=8,,0x33333333,,64.0,$
core3h_mode=end,force
enddef
