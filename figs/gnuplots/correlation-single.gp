set terminal postscript "Times-Roman" eps color
set datafile separator ","

set xlabel "Compaction (more is better)\n#Addresses(Identity, Cache) / #Addresses(Allocator, Cache)\n"
set ylabel "Speedup (more is better)\nCPA(Identity, Cache) / CPA(Allocator, Cache)"

set output _outdir.'correlation-'._cache.'-'._allocator.'.eps'

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

# set xrange[0:10]
# set yrange[0:10]

set xrange[0.001:1000]
set yrange[0.01:100]

set logscale xy

set key reverse Left outside bottom center maxrows 3

f(x) = x

set arrow 1 from 1,0.01 to 1,100 nohead lt rgb "#cccccc" lw 0.75

_color="#A7AAA9"

plot\
'<(grep '._allocator.' '.df_gobmk     .')' u _compaction:_speedup lt rgb "#7ca82b" lw 5 t '445.gobmk'      ,\
'<(grep '._allocator.' '.df_soplex    .')' u _compaction:_speedup lt rgb _color lw 5 t '450.soplex'     ,\
'<(grep '._allocator.' '.df_calculix  .')' u _compaction:_speedup lt rgb _color lw 5 t '454.calculix'   ,\
'<(grep '._allocator.' '.df_libquantum.')' u _compaction:_speedup lt rgb "#ffca28" lw 5 t '462.libquantum' ,\
'<(grep '._allocator.' '.df_omnetpp   .')' u _compaction:_speedup lt rgb "#ef8535" lw 5 t '471.omnetpp'    ,\
'<(grep '._allocator.' '.df_xalancbmk .')' u _compaction:_speedup lt rgb "#dd1144" lw 5 t '483.xalancbmk'  ,\
'<(grep '._allocator.' '.df_deltablue .')' u _compaction:_speedup lt rgb _color lw 5 t 'deltablue'      ,\
'<(grep '._allocator.' '.df_raytrace  .')' u _compaction:_speedup lt rgb _color lw 5 t 'raytrace'       ,\
'<(grep '._allocator.' '.df_richards  .')' u _compaction:_speedup lt rgb _color lw 5 t 'richards'       ,\
1 lt rgb "#cccccc" notitle\
;

# plot\
# '<(grep '._allocator.' '.df_gobmk     .')' u _compaction:_speedup lt rgb _color lw 5 t '445.gobmk'      ,\
# '<(grep '._allocator.' '.df_soplex    .')' u _compaction:_speedup lt rgb _color lw 5 t '450.soplex'     ,\
# '<(grep '._allocator.' '.df_calculix  .')' u _compaction:_speedup lt rgb _color lw 5 t '454.calculix'   ,\
# '<(grep '._allocator.' '.df_libquantum.')' u _compaction:_speedup lt rgb _color lw 5 t '462.libquantum' ,\
# '<(grep '._allocator.' '.df_omnetpp   .')' u _compaction:_speedup lt rgb _color lw 5 t '471.omnetpp'    ,\
# '<(grep '._allocator.' '.df_xalancbmk .')' u _compaction:_speedup lt rgb _color lw 5 t '483.xalancbmk'  ,\
# '<(grep '._allocator.' '.df_deltablue .')' u _compaction:_speedup lt rgb _color lw 5 t 'deltablue'      ,\
# '<(grep '._allocator.' '.df_raytrace  .')' u _compaction:_speedup lt rgb _color lw 5 t 'raytrace'       ,\
# '<(grep '._allocator.' '.df_richards  .')' u _compaction:_speedup lt rgb _color lw 5 t 'richards'       ,\
# 1 lt rgb "#cccccc" notitle\
# ;
  # f(x) lt rgb "#cccccc" notitle, \

