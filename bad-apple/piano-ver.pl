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
our $maxSynthChannels=4;
our $maxSamplesChannels=2;
setDefaultSynthType("sin", "sin", "sin", "sin"); # To match with our custom
our $synthSampleRate=44100;                      # piano samples
our $samplesDir=$ARGV[0];

# intro
for (iterate(1,8)) {
  push (@notes, "$qu:1");
}
createSynths();

sub introcommon {
 push @notes, (
  "$ei:D#4",
  "$ei:A#4",
  "$ei:G#4",
  "$ei:A#4",
  "$ei:F#4",
  "$ei:A#4",
  "$ei:F4",
  "$ei:A#4"
 );
}
introcommon(); introcommon();
push (@notes, "$ei:D#4");
for (iterate(1,7)) {
 push (@notes, "$ei:D#6/A#5");
 createSamples();
 silence("$ei");
}
push (@notes, "$ei:D#6/A#5");

# fast bridge
sub fastbridge {
 sub adff {
  push @notes, (
   "$si:A#5/F#5",
   "$si:D#5/A#5",
   "$si:F5/D#5",
   "$si:F#5/F5"
  );
 }
 adff(); adff(); adff();
 push @notes, (
  "$si:C#6/F#5",
  "$si:D#6/C#6",
 
  "$si:A#5/D#6",
  "$si:D#5/A#5"
 );
 adff(); adff();
 push @notes, (
  "$si:A#5/F#5",
  "$si:D#5/A#5",

  "$si:C#6/D#5",
  "$si:D#6/C#6",

  "$si:A#5/D#6",
  "$si:G#5/A#5",
  "$si:F#5/G#5",
  "$si:F5/F#5",

  "$si:B4/F5",
  "$si:B4/B4",

  "$si:F#5/B4"
 );
 sub bbcdf {
  push @notes, (
   "$si:B4/F#5",
   "$si:B4/B4",

   "$si:C#5/B4",
   "$si:D#5/C#5",
   "$si:F#5/D#5"
  );
 }
 bbcdf(); push @notes, ( "$si:B4/F#5", "$si:B4/B4",  "$si:F#5/B4" );
 bbcdf(); push @notes, ( "$si:D5/F#5", "$si:D#5/D5", "$si:F5/D#5" );
 sub addf {
  push @notes, (
   "$si:A#4/F5",
   "$si:D5/A#4",
   "$si:D#5/D5",
   "$si:F5/D#5"
  );
 }
 addf(); addf();
 push @notes, (
  "$si:A#4/F5",
  "$si:A#4/A#4",
  "$si:G#4/A#4",
  "$si:F#4/G#4",
  "$si:F4/F#4"
 );
}
fastbridge(); fastbridge();

# verse 1
sub verse1common {
 push @notes, (
  "$ei:D#5/D#4",
  "$ei:F5/F4",
  "$ei:F#5/F#4",
  "$ei:G#5/G#4",
  "$qu:A#5/A#4"
 );
}
verse1common();
push @notes, (
 "$ei:D#5/D#4",
 "$ei:C#6/C#5",
 "$qu:A#5/A#4",
 "$qu:D#5/D#4",
 "$ei:A#5/A#4",
 "$ei:G#5/G#4",
 "$ei:F#5/F#4",
 "$ei:F5/F4"
);
verse1common();
push @notes, (
 "$ei:G#5/G#4",
 "$ei:F#5/F#4",
 "$ei:F5/F4",
 "$ei:A#4/A#3",
 "$ei:F5/F4",
 "$ei:F#5/F#4",
 "$ei:F5/F4",
 "$ei:D#5/D#4",
 "$ei:D5/D4",
 "$ei:F5/F4"
);
verse1common();
push @notes, (
 "$ei:G#5/G#4",
 "$ei:C#6/C#5",
 "$qu:D#6/D#5",
 "$qu:D#6/D#5",
 "$qu:F6/F5",
 "$qu:F#6/F#5",
 "$ei:D#6/D#5",
 "$ei:F6/F5",
 "$ei:F#6/F#5",
 "$ei:G#6/G#5",
 "$qu:A#6/A#5",
 "$ei:G#6/G#5",
 "$ei:F#6/F#5",
 "$qu:G#6/G#5",
 "$qu:F6/F5",
 "$qu:F#6/F#5",
 "$qu:G#6/G#5"
);

