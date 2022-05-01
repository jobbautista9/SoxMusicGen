#!/bin/sh
cat 00 \
    01 \
    02 \
    03/gg \
    03/gg \
    03/gg \
    03/aa \
    03/ga \
    03/ga \
    03/ga \
    03/therest \
    04-05-common \
    04 \
    04-05-common \
    05 |
../stdin/synths.pl 180 6 square square triangle square square sawtooth
