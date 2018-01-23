set terminal postscript "Times-Roman" eps color

set border 3 front lt black linewidth 1.000 dashtype solid
set boxwidth 0.8 absolute
set style fill   solid 1.00 noborder
set grid nopolar
set grid noxtics nomxtics ytics nomytics noztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   lt 0 linecolor 0 linewidth 0.500,  lt 0 linecolor 0 linewidth 0.500
set nokey
set style histogram clustered gap 1 title textcolor lt -1 offset character 2, 0.25
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

set output _outdir.'/speedup-'._bmk.'.eps'
# set title _bmk
set ylabel "Speedup (more is better)\nCPA(Identity, Cache) / CPA(Allocator, Cache)"
set yrange [0:_yrangemax]
set ytics 0.5

fn(v) = sprintf("%.2f", v)
yoffset = 0.025
xoffset = 6

plot \
newhistogram "MIN",\
  _datafile using "MIN-speedup":xtic(1) notitle lt rgb "#7ca82b",\
         '' u 0:"MIN-speedup":(fn(column("MIN-speedup"))) with labels font ",12" center offset first xoffset*0, graph yoffset,\
newhistogram "MIN+Liveness",\
         '' u "MIN+Liveness-speedup":xtic(1) notitle lt rgb "#ffca28",\
         '' u 0:"MIN+Liveness-speedup":(fn(column("MIN+Liveness-speedup"))) with labels font ",12" center offset first xoffset*1, graph yoffset,\
newhistogram "LRU",\
         '' u "LRU-speedup":xtic(1) notitle lt rgb "#ef8535",\
         '' u 0:"LRU-speedup":(fn(column("LRU-speedup"))) with labels font ",12" center offset first xoffset*2, graph yoffset,\
newhistogram "LRU+Liveness",\
         '' u "LRU+Liveness-speedup":xtic(1) notitle lt rgb "#dd1144",\
         '' u 0:"LRU+Liveness-speedup":(fn(column("LRU+Liveness-speedup"))) with labels font ",12" center offset first xoffset*3, graph yoffset,\
              1 notitle lt rgb "#333333";

