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
setDefaultSynthType("square", "square", "square", "square");
our $maxSynthChannels=4;

# intro
sub intro_verse2 {
 sub common {
  push @notes, (
   "$ei:F4/F$_[1]/F2",
   "$ei:G4/G$_[1]/C3",
   "$ei:G#4/G#$_[2]/G#2",
   "$ei:C5/C$_[1]/D#3",
   "$ei:F$_[0]",
   "$ei:D#5/D#$_[2]"
  );
 }
 common(2,$_[0],$_[1]);
 push @notes, (
  "$ei:G#2",
  "$ei:D5/D$_[1]",
  "$ei:A#2",
  "$ei:A#4/A#$_[0]",
  "$ei:C3",
  "$si:F4/F3",
  "$si:C5/C$_[1]",
  "$qu:C#5/C#$_[1]/C#3",
  "$ei:C5/C$_[1]/C3",
  "$ei:C3"
 );
 common(3,$_[0],$_[1]);
 push @notes, (
  "$ei:C3",
  "$ei:F5/F$_[1]/G#2",
  "$ei:A#2",
  "$ei:A#4/A#$_[0]",
  "$ei:D#5/D#$_[1]/C3",
  "$ei:G5/G$_[1]/D#3",
  "$ei:E5/E$_[1]/E3",
  "$ei:C#5/C#$_[1]/F3",
  "$ei:A#4/A#$_[0]/G3",
  "$ei:G4/G$_[0]/F3"
 );
 common(2,3,4);
 push @notes, (
  "$si:G#2",
  "$si:G2",
  "$ei:D5/D4/D#3",
  "$ei:F2",
  "$ei:A#4/A#3/C3",
  "$si:C3",
  "$si:F3",
  "$si:F4/F3/E3",
  "$si:C5/C3",
  "$qu:C#5/C#4/C#3",
  "$ei:C5/C4/C3",
  "$ei:G#2"
 );
 common(2,3,4);
 push @notes, (
  "$si:G#2",
  "$si:G2",
  "$ei:F5/F4/D#3",
  "$ei:F2",
  "$ei:A#4/A#3/C3",
  "$ei:D#5/D#4/C3",
  "$ei:G5/G4/D#3",
  "$dqu:E5/E4/E3"
 );
}
intro_verse2(4,5);
createSynths();
print "\n"; # non-loop ends

# loop starts
# verse 1
push @notes, ( "$si:C5/C4", "$si:E5/E4" );
sub verse1 {
 sub verse1common {
  for (iterate(1,2)) { push (@notes, "$ei:F5/F4/G#2/C#2"); silence("$ei"); };
  push @notes, (
   "$ei:D#5/D#4/A#2/D#2",
   "$ei:F5/F4",
   "$ei:C5/C4/A#2/D#2"
  );
  silence("$ei");
  push @notes, (
   "$ei:D#5/D#4/C3/F2",
   "$ei:F5/F4",
  "$ei:C5/C4/C3/F2"
  );
  silence("$ei");
  push @notes, (
   "$ei:D#5/D#4/A#2/D#2",
   "$ei:F5/F4",
   "$ei:C5/C4/A#2/D#2",
   "$ei:D#5/D#4",
   "$ei:G#2/C#2",
   "$ei:F5/F4",
   "$ei:G#2/C#2",
   "$ei:G#5/G#4",
   "$ei:D#5/D#4/A#2/D#2",
   "$ei:F5/F4",
   "$ei:C5/C4/A#2/D#2",
   "$ei:D#5/D#4"
  );
 }
 verse1common(); push @notes, (
  "$ei:F5/F4/C3/F2",
  "$ei:D#5/D#4",
  "$ei:C5/C4/C3/F2",
  "$ei:A#4/A#3",
  "$dqu:A4/A3",

  "$si:C5/C4",
  "$si:D#5/D#4"
 );
 verse1common(); push ( @notes, ".931:F5/F4" ); # half + eighth note
}
verse1();
push @notes, (
 "$si:C5/C4",
 "$si:C5/C4",
 "$ei:D#5/D#4",
 "$ei:C5/C4"
);
verse1();
silence("$ei");

# verse 2
push @notes, ( "$ei:A4/A3", "$ei:G4/G3" ); intro_verse2(3,4);

# verse 3
push @notes, ( "$si:A#4", "$si:C#5" );
sub verse3 {
 sub verse3common {
  push @notes, (
   "$ei:D#5/B4/G#2/E2",
   "$ei:C#5/A#4",
   "$ei:D#5/B4/G#2/E2",
   "$ei:F#5/D#5"
  );
 }
 verse3common(); push @notes, (
  "$qu:D#5/B4/G#2/E2",
  "$si:G#2/E2",
  "$si:D5",
  "$qu:D#5/G#4",
  "$ei:C#5/F#4",
  "$ei:D#5/G#4/A#2/F#2",
  "$ei:G#5/B4",
  "$ei:D#5/G#4/A#2/F#2",
  "$qu:G#4",
  "$ei:A#4",
  "$dei:B4/G#2/D#2"
 );
 silence("$si"); push ( @notes, "$dei:C#5" );
 silence("$si"); push ( @notes, "$dei:A#4/G#2/D#2" );
 silence("$si"); push @notes, (
  "$ei:F#4/G#2/D#2",
  "$ei:D#4",
  "$qu:G#4/D#4/F#2/C#2",
  "$qu:D#5/G#4/F#2/C#2",
  "$qu:C#5/G#4/F#2/C#2",
  "$ei:F#5/A#4/F#2/C#2"
 );
 silence("$ei"); verse3common();
 push @notes, (
  "$ei:D#5/B4/G#2/E2",
  "$ei:C#5/G#4",
  "$ei:G#4/E4",
  "$ei:A#4/F#4",

  "$ei:A#2/F#2",
  "$ei:C#5/G#4",
  "$ei:D#5/A#4/A#2/F#2",
  "$ei:G#5/D#5",
  "$ei:D#5/B4/A#2/F#2",
  "$qu:G#4",
  "$ei:A#4",
  "$qu:B4/G#2/D#2",
  "$dei:C#5",
  "$dei:B4",
  "$ei:A#4",
  "$ei:F#4/G#2/D#2",
  "$ei:D#4"
 );
}
verse3(); push @notes, (
 "$ha:G#4/G#3/F#2/C#2",
 "$qu:A#4/A#3/F#2/C#2",
 "$ei:F#4/F#3/F#2/C#2",
 "$ei:A#4/A#3"
);
verse3(); push @notes, (
 "$dha:G#4/G#3/F#2/C#2",
 "$ei:F#4/F#3/F#2/C#2",
 "$ei:A#4/A#3"
);

# ending the loop smoothly...
intro_verse2(3,4);

createSynths();
