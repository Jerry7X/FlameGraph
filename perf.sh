#!/bin/bash
perf record -F 300 -p $1 -g -- sleep 60
perf script -i perf.data &> perf.unfoldtmp
./stackcollapse-perf.pl perf.unfoldtmp &> perf.foldedtmp
./flamegraph.pl perf.foldedtmp > perf."$1".svg
rm ./perf.unfoldtmp
rm ./perf.foldedtmp
