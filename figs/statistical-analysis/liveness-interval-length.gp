# set terminal postscript 'Times-Roman' eps color
set terminal svg
set ylabel 'Liveness Interval Length'
set key autotitle columnhead
set output '_plots/ll.svg'
set logscale xy

_gre='#7CA82B'
_yel='#FFCA28'
_ora='#EF8535'
_red='#DD1144'

plot \
'll/445.gobmk.ll.stats.sorted.dropped.csv'      u :1 w lines ls 1 lc rgb _gre t '445.gobmk',\
'll/450.soplex.ll.stats.sorted.dropped.csv'     u :1 w lines ls 2 lc rgb _yel t '450.soplex',\
'll/454.calculix.ll.stats.sorted.dropped.csv'   u :1 w lines ls 3 lc rgb _ora t '454.calculix',\
'll/462.libquantum.ll.stats.sorted.dropped.csv' u :1 w lines ls 4 lc rgb _red t '462.libquantum',\
'll/471.omnetpp.ll.stats.sorted.dropped.csv'    u :1 w lines ls 5 lc rgb _gre t '471.omnetpp',\
'll/483.xalancbmk.ll.stats.sorted.dropped.csv'  u :1 w lines ls 6 lc rgb _yel t '483.xalancbmk',\
'll/richards.ll.stats.sorted.dropped.csv'       u :1 w lines ls 7 lc rgb _ora t 'richards',\
'll/deltablue.ll.stats.sorted.dropped.csv'      u :1 w lines ls 8 lc rgb _red t 'deltablue',\
'll/raytrace.ll.stats.sorted.dropped.csv'       u :1 w lines ls 9 lc rgb _gre t 'raytrace',\
;
