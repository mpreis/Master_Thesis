set terminal postscript "Times-Roman" eps color

set border 3 front lt black linewidth 1.000 dashtype solid
set boxwidth 0.8 absolute
set style fill   solid 1.00 noborder
set grid nopolar
set grid noxtics nomxtics ytics nomytics noztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault  lt 0 linecolor 0 linewidth 0.500, lt 0 linecolor 0 linewidth 0.500
set nokey
set style histogram rowstacked title textcolor lt -1 offset character 2, 0.25
set datafile missing '-'
set style data histograms
set xtics border in scale 0,0 nomirror rotate by -45  autojustify
set xtics  norangelimit  font ",8"
set xtics   ()
set ytics border in scale 0,0 mirror norotate  autojustify
set ytics  norangelimit autofreq  font ",8"
set ztics border in scale 0,0 nomirror norotate  autojustify
set cbtics border in scale 0,0 mirror norotate  autojustify
set rtics axis in scale 0,0 nomirror norotate  autojustify

set datafile separator ","

set output './plots/perf-misses-'._bmk.'.eps'
# set title _bmk
set ylabel "circles per access (CPA)\n(less is better)"
set yrange [0:_yrangemax]
set ytics 5

plot \
newhistogram "LRU",\
 _datafile using (column("LRU-hits") * column("LRU-cpa")):xtic(1) t "cache hits" fs pattern 2 lt rgb "#7ca82b",\
              '' u (column("LRU-misses") * column("LRU-cpa")) t "cache misses" fs pattern 6 lt rgb "#dd1144",\
newhistogram "LRU+Liveness",\
              '' u (column("LRU+Liveness-hits") * column("LRU+Liveness-cpa")):xtic(1) notitle fs pattern 2 lt rgb "#7ca82b",\
              '' u (column("LRU+Liveness-misses") * column("LRU+Liveness-cpa")) notitle fs pattern 6 lt rgb "#dd1144",\
newhistogram "Belady",\
              '' u (column("Belady-hits") * column("Belady-cpa")):xtic(1) notitle fs pattern 2 lt rgb "#7ca82b",\
              '' u (column("Belady-misses") * column("Belady-cpa")) notitle fs pattern 6 lt rgb "#dd1144",\
newhistogram "Belady+Liveness",\
              '' u (column("Belady+Liveness-hits") * column("Belady+Liveness-cpa")):xtic(1) notitle fs pattern 2 lt rgb "#7ca82b",\
              '' u (column("Belady+Liveness-misses") * column("Belady+Liveness-cpa")) notitle fs pattern 6 lt rgb "#dd1144",\
;

