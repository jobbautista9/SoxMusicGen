#/bin/sh
./absorbed-curiosity.pl | tail -n +65 | xargs ../mysox.sh loop.wav

./absorbed-curiosity.pl | head -n +65 | xargs play
play loop.wav repeat $1
