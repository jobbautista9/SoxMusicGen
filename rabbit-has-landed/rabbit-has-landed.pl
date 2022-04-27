#!/usr/bin/env perl

use warnings;
use strict;

=begin
Copyright (C) 2022 Job Bautista

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and a#sociated documentation files (the "Software"), to deal in
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
our $maxSynthChannels=6;
setTempo(155);
setDefaultSynthType("square", "square",
                    "square", "square",
                    "square", "square"); # sine synth struggles with 6 channels

# intro
sub ee4h {
 for (iterate(1,2)) {
  push (@notes, "$ei:$_[0]$_[3]/$_[1]$_[4]/$_[2]$_[5]/$_[0]$_[6]");
 }
}
ee4h("b", "f#", "d", 3, 3, 3, 2);
push (@notes, "$qu:b4/f#4/d4");
ee4h("a", "f#", "d", 3, 3, 3, 2);
push (@notes, "$qu:a4/f#4/d4");
push @notes, (
 "$dei:g#4/e4",
 "$dei:a4/e4",
 "$ei:g#4/e4",
 "$ha:f#4/c#4"
);
ee4h("b", "f#", "d", 3, 3, 3, 2);
push @notes, (
 "$ei:f#4/c#4",
 "$ei:a4/e4",
 "$ei:b4/f#4",
 "$ei:c#5/f#4",
 "$qu:a4/f#4",
 "$dei:g#4/e4",
 "$dei:a4/f#4",
 "$ei:b4/g#4",
 "$ha:c#5/a#4/f#4"
);
ee4h("e", "b", "g", 4, 3, 3, 3);
push (@notes, "$qu:e5/b4/g4");
ee4h("d", "b", "g", 4, 3, 3, 3);
push (@notes, "$qu:d5/b4/g4");
push @notes, (
 "$dei:c#5/a4",
 "$dei:d5/a4",
 "$ei:c#5/a4",
 "$ha:b4/f#4"
);
ee4h("e", "b", "g", 4, 3, 3, 3);
push @notes, (
 "$ei:b4/f#4",
 "$ei:d5/a4",
 "$ei:e5/b4",
 "$ei:f#5/b4",
 "$qu:d5/b4",
 "$dei:c#5/a4",
 "$dei:d5/b4",
 "$ei:e5/c#5",
 "$ha:f#5/d#5/b4"
);

# verse 1
push @notes, (
 "$ei:a4/a3",
 "$ei:e5",
 "$ei:f#5/a3",
 "$si:a4/f#4/d4",
 "$si:c#5",
 "$ei:f#5/a3",
 "$ei:g#5",
 "$ei:b4/a3",
 "$ei:g#5",
 "$ha:a5/e5",

 "$dsi:b3",
 "$tsi:g5",
 "$ei:g#5",
 "$ei:e5",
 "$ei:b4",

 "$ei:g#4/g#3",
 "$ei:c#5",
 "$ei:e5/g#3",
 "$si:b4/e4/c#4",
 "$si:c#5",
 "$ei:f5/g#3",
 "$ei:b5",
 "$ei:f5",
 "$ei:g#5",
 "$dqu:a5",
 "$dqu:g#5",
 "$qu:e5",

 "$ei:a4/f#3",
 "$ei:e5",
 "$ei:f#5/f#3",
 "$si:a4/d4/a3",
 "$si:e5",
 "$ei:f#5/f#3",
 "$ei:g#5",
 "$ei:b4/f#3",
 "$ei:f#5",
 "$dei:g#5",
 "$dei:a5",
 "$ei:b5",

 "$dsi:g#3",
 "$tsi:g5",
 "$ei:g#5",
 "$ei:f#5/g#3",
 "$ei:g#5",
 "$ei:f5/g#3",
 "$ei:g#5",
 "$ei:c#6/g#3",
 "$ei:f5",
 "$ei:g#5/g#3",
 "$ei:c#6",
 "$ei:f5/g#3",
 "$ei:g#5",
 "$dqu:b5",
 ".967:a5" # half + eighth note
);

