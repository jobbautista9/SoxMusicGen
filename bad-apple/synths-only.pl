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

setTempo(160);
setDefaultSynthType("sin");
our $maxSynthChannels=1;

# intro
for (iterate(1,8)) {
 push (@notes, "$qu:25");
}
sub introcommon {
 push @notes, (
  "$ei:D#3",
  "$ei:A#3",
  "$ei:G#3",
  "$ei:A#3",
  "$ei:F#3",
  "$ei:A#3",
  "$ei:F3",
  "$ei:A#3"
 );
}
introcommon(); introcommon();
push (@notes, "$ei:D#3");
for (iterate(1,7)) {
 push (@notes, "$ei:D#4");
 silence("$ei");
}
push (@notes, "$ei:D#4");

# fast bridge
sub fastbridge {
 sub adff {
  push @notes, (
   "$si:A#4",
   "$si:D#4",
   "$si:F4",
   "$si:F#4"
  );
 }
 adff(); adff(); adff();
 push @notes, (
  "$si:C#5",
  "$si:D#5",
 
  "$si:A#4",
  "$si:D#4"
 );
 adff(); adff();
 push @notes, (
  "$si:A#4",
  "$si:D#4",

  "$si:C#5",
  "$si:D#5",

  "$si:A#4",
  "$si:G#4",
  "$si:F#4",
  "$si:F4",

  "$si:B3",
  "$si:B3",

  "$si:F#4",

  "$si:B3",
  "$si:B3",

  "$si:C#4",
  "$si:D#4",
  "$si:F#4",

  "$si:B3",
  "$si:B3",

  "$si:F#4",

  "$si:B3",
  "$si:B3",

  "$si:C#4",
  "$si:D#4",
  "$si:F#4",
  "$si:D4",
  "$si:D#4",
  "$si:F4"
 );
 sub addf {
  push @notes, (
   "$si:A#3",
   "$si:D4",
   "$si:D#4",
   "$si:F4"
  );
 }
 addf(); addf();
 push @notes, (
  "$si:A#3",
  "$si:A#3",
  "$si:G#3",
  "$si:F#3",
  "$si:F3"
 );
}
fastbridge(); fastbridge();

# verse 1
sub verse1common {
 push @notes, (
  "$ei:D#4",
  "$ei:F4",
  "$ei:F#4",
  "$ei:G#4",
  "$qu:A#4"
 );
}
verse1common();
push @notes, (
 "$ei:D#4",
 "$ei:C#5",
 "$qu:A#4",
 "$qu:D#4",
 "$ei:A#4",
 "$ei:G#4",
 "$ei:F#4",
 "$ei:F4"
);
verse1common();
push @notes, (
 "$ei:G#4",
 "$ei:F#4",
 "$ei:F4",
 "$ei:A#3",
 "$ei:F4",
 "$ei:F#4",
 "$ei:F4",
 "$ei:D#4",
 "$ei:D4",
 "$ei:F4"
);
verse1common();
push @notes, (
 "$ei:G#4",
 "$ei:C#5",
 "$qu:D#5",
 "$qu:D#5",
 "$qu:F5",
 "$qu:F#5",
 "$ei:D#5",
 "$ei:F5",
 "$ei:F#5",
 "$ei:G#5",
 "$qu:A#5",
 "$ei:G#5",
 "$ei:F#5",
 "$qu:G#5",
 "$qu:F5",
 "$qu:F#5",
 "$qu:G#5"
);

# verse 2
sub verse2common {
 push @notes, (
  "$ha:D#4",
  "$ei:D#4",
  "$ei:F4",
  "$qu:F#4",
  "$dqu:F4"
 );
}
verse2common();
push @notes, (
 "$dqu:A#3",
 "$qu:F4",
 "$qu:F4",
 "$ei:F#4",
 "$dqu:D#4",
 "$qu:C#4",
 "$qu:C#4",
 "$ei:D#4",
 "$dqu:A#3",
 "$qu:D#4"
);
verse2common();
push @notes, (
 "$dqu:F#4",
 "$qu:G#4",
 "$dqu:D#4",
 "$ei:A#4",
 "$fu:A#4",
 "$ei:G#4",
 "$ei:A#4",
 "$qu:C#5"
);

# verse 3, which is basically a higher pitched verse 2
sub verse3common {
 push @notes, (
  "$ha:D#5",
  "$ei:D#5",
  "$ei:F5"
 );
}
verse3common;
push @notes, (
 "$qu:F#5",
 "$dqu:F5",
 "$dqu:A#4",
 "$qu:F5",
 "$qu:F5",
 "$ei:F#5",
 "$dqu:D#5",
 "$qu:C#5",
 "$qu:C#5",
 "$ei:D#5",
 "$dqu:A#4",
 "$qu:F5"
);
verse3common();
push @notes, (
 "$ei:F#5",
 "$ei:G#5",
 "$dqu:F5",
 "$dqu:F#5",
 "$qu:G#5",
 "$dqu:D5",
 "$dqu:A#4",
 "$qu:A#5",
 "$qu:G#5",
 "$qu:F#5",
 "$qu:F5",
 "$qu:F#5"
);

# verse 4
sub verse4common {
 push @notes, (
  "$ei:G4",
  "$qu:D4",
  "$qu:G4",
  "$ei:A#3",
  "$ei:D4",
  "$ei:F4",
  "$ei:G4",
  "$ei:D4",
  "$ei:A#3",
  "$qu:391", # custom duration needed because can't hear notes separately
  "$ei:391",
  "$ei:A4",
  "$ei:A#4",
  "$ei:G4",
  "$qu:D4",
  "$qu:G4",
  "$ei:D4",
  "$ei:G4",
  "$ei:C5",
  "$ha:A#4"
 );
}
verse4common();
push @notes, (
 "$ei:A4",
 "$ei:G4",
 "$ei:D4",
 "$ei:A#3"
);
verse4common();
push @notes, ( "$qu:A4", "$qu:A#4" );

# verse 5, which is basically a higher pitched verse 4
sub verse5common {
 push @notes, (
  "$ei:G5",
  "$qu:D5",
  "$qu:G5",
  "$ei:A#4",
  "$ei:D5",
  "$ei:F5",
  "$ei:G5",
  "$ei:D5",
  "$ei:A#4",
  "$qu:783",
  "$ei:783",
  "$ei:A5",
  "$ei:A#5",
  "$ei:G5",
  "$qu:D5",
  "$qu:G5"
 );
}
verse5common();
push @notes, (
 "$ei:D5",
 "$ei:G5",
 "$ei:C6",
 "$ha:A#5",

 "$ei:A5",
 "$ei:G5",
 "$ei:D5",
 "$ei:A#4"
);
verse5common();
push @notes, (
 "$ei:D5",
 "$ei:G5",
 "$ei:A5",
 "$fu:A#5-902"
);

createSynths();
