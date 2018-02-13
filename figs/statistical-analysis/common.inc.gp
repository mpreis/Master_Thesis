set terminal postscript 'Times-Roman' eps color
# set key bottom left

set logscale y
# unset xtics

set xlabel 'Percentage'

_gre='#7CA82B'
_yel='#FFCA28'
_ora='#EF8535'
_red='#DD1144'
_gra='#999999'

_t_gobmk     = '445.gobmk'
_t_soplex    = '450.soplex'
_t_calculix  = '454.calculix'
_t_libquntum = '462.libquantum'
_t_omnetpp   = '471.omnetpp'
_t_xalancbmk = '483.xalancbmk'
_t_richards  = 'richards'
_t_deltablue = 'deltablue'
_t_raytrace  = 'raytrace'

# highlights
set style line 1 lt 1 lc rgb _gre lw 3 pt 1 dashtype 1 # 445.gobmk
set style line 4 lt 4 lc rgb _yel lw 3 pt 4 dashtype 4 # 462.libquantum
set style line 5 lt 5 lc rgb _ora lw 3 pt 5 dashtype 5 # 471.omnetpp
set style line 6 lt 6 lc rgb _red lw 3 pt 7 dashtype 6 # 483.xalancbmk
# others
set style line 2 lt 2 lc rgb _gra lw 3 pt 2 dashtype 2 # 450.soplex
set style line 3 lt 3 lc rgb _gra lw 3 pt 3 dashtype 3 # 454.calculix
set style line 7 lt 7 lc rgb _gra lw 3 pt 7 dashtype 7 # richards
set style line 8 lt 8 lc rgb _gra lw 3 pt 8 dashtype 8 # deltablue
set style line 9 lt 9 lc rgb _gra lw 3 pt 9 dashtype 9 # raytrace
