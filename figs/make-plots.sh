OUTDIR="./figs/plots/"
# performance
for BMK in "445-gobmk" "450-soplex" "454-calculix" "462-libquantum" "471-omnetpp" "483-xalancbmk" "deltablue" "raytrace" "richards"
do
  if [ $BMK == "483-xalancbmk" ] ; then
    YRANGE_MAX=120
  elif [ $BMK == "462-libquantum" ] ; then
    YRANGE_MAX=6
  else
    YRANGE_MAX=65
  fi
  gnuplot -e "_bmk='$BMK'"\
          -e "_outdir='$OUTDIR'"\
          -e "_yrangemax=$YRANGE_MAX"\
          -e "_datafile='./figs/prepared-data/prepared-$BMK.csv'"\
          figs/gnuplots/perf.gp
  gnuplot -e "_bmk='$BMK'"\
          -e "_outdir='$OUTDIR'"\
          -e "_yrangemax=$YRANGE_MAX"\
          -e "_datafile='./figs/prepared-data/prepared-$BMK.csv'"\
          figs/gnuplots/perf-misses.gp
done

# speedup
for BMK in "445-gobmk" "450-soplex" "454-calculix" "462-libquantum" "471-omnetpp" "483-xalancbmk" "deltablue" "raytrace" "richards"
do
  YRANGE_MAX=4.5
  gnuplot -e "_bmk='$BMK'"\
          -e "_outdir='$OUTDIR'"\
          -e "_yrangemax=$YRANGE_MAX"\
          -e "_datafile='./figs/prepared-data/prepared-$BMK.csv'"\
          figs/gnuplots/speedup.gp
done

# compaction
for BMK in "445-gobmk" "450-soplex" "454-calculix" "462-libquantum" "471-omnetpp" "483-xalancbmk" "deltablue" "raytrace" "richards"
do
  YRANGE_MAX=40
  gnuplot -e "_bmk='$BMK'"\
          -e "_outdir='$OUTDIR'"\
          -e "_yrangemax=$YRANGE_MAX"\
          -e "_datafile='./figs/prepared-data/prepared-$BMK.csv'"\
          figs/gnuplots/compaction.gp
done

# # correlation
# for CACHE in "MIN" "MIN+Liveness" "LRU" "LRU+Liveness"
# do
#   if [ $CACHE == "MIN" ] ; then
#     SPEEDUP=3
#     COMPATION=4
#   elif [ $CACHE == "MIN+Liveness" ] ; then
#     SPEEDUP=12
#     COMPATION=13
#   elif [ $CACHE == "LRU" ] ; then
#     SPEEDUP=21
#     COMPATION=22
#   else
#     SPEEDUP=30
#     COMPATION=31
#   fi
#   gnuplot -e "_outdir='$OUTDIR'"\
#           -e "_cache='$CACHE'"\
#           -e "_compaction=$COMPATION"\
#           -e "_speedup=$SPEEDUP"\
#           figs/gnuplots/correlation.gp
# done

# correlation
for CACHE in "MIN" "MIN+Liveness" "LRU" "LRU+Liveness"
do
  if [ $CACHE == "MIN" ] ; then
    SPEEDUP=3
    COMPATION=4
  elif [ $CACHE == "MIN+Liveness" ] ; then
    SPEEDUP=12
    COMPATION=13
  elif [ $CACHE == "LRU" ] ; then
    SPEEDUP=21
    COMPATION=22
  else
    SPEEDUP=30
    COMPATION=31
  fi
  for ALLOCATOR in "CompactStack" "CompactQueue" "CompactSet" "SingleAssignment"
  do
    if [ $ALLOCATOR == "CompactStack" ] ; then
      COLOR="#7ca82b" # green
    elif [ $ALLOCATOR == "CompactRandom" ] ; then
      COLOR="#ffca28" # yellow
    elif [ $ALLOCATOR == "CompactQueue" ] ; then
      COLOR="#ef8535" # orange
    else
      COLOR="#dd1144" # red
    fi
    gnuplot -e "_outdir='$OUTDIR'"\
            -e "_cache='$CACHE'"\
            -e "_allocator='$ALLOCATOR'"\
            -e "_color='$COLOR'"\
            -e "_compaction=$COMPATION"\
            -e "_speedup=$SPEEDUP"\
            figs/gnuplots/correlation-single.gp
  done
done
