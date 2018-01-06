set terminal postscript "Times-Roman" eps color

set border 3 front lt black linewidth 1.000 dashtype solid
set boxwidth 0.8 absolute
set style fill solid 2.00 noborder
set grid nopolar
set grid noxtics nomxtics ytics nomytics noztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault lt 0 linecolor 0 linewidth 0.5, lt 0 linecolor 0 linewidth 0.5
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

set output './plots/perf-'._bmk.'.eps'
# set title _bmk
set ylabel "circles per access (CPA)\n(less is better)"
set yrange [0:_yrangemax]
set ytics 5

plot \
newhistogram "LRU",\
 _datafile using (column("LRU-cl") * column("LRU-cpa")):xtic(1) t "Cache Load" fs pattern 1 lt rgb "#7ca82b",\
              '' u (column("LRU-cs") * column("LRU-cpa")) t "Cache Store"      fs pattern 2 lt rgb "#ffca28",\
              '' u (column("LRU-ml") * column("LRU-cpa")) t "Memory Load"      fs pattern 6 lt rgb "#ef8535",\
              '' u (column("LRU-ms") * column("LRU-cpa")) t "Memory Store"     fs pattern 7 lt rgb "#dd1144",\
newhistogram "LRU+Liveness",\
              '' u (column("LRU+Liveness-cl") * column("LRU+Liveness-cpa")):xtic(1) notitle fs pattern 1 lt rgb "#7ca82b",\
              '' u (column("LRU+Liveness-cs") * column("LRU+Liveness-cpa")) notitle         fs pattern 2 lt rgb "#ffca28",\
              '' u (column("LRU+Liveness-ml") * column("LRU+Liveness-cpa")) notitle         fs pattern 6 lt rgb "#ef8535",\
              '' u (column("LRU+Liveness-ms") * column("LRU+Liveness-cpa")) notitle         fs pattern 7 lt rgb "#dd1144",\
newhistogram "Belady",\
              '' u (column("Belady-cl") * column("Belady-cpa")):xtic(1) notitle fs pattern 1  lt rgb "#7ca82b",\
              '' u (column("Belady-cs") * column("Belady-cpa")) notitle         fs pattern 2  lt rgb "#ffca28",\
              '' u (column("Belady-ml") * column("Belady-cpa")) notitle         fs pattern 6  lt rgb "#ef8535",\
              '' u (column("Belady-ms") * column("Belady-cpa")) notitle         fs pattern 7  lt rgb "#dd1144",\
newhistogram "Belady+Liveness",\
              '' u (column("Belady+Liveness-cl") * column("Belady+Liveness-cpa")):xtic(1) fs pattern 1  notitle lt rgb "#7ca82b",\
              '' u (column("Belady+Liveness-cs") * column("Belady+Liveness-cpa"))         fs pattern 2  notitle lt rgb "#ffca28",\
              '' u (column("Belady+Liveness-ml") * column("Belady+Liveness-cpa"))         fs pattern 6  notitle lt rgb "#ef8535",\
              '' u (column("Belady+Liveness-ms") * column("Belady+Liveness-cpa"))            notitle lt rgb "#dd1144",\
;

