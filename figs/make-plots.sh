for BMK in "445-gobmk" "450-soplex" "454-calculix" "462-libquantum" "471-omnetpp" "483-xalancbmk" "deltablue" "raytrace" "richards"
do
  if [ $BMK == "483-xalancbmk" ] ; then
    YRANGE_MAX=120
  else
    YRANGE_MAX=65
  fi
  gnuplot -e "_bmk='$BMK'"\
          -e "_yrangemax=$YRANGE_MAX"\
          -e "_datafile='./prepared-data/prepared-$BMK.csv'" gnuplots/perf.gp
  gnuplot -e "_bmk='$BMK'"\
          -e "_yrangemax=$YRANGE_MAX"\
          -e "_datafile='./prepared-data/prepared-$BMK.csv'" gnuplots/perf-misses.gp
done

for BMK in "445-gobmk" "450-soplex" "454-calculix" "462-libquantum" "471-omnetpp" "483-xalancbmk" "deltablue" "raytrace" "richards"
do
  if [ $BMK == "445-gobmk" ] || [ $BMK == "462-libquantum" ]; then
    YRANGE_MAX=4.5
  else
    YRANGE_MAX=2
  fi
  gnuplot -e "_bmk='$BMK'"\
          -e "_yrangemax=$YRANGE_MAX"\
          -e "_datafile='./prepared-data/prepared-$BMK.csv'" gnuplots/speedup.gp
done