# verse 2
push @notes, (
 "$ei:a4/f#4",
 "$ei:e5/a4",
 "$ei:f#5/d5",
 "$si:a4/d3",
 "$si:c#5",
 "$ei:f#5/c#5",
 "$ei:g#5/e5",
 "$ei:b4/f#4",
 "$ei:g#5/e5",
 "$ha:a5/e5/b4",

 "$si:c#4",
 "$tsi:b3",
 "$tsi:g5",
 "$ei:g#5/e5",
 "$ei:e5/b4",
 "$ei:b4/g#4",
 "$ei:g#4",
 "$ei:c#5/g#4",
 "$ei:e5/c#5",
 "$si:b4/g#3",
 "$si:c#5/c#4",
 "$ei:f5/c#5",
 "$ei:b5/f5",
 "$ei:f5/c#5",
 "$ei:g#5/f5",
 "$dqu:a5/f#5",
 "$dqu:g#5/e5",
 "$qu:e5/b4",

 "$ei:a4/f#4",
 "$ei:e5/c#5",
 "$ei:f#5/d5",
 "$si:a4/f#3",
 "$si:e5/a3",
 "$ei:f#5/d5",
 "$ei:g#5/e5",
 "$ei:b4/g#4",
 "$ei:f#5/d5",
 "$dei:g#5/e5",
 "$dei:a5/f#5",
 "$ei:b5/g#5",

 "$dsi:g#3",
 "$tsi:g5",
 "$ei:g#5/e5",
 "$ei:f#5/c#5",
 "$ei:g#5/e5",
 "$ei:f5/c#5",
 "$ei:g#5/f5",
 "$ei:c#6/g#5",
 "$ei:f5/c#5",
 "$ei:g#5/f5",
 "$ei:c#6/g#5",
 "$ei:f5/c#5",
 "$ei:g#5/f5",
 "$dqu:b5/g#5",
 ".967:a5/f#5"
);

# verse 3
push @notes, (
 "$qu:g4/d#4/a#3/g3",
 "$ei:d5/g4/d#4",
 "$ei:d5/a#3",
 "$ei:c5/f3",
 "$ei:c5/c4/a3",
 "$ei:c5",
 "$ei:c5"
);
sub verse3common1 {
 push @notes, (
  "$dei:g4/d4/a#3/g3/d3",
  "$dei:c5",
  "$ei:d5",
  "$dei:f5",
  "$dei:d5",
  "$ei:c5",

  "$qu:g4",
  "$qu:d5",
  "$ei:c5/f3",
  "$ei:c5/c3",
  "$ei:c5/a3/f3",
  "$ei:c5/a3/f3"
 )
}
verse3common1();
push @notes, (
 "$dei:g4",
 "$dei:c5",
 "$ei:d5/g3",
 "$si:g5/a#3/g3",
 "$si:f5/d4",
 "$si:g5/g3",
 "$si:f5",
 "$ei:d5/d4/a#3/g3",
 "$ei:a#4/g3/d3",

 "$qu:g4",
 "$ei:d5/g4/d#4",
 "$ei:d5/a#3",
 "$ei:c5/f3",
 "$ei:c5/c4/a3",
 "$ei:c5",
 "$ei:c5"
);
verse3common1();
push @notes, (
 "$dei:g4",
 "$dei:c5",
 "$ei:d5/g3",
 "$dei:g5",
 "$dei:g6",
 "$ei:d6/d4/a#3/g3"
);
sub verse3common2 {
 push @notes, (
  "$qu:g4/d#4",
  "$ei:d5/a#4/d#3",
  "$ei:d5/a#4",
  "$ei:c5/a4/f3",
  "$ei:c5/a4",
  "$ei:c5/a4/f3",
  "$ei:c5/a4",

  "$dei:g4/d4",
  "$dei:c5/g4",
  "$ei:d5/a#4",
  "$dei:f5/d5",
  "$dei:d5/a#4",
  "$ei:c5/g4",

  "$qu:g4/d#4",
  "$qu:d5/a#4",
  "$ei:c5/a4/f3",
  "$ei:c5/a4",
  "$ei:c5/a4/f3",
  "$ei:c5/a4"
 )
}
verse3common2();
push @notes, (
 "$dei:g4/d4",
 "$dei:c5/g4",
 "$ei:d5/a#4",
 "$si:g5/d5",
 "$si:f5",
 "$si:g5/d5/a#3/g3",
 "$si:f5",
 "$ei:d5/a#4",
 "$ei:a#4/g4"
);
verse3common2();
push @notes, (
 "$dei:g4",
 "$dei:c5",
 "$ei:d5",
 "$dei:g5",
 "$dei:g6",
 "$ei:d6"
);

