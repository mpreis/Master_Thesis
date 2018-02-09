# set terminal postscript 'Times-Roman' eps color
set terminal svg
set ylabel 'Accesses'
set key autotitle columnhead
set output '_plots/aa.svg'
set logscale xy

_gre='#7CA82B'
_yel='#FFCA28'
_ora='#EF8535'
_red='#DD1144'

plot \
'aa/445.gobmk.aa.stats.sorted.dropped.csv'      u :1 w lines ls 1 lc rgb _gre t '445.gobmk',\
'aa/450.soplex.aa.stats.sorted.dropped.csv'     u :1 w lines ls 2 lc rgb _yel t '450.soplex',\
'aa/454.calculix.aa.stats.sorted.dropped.csv'   u :1 w lines ls 3 lc rgb _ora t '454.calculix',\
'aa/462.libquantum.aa.stats.sorted.dropped.csv' u :1 w lines ls 4 lc rgb _red t '462.libquantum',\
'aa/471.omnetpp.aa.stats.sorted.dropped.csv'    u :1 w lines ls 5 lc rgb _gre t '471.omnetpp',\
'aa/483.xalancbmk.aa.stats.sorted.dropped.csv'  u :1 w lines ls 6 lc rgb _yel t '483.xalancbmk',\
'aa/richards.aa.stats.sorted.dropped.csv'       u :1 w lines ls 7 lc rgb _ora t 'richards',\
'aa/deltablue.aa.stats.sorted.dropped.csv'      u :1 w lines ls 8 lc rgb _red t 'deltablue',\
'aa/raytrace.aa.stats.sorted.dropped.csv'       u :1 w lines ls 9 lc rgb _gre t 'raytrace',\
;
