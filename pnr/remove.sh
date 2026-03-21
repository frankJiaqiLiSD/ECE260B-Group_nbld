rm -r ./.cadence/
rm -r ./constraints/
rm -r ./*.enc.dat/
rm -r ./summaryReport/
rm -r ./timingReports
rm ./innovus.log*
rm ./innovus.cmd*
rm ./model.*
rm ./*.lib
rm ./*.sdf
rm ./*.rpt
rm ./*.enc
rm ./*.rpt.old
rm ./*.def
rm ./*.lef
rm ./*.pnr.v
rm ./*.map
rm ./*.gds2
#pwd | sed -E 's|([^/]+)$|\1/\1\*|g' | rm
