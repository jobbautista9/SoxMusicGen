#!/bin/sh
cat verse1 \
    verse2 \
    verse1 \
    verse3 \
    verse4 \
    dsdsdds verse5 \
    verse6/1 dsdsdds verse6/2 \
    verse7 \
    chorus/1 chorus/2 |
../stdin/samples.pl 100 4 2 ../piano/ff
