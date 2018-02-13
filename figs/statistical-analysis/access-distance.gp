load "common.inc.gp"

set key top left Left reverse

set output 'plots/ad.eps'
set ylabel 'Access Distance'

stats 'ad/445.gobmk.ad.stats.sorted.dropped.csv'
_n_gobmk = STATS_records * 1.0
stats 'ad/450.soplex.ad.stats.sorted.dropped.csv'
_n_soplex = STATS_records * 1.0
stats 'ad/454.calculix.ad.stats.sorted.dropped.csv'
_n_calculix = STATS_records * 1.0
stats 'ad/462.libquantum.ad.stats.sorted.dropped.csv'
_n_libquntum = STATS_records * 1.0
stats 'ad/471.omnetpp.ad.stats.sorted.dropped.csv'
_n_omnetpp = STATS_records * 1.0
stats 'ad/483.xalancbmk.ad.stats.sorted.dropped.csv'
_n_xalancbmk = STATS_records * 1.0
stats 'ad/richards.ad.stats.sorted.dropped.csv'
_n_richards = STATS_records * 1.0
stats 'ad/deltablue.ad.stats.sorted.dropped.csv'
_n_deltablue = STATS_records * 1.0
stats 'ad/raytrace.ad.stats.sorted.dropped.csv'
_n_raytrace = STATS_records * 1.0

plot \
'ad/445.gobmk.ad.stats.sorted.dropped.csv'      u (column(0)/_n_gobmk):1 w lines ls 1 t _t_gobmk,\
'ad/450.soplex.ad.stats.sorted.dropped.csv'     u (column(0)/_n_soplex):1 w lines ls 2 t _t_soplex,\
'ad/454.calculix.ad.stats.sorted.dropped.csv'   u (column(0)/_n_calculix):1 w lines ls 3 t _t_calculix,\
'ad/462.libquantum.ad.stats.sorted.dropped.csv' u (column(0)/_n_libquntum):1 w lines ls 4 t _t_libquntum,\
'ad/471.omnetpp.ad.stats.sorted.dropped.csv'    u (column(0)/_n_omnetpp):1 w lines ls 5 t _t_omnetpp,\
'ad/483.xalancbmk.ad.stats.sorted.dropped.csv'  u (column(0)/_n_xalancbmk):1 w lines ls 6 t _t_xalancbmk,\
'ad/richards.ad.stats.sorted.dropped.csv'       u (column(0)/_n_richards):1 w lines ls 7 t _t_richards,\
'ad/deltablue.ad.stats.sorted.dropped.csv'      u (column(0)/_n_deltablue):1 w lines ls 8 t _t_deltablue,\
'ad/raytrace.ad.stats.sorted.dropped.csv'       u (column(0)/_n_raytrace):1 w lines ls 9 t _t_raytrace,\
;