# verse 2
sub verse2common {
 push @notes, (
  "$ha:D#5/D#4",
  "$ei:D#5/D#4",
  "$ei:F5/F4",
  "$qu:F#5/F#4",
  "$dqu:F5/F4"
 );
}
verse2common();
push @notes, (
 "$dqu:A#4/A#3",
 "$qu:F5/F4",
 "$qu:F5/F4",
 "$ei:F#5/F#4",
 "$dqu:D#5/D#4",
 "$qu:C#5/C#4",
 "$qu:C#5/C#4",
 "$ei:D#5/D#4",
 "$dqu:A#4/A#3",
 "$qu:D#5/D#4"
);
verse2common();
push @notes, (
 "$dqu:F#5/F#4",
 "$qu:G#5/G#4",
 "$dqu:D#5/D#4",
 "$ei:A#5/A#4",
 "$fu:A#5/A#4",
 "$ei:G#5/G#4",
 "$ei:A#5/A#4",
 "$qu:C#6/C#5"
);

# verse 3, which is basically a higher pitched verse 2
sub verse3common {
 push @notes, (
  "$ha:D#6/D#5",
  "$ei:D#6/D#5",
  "$ei:F6/F5"
 );
}
verse3common;
push @notes, (
 "$qu:F#6/F#5",
 "$dqu:F6/F5",
 "$dqu:A#5/A#4",
 "$qu:F6/F5",
 "$qu:F6/F5",
 "$ei:F#6/F#5",
 "$dqu:D#6/D#5",
 "$qu:C#6/C#5",
 "$qu:C#6/C#5",
 "$ei:D#6/D#5",
 "$dqu:A#5/A#4",
 "$qu:F6/F5"
);
verse3common();
push @notes, (
 "$ei:F#6/F#5",
 "$ei:G#6/G#5",
 "$dqu:F6/F5",
 "$dqu:F#6/F#5",
 "$qu:G#6/G#5",
 "$dqu:D6/D5",
 "$dqu:A#5/A#4",
 "$qu:A#6/A#5",
 "$qu:G#6/G#5",
 "$qu:F#6/F#5",
 "$qu:F6/F5",
 "$qu:F#6/F#5"
);

# verse 4
sub verse4common {
 push @notes, (
  "$ei:G5/G4",
  "$qu:D5/D4",
  "$qu:G5/G4",
  "$ei:A#4/A#4",
  "$ei:D5/D4",
  "$ei:F5/F4",
  "$ei:G5/G4",
  "$ei:D5/D4",
  "$ei:A#4/A#3",
  "$qu:G5/G4",
  "$ei:G5/G4",
  "$ei:A5/A4",
  "$ei:A#5/A#4",
  "$ei:G5/G4",
  "$qu:D5/D4",
  "$qu:G5/G4",
  "$ei:D5/D4",
  "$ei:G5/G4",
  "$ei:C6/C5",
  "$ha:A#5/A#4"
 );
}
verse4common();
push @notes, (
 "$ei:A5/A4",
 "$ei:G5/G4",
 "$ei:D5/D4",
 "$ei:A#4/A#3"
);
verse4common();
push @notes, ( "$qu:A5/A4", "$qu:A#5/A#4" );

# verse 5, which is basically a higher pitched verse 4
sub verse5common {
 push @notes, (
  "$ei:G6/G5",
  "$qu:D6/D5",
  "$qu:G6/G5",
  "$ei:A#5/A#4",
  "$ei:D6/D5",
  "$ei:F6/F5",
  "$ei:G6/G5",
  "$ei:D6/D5",
  "$ei:A#5/A#4",
  "$qu:G6/G5",
  "$ei:G6/G5",
  "$ei:A6/A5",
  "$ei:A#6/A#5",
  "$ei:G6/G5",
  "$qu:D6/D5",
  "$qu:G6/G5"
 );
}
verse5common();
push @notes, (
 "$ei:D6/D5",
 "$ei:G6/G5",
 "$ei:C7/C6",
 "$ha:A#6/A#5",

 "$ei:A6/A5",
 "$ei:G6/G5",
 "$ei:D6/D5",
 "$ei:A#5/A#4"
);
verse5common();
push @notes, (
 "$ei:D6/D5",
 "$ei:G6/G5",
 "$ei:A6/A5",
 "$fu:A#6/A#5"
);

createSamples();
