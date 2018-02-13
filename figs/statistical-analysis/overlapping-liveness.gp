load "common.inc.gp"

set key bottom left Left reverse

set output 'plots/ol.eps'
set ylabel 'Overlapping Liveness Intervals'

stats 'ol/445.gobmk.ol.stats.sorted.dropped.csv'
_n_gobmk = STATS_records * 1.0
stats 'ol/450.soplex.ol.stats.sorted.dropped.csv'
_n_soplex = STATS_records * 1.0
stats 'ol/454.calculix.ol.stats.sorted.dropped.csv'
_n_calculix = STATS_records * 1.0
stats 'ol/462.libquantum.ol.stats.sorted.dropped.csv'
_n_libquntum = STATS_records * 1.0
stats 'ol/471.omnetpp.ol.stats.sorted.dropped.csv'
_n_omnetpp = STATS_records * 1.0
stats 'ol/483.xalancbmk.ol.stats.sorted.dropped.csv'
_n_xalancbmk = STATS_records * 1.0
stats 'ol/richards.ol.stats.sorted.dropped.csv'
_n_richards = STATS_records * 1.0
stats 'ol/deltablue.ol.stats.sorted.dropped.csv'
_n_deltablue = STATS_records * 1.0
stats 'ol/raytrace.ol.stats.sorted.dropped.csv'
_n_raytrace = STATS_records * 1.0

plot \
'ol/445.gobmk.ol.stats.sorted.dropped.csv'      u (column(0)/_n_gobmk):1 w lines ls 1 t _t_gobmk,\
'ol/450.soplex.ol.stats.sorted.dropped.csv'     u (column(0)/_n_soplex):1 w lines ls 2 t _t_soplex,\
'ol/454.calculix.ol.stats.sorted.dropped.csv'   u (column(0)/_n_calculix):1 w lines ls 3 t _t_calculix,\
'ol/462.libquantum.ol.stats.sorted.dropped.csv' u (column(0)/_n_libquntum):1 w lines ls 4 t _t_libquntum,\
'ol/471.omnetpp.ol.stats.sorted.dropped.csv'    u (column(0)/_n_omnetpp):1 w lines ls 5 t _t_omnetpp,\
'ol/483.xalancbmk.ol.stats.sorted.dropped.csv'  u (column(0)/_n_xalancbmk):1 w lines ls 6 t _t_xalancbmk,\
'ol/richards.ol.stats.sorted.dropped.csv'       u (column(0)/_n_richards):1 w lines ls 7 t _t_richards,\
'ol/deltablue.ol.stats.sorted.dropped.csv'      u (column(0)/_n_deltablue):1 w lines ls 8 t _t_deltablue,\
'ol/raytrace.ol.stats.sorted.dropped.csv'       u (column(0)/_n_raytrace):1 w lines ls 9 t _t_raytrace,\
;
