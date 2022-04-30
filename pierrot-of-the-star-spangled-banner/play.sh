PIERROT="pierrot-of-the-star-spangled-banner/"
cat $PIERROT/00 \
    $PIERROT/01 \
    $PIERROT/02 \
    $PIERROT/03/gg \
    $PIERROT/03/gg \
    $PIERROT/03/gg \
    $PIERROT/03/aa \
    $PIERROT/03/ga \
    $PIERROT/03/ga \
    $PIERROT/03/ga \
    $PIERROT/03/therest \
    $PIERROT/04-05-common \
    $PIERROT/04 \
    $PIERROT/04-05-common \
    $PIERROT/05 |
../stdin/synths.pl 180 6 square square triangle square square sawtooth |
xargs play
