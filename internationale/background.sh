#!/bin/sh
DIR="background"
(echo "\$qu:0";
 cat $DIR/verse1 \
     $DIR/verse2 \
     $DIR/verse1 \
     $DIR/verse3 ;
 echo "\$qu:0";
 cat $DIR/dasg $DIR/dasg $DIR/dasg \
     $DIR/dasg $DIR/dasf $DIR/verse5 \
     $DIR/verse6 \
     $DIR/verse7 \
     $DIR/chorus/1 $DIR/chorus/2 \
) | ../stdin/samples.pl 100 2 ../piano/ff