# verse 4
push @notes, (
 "$ei:f#4/f#3",
 "$ei:c#5",
 "$ei:d#5/f#3",
 "$si:f#4/d#4/b3",
 "$si:a#4",
 "$ei:d#5/f#3",
 "$ei:f5",
 "$ei:g#4/f#3",
 "$ei:f5",
 "$ha:f#5/c#5",

 "$dsi:g#3",
 "$tsi:e5",
 "$ei:f5",
 "$ei:c#5",
 "$ei:g#4",

 "$ei:f4/f3",
 "$ei:a#4",
 "$ei:c#5/f3",
 "$si:g#4/c#4/a#3",
 "$si:a#4",
 "$ei:d5/f3",
 "$ei:g#5",
 "$ei:d5",
 "$ei:f5",
 "$dqu:f#5",
 "$dqu:f5",
 "$qu:c#5",

 "$ei:f#4/d#3",
 "$ei:c#5",
 "$ei:d#5/d#3",
 "$si:f#4/b3/f#3",
 "$si:c#5",
 "$ei:d#5/d#3",
 "$ei:f5",
 "$ei:g#4/d#3",
 "$ei:d#5",
 "$dei:f5",
 "$dei:f#5",
 "$ei:g#5",

 "$dsi:f3",
 "$tsi:e5",
 "$ei:f5",
 "$ei:d#5",
 "$ei:f5",

 "$ei:d5/f3",
 "$ei:f5",
 "$ei:a#5/f3",
 "$ei:d5",
 "$ei:f5/f3",
 "$ei:a#5",
 "$ei:d5/f3",
 "$ei:f5",
 "$dqu:g#5",
 ".967:f#5",

 "$ei:f#4/d#4",
 "$ei:c#5/f#4",
 "$ei:d#5/b4",
 "$si:f#4/b3",
 "$si:a#4/d#3",
 "$ei:d#5/a#4",
 "$ei:f5/c#5",
 "$ei:g#4/d#4",
 "$ei:f5/c#5",
 "$ha:f#5/c#5/g#4",

 "$si:a#3",
 "$tsi:c#3",
 "$tsi:e5",
 "$ei:f5/c#5",
 "$ei:c#5/g#4",
 "$ei:g#4/f4",

 "$ei:f4",
 "$ei:a#4/f4",
 "$ei:c#5/a#4",
 "$si:g#4/f3",
 "$si:a#4/a#3",
 "$ei:d5/a#4",
 "$ei:g#5/d5",
 "$ei:d5/a#4",
 "$ei:f5/d5",
 "$dqu:f#5/d#5",
 "$dqu:f5/c#5",
 "$qu:c#5/g#4",

 "$ei:f#4/d#4",
 "$ei:c#5/a#4",
 "$ei:d#5/b4",
 "$si:f#4/d#3",
 "$si:c#5/f#3",
 "$ei:d#5/b4",
 "$ei:f5/c#5",
 "$ei:g#4/f4",
 "$ei:d#5/b4",
 "$dei:f5/c#5",
 "$dei:f#5/d#5",
 "$ei:g#5/f5",

 "$si:f3",
 "$tsi:g#3",
 "$tsi:e5",
 "$ei:f5/c#5",
 "$ei:d#5/a#4",
 "$ei:f5/c#5",

 "$ei:d5/a#4",
 "$ei:f5/d5",
 "$ei:a#5/f5",
 "$ei:d5/a#4",
 "$ei:f5/d5",
 "$ei:a#5/f5",
 "$ei:d5/a#4",
 "$ei:f5/d5",
 "$dqu:g#5/f5",
 ".967:f#5/d#5"
);

