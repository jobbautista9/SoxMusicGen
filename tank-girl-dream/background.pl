#!/usr/bin/env perl

use warnings;
use strict;

=begin
Copyright (C) 2022 Job Bautista

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=cut

use lib '..';
use SoXMusicGen;

our @notes;

setTempo(161);
setDefaultSynthType("square", "square", "square");
our $maxSynthChannels=3;

# Intro, part 1
sub intro1 {
 sub amisc {
  push (@notes, "$ha:A3/$_[0]3");
 }
 sub fsed {
  amisc("F#");
  amisc("E");
  amisc("D");
 }
 fsed(); amisc("E");
 fsed(); push (@notes, "$ha:G#3/F3");
 fsed(); amisc("E");
 fsed();
 push @notes, (
  "$qu:G#3/F#3",
  "$qu:G#3/F3"
 );
}

# Intro, part 2
sub intro2 {
 for (iterate(1,4)) {
  push @notes, (
   "$ha:F3/A#2",
   "$ha:D#3/G#2",
   "$ha:C#3/F#2",
   "$ha:D#3/G#2",
  );
 }
}

intro1(); intro2();
intro1(); intro2();

# Supposed to be a full note which would be 1.49,
# but getting desync for some reason
silence(1.45);

# Verse 1
sub asgsfs {
 push @notes, (
  "$fu:A#3/F3/C#3",
  "$fu:G#3/D#3/C3",
  "$fu:F#3/C#3/A#2"
 );
}
asgsfs(); push (@notes, "1.48:A3/F3/C3");
asgsfs(); push (@notes, "1.48:C4/D#3/C3");
asgsfs(); push (@notes, "1.48:A3/F3/C3");
asgsfs(); push (@notes, "1.48:C4/D#3/C3");

# Verse 2
sub gfds {
 push @notes, (
  "$fu:G3/D3/A#2",
  "$fu:F3/C3/A2",
  "$fu:D#3/A#2/G2"
 );
}
gfds(); push (@notes, "1.48:F#3/D3/A2");
gfds(); push (@notes, "1.48:A3/C3/A2");
gfds(); push (@notes, "1.48:F#3/D3/A2");
gfds(); push (@notes, "1.48:A3/C3/A2");

# Verse 3
sub gsdsb {
 push @notes, (
  "$fu:G#3/D#3/B2",
  "$fu:F#3/C#3/A#2",
  "$fu:E3/B2/G#2"
 );
}
gsdsb(); push (@notes, "1.48:G3/D#3/A#2");
gsdsb(); push (@notes, "1.48:A#3/C#3/A#2");
gsdsb(); push (@notes, "1.48:G3/D#3/A#2");
gsdsb(); push (@notes, "1.48:A#3/C#3/A#2");

# Verse 4
sub casgs {
 push @notes, (
  "$fu:C4/G3/D#3",
  "$fu:A#3/F3/D3",
  "$fu:G#3/D#3/C3"
 );
}
casgs(); push (@notes, "1.48:B3/G3/D3");
casgs(); push (@notes, "1.48:D4/F3/D3");
casgs(); push (@notes, "$fu:B3/G3/D3");
casgs(); push (@notes, "$fu:D4/F3/D3");

createSynths();
