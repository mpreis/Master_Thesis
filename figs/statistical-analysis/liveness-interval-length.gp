load "common.inc.gp"

set key bottom right

set output 'plots/ll.eps'
set ylabel 'Liveness Interval Length'

stats 'll/445.gobmk.ll.stats.sorted.dropped.csv'
_n_gobmk = STATS_records * 1.0
stats 'll/450.soplex.ll.stats.sorted.dropped.csv'
_n_soplex = STATS_records * 1.0
stats 'll/454.calculix.ll.stats.sorted.dropped.csv'
_n_calculix = STATS_records * 1.0
stats 'll/462.libquantum.ll.stats.sorted.dropped.csv'
_n_libquntum = STATS_records * 1.0
stats 'll/471.omnetpp.ll.stats.sorted.dropped.csv'
_n_omnetpp = STATS_records * 1.0
stats 'll/483.xalancbmk.ll.stats.sorted.dropped.csv'
_n_xalancbmk = STATS_records * 1.0
stats 'll/richards.ll.stats.sorted.dropped.csv'
_n_richards = STATS_records * 1.0
stats 'll/deltablue.ll.stats.sorted.dropped.csv'
_n_deltablue = STATS_records * 1.0
stats 'll/raytrace.ll.stats.sorted.dropped.csv'
_n_raytrace = STATS_records * 1.0

plot \
'll/445.gobmk.ll.stats.sorted.dropped.csv'      u (column(0)/_n_gobmk):1 w lines ls 1 t _t_gobmk,\
'll/450.soplex.ll.stats.sorted.dropped.csv'     u (column(0)/_n_soplex):1 w lines ls 2 t _t_soplex,\
'll/454.calculix.ll.stats.sorted.dropped.csv'   u (column(0)/_n_calculix):1 w lines ls 3 t _t_calculix,\
'll/462.libquantum.ll.stats.sorted.dropped.csv' u (column(0)/_n_libquntum):1 w lines ls 4 t _t_libquntum,\
'll/471.omnetpp.ll.stats.sorted.dropped.csv'    u (column(0)/_n_omnetpp):1 w lines ls 5 t _t_omnetpp,\
'll/483.xalancbmk.ll.stats.sorted.dropped.csv'  u (column(0)/_n_xalancbmk):1 w lines ls 6 t _t_xalancbmk,\
'll/richards.ll.stats.sorted.dropped.csv'       u (column(0)/_n_richards):1 w lines ls 7 t _t_richards,\
'll/deltablue.ll.stats.sorted.dropped.csv'      u (column(0)/_n_deltablue):1 w lines ls 8 t _t_deltablue,\
'll/raytrace.ll.stats.sorted.dropped.csv'       u (column(0)/_n_raytrace):1 w lines ls 9 t _t_raytrace,\
;
