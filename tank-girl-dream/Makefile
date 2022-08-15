all: foreground background
	sox -m foreground.wav background.wav "tank-girl-dream.wav"
foreground:
	perl foreground.pl | xargs ../mysox.sh foreground.wav
background:
	perl background.pl | xargs ../mysox.sh background.wav
clean:
	-rm -f *.wav
