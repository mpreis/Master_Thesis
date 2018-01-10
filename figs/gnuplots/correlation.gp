set terminal postscript "Times-Roman" eps color
set datafile separator ","

set output _outdir.'correlation-'._cache.'.eps'

# _compaction=_cache.'-compaction'
# _speedup=_cache.'-speedup'

df_path       = './figs/prepared-data/'
df_gobmk      = df_path.'prepared-445-gobmk.csv'
df_soplex     = df_path.'prepared-450-soplex.csv'
df_calculix   = df_path.'prepared-454-calculix.csv'
df_libquantum = df_path.'prepared-462-libquantum.csv'
df_omnetpp    = df_path.'prepared-471-omnetpp.csv'
df_xalancbmk  = df_path.'prepared-483-xalancbmk.csv'
df_deltablue  = df_path.'prepared-deltablue.csv'
df_raytrace   = df_path.'prepared-raytrace.csv'
df_richards   = df_path.'prepared-richards.csv'

set xrange[0.001:100]
set yrange[0.1:10]

set nokey

set logscale xy

green="#7ca82b"
yellow="#ffca28"
orange="#ef8535"
red="#dd1144"

NOXTICS = "set format x ''; unset xlabel"
XTICS = "set format x '%.0f';"
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f';"

TMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.55"
BMARGIN = "set tmargin at screen 0.55; set bmargin at screen 0.20"
LMARGIN = "set lmargin at screen 0.15; set rmargin at screen 0.55"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95"

_xlabel = "speedup (more is better)\n(CPA of transformed trace) / (CPA of identity trace)"
_ylabel = "compaction (more is better)\n(#variables of transformed trace) / (#variables of identity trace)\n"
set label 1 _xlabel at screen 0.55,0.13 center
set label 2 _ylabel at screen 0.07,0.55 rotate by 90 center

# set key at screen 0.55,screen 0.05 Left reverse maxrows 3 center font ",10"

set multiplot layout 2,2 rowsfirst

@TMARGIN; @LMARGIN
@NOXTICS; @YTICS
set title "CompactStack"
plot\
  '<(grep CompactStack     '.df_gobmk     .')' u _compaction:_speedup ls 1 lt rgb green  lw 3 t '445.gobmk'      ,\
  '<(grep CompactStack     '.df_soplex    .')' u _compaction:_speedup ls 2 lt rgb green  lw 3 t '450.soplex'     ,\
  '<(grep CompactStack     '.df_calculix  .')' u _compaction:_speedup ls 3 lt rgb green  lw 3 t '454.calculix'   ,\
  '<(grep CompactStack     '.df_libquantum.')' u _compaction:_speedup ls 4 lt rgb green  lw 3 t '462.libquantum' ,\
  '<(grep CompactStack     '.df_omnetpp   .')' u _compaction:_speedup ls 5 lt rgb green  lw 3 t '471.omnetpp'    ,\
  '<(grep CompactStack     '.df_xalancbmk .')' u _compaction:_speedup ls 6 lt rgb green  lw 3 t '483.xalancbmk'  ,\
  '<(grep CompactStack     '.df_deltablue .')' u _compaction:_speedup ls 7 lt rgb green  lw 3 t 'deltablue'      ,\
  '<(grep CompactStack     '.df_raytrace  .')' u _compaction:_speedup ls 8 lt rgb green  lw 3 t 'raytrace'       ,\
  '<(grep CompactStack     '.df_richards  .')' u _compaction:_speedup ls 9 lt rgb green  lw 3 t 'richards'       ,\
