set terminal postscript "Times-Roman" eps color

set border 3 front lt black linewidth 1.000 dashtype solid
set boxwidth 0.8 absolute
set style fill   solid 1.00 noborder
set grid nopolar
set grid noxtics nomxtics ytics nomytics noztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   lt 0 linecolor 0 linewidth 0.500,  lt 0 linecolor 0 linewidth 0.500
set nokey
# set style histogram rowstacked title textcolor lt -1 offset character 2, 0.25
set style histogram clustered gap 1 title textcolor lt -1 offset character 2, 0.25
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

set output './plots/speedup-'._bmk.'.eps'
# set title _bmk
set ylabel "speedup\n(CPA of transformed trace) / (CPA of identity trace)\n(more is better)"
set yrange [0:_yrangemax]
set ytics 0.5

plot \
newhistogram "Belady+Liveness",\
  _datafile using "Belady+Liveness-speedup":xtic(1) notitle lt rgb "#7ca82b",\
newhistogram "Belady",\
         '' u "Belady-speedup":xtic(1) notitle lt rgb "#ffca28",\
newhistogram "LRU",\
         '' u "LRU-speedup":xtic(1) notitle lt rgb "#ef8535",\
newhistogram "LRU+Liveness",\
         '' u "LRU+Liveness-speedup":xtic(1) notitle lt rgb "#dd1144",\
              1 notitle lt rgb "#333333";