# verse 5
push @notes, (
 "$qu:e4/c4/c3",
 "$ei:b4/g4",
 "$ei:b4/g4",
 "$ei:a4/f#4/d3",
 "$ei:a4/f#4/d3",
 "$ei:a4/f#4/f#3",
 "$ei:a4/f#4/d3",

 "$dei:e4/b3",
 "$dei:a4/e4",
 "$ei:b4/g4",
 "$dei:b6/b5/d5/b4",
 "$dei:b4/g4",
 "$ei:a4/e4",

 "$qu:e4/c4",
 "$qu:b4/g4/e3/c3",
 "$ei:a6/a5/a4/f#4/d4/a3",
 "$ei:a4/f#4/d4/a3",
 "$ei:d6/a4/f#4/d4/a3",
 "$ei:a4/f#4/d4/a3",

 "$dei:f#6/f#5/e4/b3",
 "$dei:g6/g5/a4/e4",
 "$ei:a6/a5/b4/g4",
 "$dei:g6/g5",
 "$dei:f#6/f#5",
 "$ei:b5/b4/g4/e4",

 "$qu:e4/b3",
 "$ei:b4/g4",
 "$ei:b4/g4",
 "$ei:a4/f#4",
 "$ei:a4/f#4",
 "$ei:a4/f#4",
 "$ei:a4/f#4",

 "$dei:e4/b3",
 "$dei:a4/e4",
 "$ei:b4/g4/g3/e3",
 "$dei:d5/b4",
 "$dei:b4/g4/g3/e3",
 "$ei:a4/e4/g3/e3",

 "$qu:e4/c4/e3/c3/g2",
 "$qu:b6/b5/b4/g4/c4",
 "$ei:a4/f#4/a3",
 "$ei:a4/f#4/a3",
 "$ei:a6/a5/a4/f#4/a3",
 "$ei:a4/f#4/a3",

 "$dei:g6/g5/b4/e4",
 "$dei:a6/a5/e5/a4",
 "$ei:b6/b5/g5/b4",
 "$ei:e6/b5/e5"
);
push (@notes, "$si:e3/e2");
silence("$si");
push (@notes, "$si:e3/e2");
silence("$si");
push (@notes, "$si:e3/e2");
silence("$si");

# verse 6 which is almost like intro
ee4h("b", "f#", "d", 3, 3, 3, 2);
push (@notes, "$qu:b4/f#4/d4");
ee4h("a", "f#", "d", 3, 3, 3, 2);
push (@notes, "$qu:a4/f#4/d4");
push @notes, (
 "$dei:g#4/e4",
 "$dei:a4/e4",
 "$ei:g#4/e4",
 "$ha:f#4/c#4"
);
ee4h("b", "f#", "d", 3, 3, 3, 2);
push @notes, (
 "$ei:f#4/c#4",
 "$ei:a4/e4",
 "$ei:b4/f#4/a3/f#3",
 "$ei:c#5/f#4/a3/f#3",
 "$qu:a4/f#4",
 "$dei:g#4/e4",
 "$dei:a4/f#4",
 "$ei:b4/g#4",
 "$ha:c#5/a#4/f#4/c#4"
);
ee4h("e", "b", "g", 4, 3, 3, 3);
push (@notes, "$qu:g5/e5/b4/g4");
ee4h("d", "b", "g", 4, 3, 3, 3);
push (@notes, "$qu:g5/d5/b4/g4");
push @notes, (
 "$dei:c#5/a4",
 "$dei:d5/a4",
 "$ei:c#5/a4",
 "$ha:b4/f#4",
);
ee4h("e", "b", "g", 4, 3, 3, 3);
push @notes, (
 "$ei:e5/b4/f#4",
 "$ei:e5/d4/a4",
 "$ei:e5/b4/d4/b3/g3/d3",
 "$ei:f#5/b4/d4/b3/g3/d3",
 "$qu:d5/b4/f#4",
 "$dei:c#5/a4/e4",
 "$dei:d5/b4/f#4",
 "$ei:e5/c#5/a4",
 "$ha:f#5/d#5/b4/f#4",
);

