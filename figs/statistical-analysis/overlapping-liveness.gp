# set terminal postscript 'Times-Roman' eps color
set terminal svg
set ylabel 'Number of Overlapping Liveness Intervals'
set key autotitle columnhead
set output '_plots/ol.svg'
set logscale xy

_gre='#7CA82B'
_yel='#FFCA28'
_ora='#EF8535'
_red='#DD1144'

plot \
'ol/445.gobmk.la.stats.sorted.dropped.csv'      u :1 w lines ls 1 lc rgb _gre t '445.gobmk',\
'ol/450.soplex.la.stats.sorted.dropped.csv'     u :1 w lines ls 2 lc rgb _yel t '450.soplex',\
'ol/454.calculix.la.stats.sorted.dropped.csv'   u :1 w lines ls 3 lc rgb _ora t '454.calculix',\
'ol/462.libquantum.la.stats.sorted.dropped.csv' u :1 w lines ls 4 lc rgb _red t '462.libquantum',\
'ol/471.omnetpp.la.stats.sorted.dropped.csv'    u :1 w lines ls 5 lc rgb _gre t '471.omnetpp',\
'ol/483.xalancbmk.la.stats.sorted.dropped.csv'  u :1 w lines ls 6 lc rgb _yel t '483.xalancbmk',\
'ol/richards.la.stats.sorted.dropped.csv'       u :1 w lines ls 7 lc rgb _ora t 'richards',\
'ol/deltablue.la.stats.sorted.dropped.csv'      u :1 w lines ls 8 lc rgb _red t 'deltablue',\
'ol/raytrace.la.stats.sorted.dropped.csv'       u :1 w lines ls 9 lc rgb _gre t 'raytrace',\
;