;
unset key
@TMARGIN; @RMARGIN
@NOXTICS; @NOYTICS
set title "CompactRandom"
plot\
  '<(grep CompactRandom    '.df_gobmk     .')' u _compaction:_speedup ls 1 lt rgb yellow lw 3 t '445.gobmk'      ,\
  '<(grep CompactRandom    '.df_soplex    .')' u _compaction:_speedup ls 2 lt rgb yellow lw 3 t '450.soplex'     ,\
  '<(grep CompactRandom    '.df_calculix  .')' u _compaction:_speedup ls 3 lt rgb yellow lw 3 t '454.calculix'   ,\
  '<(grep CompactRandom    '.df_libquantum.')' u _compaction:_speedup ls 4 lt rgb yellow lw 3 t '462.libquantum' ,\
  '<(grep CompactRandom    '.df_omnetpp   .')' u _compaction:_speedup ls 5 lt rgb yellow lw 3 t '471.omnetpp'    ,\
  '<(grep CompactRandom    '.df_xalancbmk .')' u _compaction:_speedup ls 6 lt rgb yellow lw 3 t '483.xalancbmk'  ,\
  '<(grep CompactRandom    '.df_deltablue .')' u _compaction:_speedup ls 7 lt rgb yellow lw 3 t 'deltablue'      ,\
  '<(grep CompactRandom    '.df_raytrace  .')' u _compaction:_speedup ls 8 lt rgb yellow lw 3 t 'raytrace'       ,\
  '<(grep CompactRandom    '.df_richards  .')' u _compaction:_speedup ls 9 lt rgb yellow lw 3 t 'richards'       ,\
;
@BMARGIN; @LMARGIN
@XTICS; @YTICS
set title "CompactQueue"
plot\
  '<(grep CompactQueue     '.df_gobmk     .')' u _compaction:_speedup ls 1 lt rgb orange lw 3 t '445.gobmk'      ,\
  '<(grep CompactQueue     '.df_soplex    .')' u _compaction:_speedup ls 2 lt rgb orange lw 3 t '450.soplex'     ,\
  '<(grep CompactQueue     '.df_calculix  .')' u _compaction:_speedup ls 3 lt rgb orange lw 3 t '454.calculix'   ,\
  '<(grep CompactQueue     '.df_libquantum.')' u _compaction:_speedup ls 4 lt rgb orange lw 3 t '462.libquantum' ,\
  '<(grep CompactQueue     '.df_omnetpp   .')' u _compaction:_speedup ls 5 lt rgb orange lw 3 t '471.omnetpp'    ,\
  '<(grep CompactQueue     '.df_xalancbmk .')' u _compaction:_speedup ls 6 lt rgb orange lw 3 t '483.xalancbmk'  ,\
  '<(grep CompactQueue     '.df_deltablue .')' u _compaction:_speedup ls 7 lt rgb orange lw 3 t 'deltablue'      ,\
  '<(grep CompactQueue     '.df_raytrace  .')' u _compaction:_speedup ls 8 lt rgb orange lw 3 t 'raytrace'       ,\
  '<(grep CompactQueue     '.df_richards  .')' u _compaction:_speedup ls 9 lt rgb orange lw 3 t 'richards'       ,\
;
@BMARGIN; @RMARGIN
@XTICS; @NOYTICS
set title "SingleAssignment"
set key at screen 0.9,screen 0.08 reverse Left maxrows 3
plot\
  '<(grep SingleAssignment '.df_gobmk     .')' u _compaction:_speedup ls 1 lt rgb red    lw 3 t '445.gobmk'      ,\
  '<(grep SingleAssignment '.df_soplex    .')' u _compaction:_speedup ls 2 lt rgb red    lw 3 t '450.soplex'     ,\
  '<(grep SingleAssignment '.df_calculix  .')' u _compaction:_speedup ls 3 lt rgb red    lw 3 t '454.calculix'   ,\
  '<(grep SingleAssignment '.df_libquantum.')' u _compaction:_speedup ls 4 lt rgb red    lw 3 t '462.libquantum' ,\
  '<(grep SingleAssignment '.df_omnetpp   .')' u _compaction:_speedup ls 5 lt rgb red    lw 3 t '471.omnetpp'    ,\
  '<(grep SingleAssignment '.df_xalancbmk .')' u _compaction:_speedup ls 6 lt rgb red    lw 3 t '483.xalancbmk'  ,\
  '<(grep SingleAssignment '.df_deltablue .')' u _compaction:_speedup ls 7 lt rgb red    lw 3 t 'deltablue'      ,\
  '<(grep SingleAssignment '.df_raytrace  .')' u _compaction:_speedup ls 8 lt rgb red    lw 3 t 'raytrace'       ,\
  '<(grep SingleAssignment '.df_richards  .')' u _compaction:_speedup ls 9 lt rgb red    lw 3 t 'richards'       ,\
;
unset multiplot;