# verse 7 which is almost like verse 1
push @notes, (
 "$ei:a4/a2",
 "$ei:e5",
 "$ei:f#5/a2",
 "$si:a4/a3/f#3/d4",
 "$si:c#5",
 "$ei:f#5/a2",
 "$ei:g#5",
 "$ei:b4/a2",
 "$ei:g#5",
 "$ha:a5/e5",

 "$dsi:b2",
 "$tsi:g5",
 "$ei:g#5",
 "$ei:e5",
 "$ei:b4",

 "$ei:g#4/g#2",
 "$ei:c#5",
 "$ei:e5/g#2",
 "$si:b4/g#3/e3/c#3",
 "$si:c#5",
 "$ei:f5/g#2",
 "$ei:b5",
 "$ei:f5",
 "$ei:g#5",
 "$dqu:a5",
 "$dqu:g#5",
 "$qu:e5",

 "$ei:a4/f#2",
 "$ei:e5",
 "$ei:f#5/f#2",
 "$si:a4/f#3/d3/a2",
 "$si:e5",
 "$ei:f#5/f#2",
 "$ei:g#5",
 "$ei:b4/f#2",
 "$ei:f#5",
 "$dei:g#5",
 "$dei:a5",
 "$ei:b5",

 "$dsi:g#2",
 "$tsi:g5",
 "$ei:g#5",
 "$ei:f#5/g#2",
 "$ei:g#5",
 "$ei:f5/g#2",
 "$ei:g#5",
 "$ei:c#6/g#2",
 "$ei:f5",
 "$ei:g#5/g#2",
 "$ei:c#6",
 "$ei:f5/g#2",
 "$ei:g#5",
 "$dqu:b5",
 ".967:a5"
);

# verse 8 which is almost like verse 2
push @notes, (
 "$ei:a4/f#4/a2",
 "$ei:e5/a4",
 "$ei:f#5/d5/a2",
 "$si:a4/a3/f#3/d3",
 "$si:c#5",
 "$ei:f#5/c#5/a2",
 "$ei:g#5/e5",
 "$ei:b4/f#4/a2",
 "$ei:g#5/e5",
 "$ha:a5/e5/b4",

 "$dsi:b2",
 "$tsi:g5",
 "$ei:g#5/e5",
 "$ei:e5/b4",
 "$ei:b4/g#4",

 "$ei:g#4/g#2",
 "$ei:c#5/g#4",
 "$ei:e5/c#5/g#2",
 "$si:b4/g#3/e3/c#3",
 "$si:c#5",
 "$ei:f5/c#5/g#2",
 "$ei:b5/f5",
 "$ei:f5/c#5",
 "$ei:g#5/f5",
 "$dqu:a5/f#5",
 "$dqu:g#5/e5",
 "$qu:e5/b4",

 "$ei:a4/f#4/f#2",
 "$ei:e5/c#5",
 "$ei:f#5/d5/f#2",
 "$si:a4/f#3/d3/a2",
 "$si:e5",
 "$ei:f#5/d5/f#2",
 "$ei:g#5/e5",
 "$ei:b4/g#4/f#2",
 "$ei:f#5/d5",
 "$dei:g#5/e5",
 "$dei:a5/f#5",
 "$ei:b5/g#5",

 "$dsi:g#2",
 "$tsi:g5",
 "$ei:g#5/e5",
 "$ei:f#5/c#5/g#2",
 "$ei:g#5/e5",
 "$ei:f5/c#5/g#2",
 "$ei:g#5/f5",
 "$ei:c#6/g#5/g#2",
 "$ei:f5/c#5",
 "$ei:g#5/f5/g#2",
 "$ei:c#6/g#5",
 "$ei:f5/c#5/g#2",
 "$ei:g#5/f5",
 "$dqu:b5/g#5",
 ".967:a5/f#5"
);

