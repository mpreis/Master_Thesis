# set terminal postscript 'Times-Roman' eps color
set terminal 'Times-Roman' pdf
set ylabel 'Access Distance'
set key autotitle columnhead
set output 'plots/ad.svg'
set logscale xy

_gre='#7CA82B'
_yel='#FFCA28'
_ora='#EF8535'
_red='#DD1144'

plot \
'ad/445.gobmk.ad.stats.sorted.dropped.csv'      u :1 w lines ls 1 lc rgb _gre t '445.gobmk',\
'ad/450.soplex.ad.stats.sorted.dropped.csv'     u :1 w lines ls 2 lc rgb _yel t '450.soplex',\
'ad/454.calculix.ad.stats.sorted.dropped.csv'   u :1 w lines ls 3 lc rgb _ora t '454.calculix',\
'ad/462.libquantum.ad.stats.sorted.dropped.csv' u :1 w lines ls 4 lc rgb _red t '462.libquantum',\
'ad/471.omnetpp.ad.stats.sorted.dropped.csv'    u :1 w lines ls 5 lc rgb _gre t '471.omnetpp',\
'ad/483.xalancbmk.ad.stats.sorted.dropped.csv'  u :1 w lines ls 6 lc rgb _yel t '483.xalancbmk',\
'ad/richards.ad.stats.sorted.dropped.csv'       u :1 w lines ls 7 lc rgb _ora t 'richards',\
'ad/deltablue.ad.stats.sorted.dropped.csv'      u :1 w lines ls 8 lc rgb _red t 'deltablue',\
'ad/raytrace.ad.stats.sorted.dropped.csv'       u :1 w lines ls 9 lc rgb _gre t 'raytrace',\
;
