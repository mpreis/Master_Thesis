load "common.inc.gp"

set key top right

set output 'plots/aa.eps'
set ylabel 'Accesses'

stats 'aa/445.gobmk.aa.stats.sorted.dropped.csv'
_n_gobmk = STATS_records * 1.0
stats 'aa/450.soplex.aa.stats.sorted.dropped.csv'
_n_soplex = STATS_records * 1.0
stats 'aa/454.calculix.aa.stats.sorted.dropped.csv'
_n_calculix = STATS_records * 1.0
stats 'aa/462.libquantum.aa.stats.sorted.dropped.csv'
_n_libquntum = STATS_records * 1.0
stats 'aa/471.omnetpp.aa.stats.sorted.dropped.csv'
_n_omnetpp = STATS_records * 1.0
stats 'aa/483.xalancbmk.aa.stats.sorted.dropped.csv'
_n_xalancbmk = STATS_records * 1.0
stats 'aa/richards.aa.stats.sorted.dropped.csv'
_n_richards = STATS_records * 1.0
stats 'aa/deltablue.aa.stats.sorted.dropped.csv'
_n_deltablue = STATS_records * 1.0
stats 'aa/raytrace.aa.stats.sorted.dropped.csv'
_n_raytrace = STATS_records * 1.0

plot \
'aa/445.gobmk.aa.stats.sorted.dropped.csv'      u (column(0)/_n_gobmk):1     w lines ls 1 t _t_gobmk,\
'aa/450.soplex.aa.stats.sorted.dropped.csv'     u (column(0)/_n_soplex):1    w lines ls 2 t _t_soplex,\
'aa/454.calculix.aa.stats.sorted.dropped.csv'   u (column(0)/_n_calculix):1  w lines ls 3 t _t_calculix,\
'aa/462.libquantum.aa.stats.sorted.dropped.csv' u (column(0)/_n_libquntum):1 w lines ls 4 t _t_libquntum,\
'aa/471.omnetpp.aa.stats.sorted.dropped.csv'    u (column(0)/_n_omnetpp):1   w lines ls 5 t _t_omnetpp,\
'aa/483.xalancbmk.aa.stats.sorted.dropped.csv'  u (column(0)/_n_xalancbmk):1 w lines ls 6 t _t_xalancbmk,\
'aa/richards.aa.stats.sorted.dropped.csv'       u (column(0)/_n_richards):1  w lines ls 7 t _t_richards,\
'aa/deltablue.aa.stats.sorted.dropped.csv'      u (column(0)/_n_deltablue):1 w lines ls 8 t _t_deltablue,\
'aa/raytrace.aa.stats.sorted.dropped.csv'       u (column(0)/_n_raytrace):1  w lines ls 9 t _t_raytrace,\
# ;
