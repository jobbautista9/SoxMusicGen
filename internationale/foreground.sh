#!/bin/sh
DIR="foreground"
cat $DIR/verse1 \
    $DIR/verse2 \
    $DIR/verse1 \
    $DIR/verse3 \
    $DIR/verse4 \
    $DIR/dsdsdds $DIR/verse5 \
    $DIR/verse6/1 $DIR/dsdsdds $DIR/verse6/2 \
    $DIR/verse7 \
    $DIR/chorus/1 $DIR/chorus/2 |
../stdin/samples.pl 100 2 ../piano/ff
