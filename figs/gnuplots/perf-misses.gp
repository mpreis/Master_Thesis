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
set xtics border in scale 0,0 nomirror rotate by -60  autojustify
set xtics  norangelimit  font ",12"
set xtics   ()
set ytics border in scale 0,0 mirror norotate  autojustify
set ytics  norangelimit autofreq  font ",12"
set ztics border in scale 0,0 nomirror norotate  autojustify
set cbtics border in scale 0,0 mirror norotate  autojustify
set rtics axis in scale 0,0 nomirror norotate  autojustify

set datafile separator ","

set output _outdir.'perf-misses-'._bmk.'.eps'
# set title _bmk
set ylabel "Circles per Access (CPA)\n(less is better)"
set yrange [0:_yrangemax]
set ytics 5
set key

fn(v) = sprintf("%.2f", v)
yoffset = 0.025
xoffset = 6

plot \
newhistogram "MIN",\
  _datafile u (column("MIN-hits") * column("MIN-cpa")):xtic(1) notitle fs pattern 2 lt rgb "#7ca82b",\
  '' u (column("MIN-misses") * column("MIN-cpa")) notitle fs pattern 6 lt rgb "#dd1144",\
  '' u 0:"MIN-cpa":(fn(column("MIN-cpa"))) with labels font ",12" center offset first xoffset*0, graph yoffset notitle,\
newhistogram "MIN+Liveness",\
  '' u (column("MIN+Liveness-hits") * column("MIN+Liveness-cpa")):xtic(1) notitle fs pattern 2 lt rgb "#7ca82b",\
  '' u (column("MIN+Liveness-misses") * column("MIN+Liveness-cpa")) notitle fs pattern 6 lt rgb "#dd1144",\
  '' u 0:"MIN+Liveness-cpa":(fn(column("MIN+Liveness-cpa"))) with labels font ",12" center offset first xoffset*1, graph yoffset notitle,\
newhistogram "LRU",\
  '' u (column("LRU-hits") * column("LRU-cpa")):xtic(1) t "cache hits" fs pattern 2 lt rgb "#7ca82b",\
  '' u (column("LRU-misses") * column("LRU-cpa")) t "cache misses" fs pattern 6 lt rgb "#dd1144",\
  '' u 0:"LRU-cpa":(fn(column("LRU-cpa"))) with labels font ",12" center offset first xoffset*2, graph yoffset notitle,\
newhistogram "LRU+Liveness",\
  '' u (column("LRU+Liveness-hits") * column("LRU+Liveness-cpa")):xtic(1) notitle fs pattern 2 lt rgb "#7ca82b",\
  '' u (column("LRU+Liveness-misses") * column("LRU+Liveness-cpa")) notitle fs pattern 6 lt rgb "#dd1144",\
  '' u 0:"LRU+Liveness-cpa":(fn(column("LRU+Liveness-cpa"))) with labels font ",12" center offset first xoffset*3, graph yoffset notitle\
;
