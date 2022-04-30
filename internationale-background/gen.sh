#!/bin/sh
(echo "\$qu:0";
 cat verse1 \
     verse2 \
     verse1 \
     verse3 ;
 echo "\$qu:0";
 cat dasg dasg dasg \
     dasg dasf verse5 \
     verse6 \
     verse7 \
     chorus/1 chorus/2 \
) | ../stdin/samples.pl 100 4 2 ../piano/ff