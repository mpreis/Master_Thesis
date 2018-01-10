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

set output _outdir.'compaction-'._bmk.'.eps'
# set title _bmk
set ylabel "compaction (more is better)\n(#variables of transformed trace) / (#variables of identity trace)"
set yrange [0:_yrangemax]
set ytics 5

fn(v) = sprintf("%.3f", v)

plot \
newhistogram "",\
  _datafile using "MIN+Liveness-compaction":xtic(1) notitle lt rgb "#7ca82b",\
         '' u 0:"MIN+Liveness-compaction":(fn(column("MIN+Liveness-compaction"))) with labels offset 0,\
              1 notitle lt rgb "#333333";