# verse 9 which is a higher pitched verse 3
push @notes, (
 "$qu:g5/d#5/d#4/a#4/g4",
 "$ei:d6/a#5/g4/d#4",
 "$ei:d6/a#5/a#3",
 "$ei:c6/a5/f3",
 "$ei:c6/a5/c4/a3",
 "$ei:c6/a5",
 "$ei:c6/a5",
);
sub verse9common1 {
 push @notes, (
  "$dei:g5/d5",
  "$dei:c6/g5",
  "$ei:d6/a#5",
  "$dei:f6/d6",
  "$dei:d6/a#5",
  "$ei:c6/g5"
 );
}
verse9common1();
push @notes, (
 "$qu:g5/d#5",
 "$qu:d6/a#5",
 "$ei:c6/a5/f5/c5/f3",
 "$ei:c6/a5/f5/c5/c3",
 "$ei:c6/a5/f5/c5/a3/f3",
 "$ei:c6/a5/f5/c5/a3/f3",

 "$dei:g5/d5",
 "$dei:c6/g5",
 "$ei:d6/a#5/g3",
 "$si:g6/d6/a#3",
 "$si:f6/d4",
 "$si:g6/d6",
 "$si:f6",
 "$ei:d6/a#5/d4/a#3/g3",
 "$ei:a#5/g5/g3/d3",

 "$qu:g5/d5",
 "$ei:d6/a#5/g4/d#4",
 "$ei:d6/a#5/a#3",
 "$ei:c6/a5/f3",
 "$ei:c6/a5/c4/a3",
 "$ei:c6/a5",
 "$ei:c6/a5"
);
verse9common1();
push @notes, (
 "$qu:g5/d#5/g4",
 "$qu:d6/a#5/d#5",
 "$ei:c6/a5/c5/f3",
 "$ei:c6/a5/c5/c3",
 "$ei:c6/a5/c5/a3/f3",
 "$ei:c6/a5/c5/a3/f3",

 "$dei:d6/g6",
 "$dei:g6/c6",
 "$ei:a#6/d6/g3",
 "$ha:g6/d6",

 "$qu:g4/d#4/d#3",
 "$ei:d5/a#4",
 "$ei:d5/a#4",
 "$ei:c5/a4/f3",
 "$ei:c5/a4/f3",
 "$ei:c5/a4/a3",
 "$ei:c5/a4/f3",

 "$dei:g4/d4",
 "$dei:c5/g4",
 "$ei:d5/a#4",
 "$dei:d6/f5/d5",
 "$dei:d5/a#4",
 "$ei:c5/g4",

 "$qu:g4/d#4",
 "$qu:d5/a#4/g3/d#3",
 "$ei:c6/c5/a4/f4/c4",
 "$ei:c5/a4/f4/c4",
 "$ei:f6/c5/a4/f4/c4",
 "$ei:c5/a4/f4/c4",

 "$dei:a6/a5/g4/d4",
 "$dei:a#6/a#5/c5/g4",
 "$ei:c6/d5/a#4",
 "$dei:a#6/a#5",
 "$dei:a6/a5",
 "$ei:d6/d5",

 "$qu:g4/d#4",
 "$ei:d5/a#4",
 "$ei:d5/a#4",
 "$ei:c5/a4",
 "$ei:c5/a4",
 "$ei:c5/a4",
 "$ei:c5/a4",

 "$dei:g4/d4",
 "$dei:c5/g4",
 "$ei:d5/a#4/a#3/g3",
 "$dei:f5/d5",
 "$dei:d5/a#4",
 "$ei:c5/g4/a#3/g3",

 "$qu:g4/d#4/g3/d#3/a#2",
 "$qu:d6/d5/a#4/d#4",
 "$ei:c5/a4/c4",
 "$ei:c5/a4/c4",
 "$ei:c6/c5/a4/c4",
 "$ei:c5/a4/c4",

 "$dei:a#6/a#5/d5/g4",
 "$dei:c6/g5/c5",
 "$ei:d6/a#5/d5",
 "$ei:g6/d6/g5"
);
push (@notes, "$si:g3/g2");
silence("$si");
push (@notes, "$si:g3/g2");
silence("$si");
push (@notes, "$si:g3/g2");
silence("$si");

createSynths();
