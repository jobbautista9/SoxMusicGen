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

# To accompany background
silence("$ei");

# Intro, part 1
sub intro1 {
 sub af3 {
  for (iterate(1,3)) {
   push (@notes, "$ei:A4/F#4");
  }
 }
 for (iterate(1,6)) {
  af3();
  silence("$ei");
 }
 af3();
 push (@notes, "$ha:G#4/F4");
}

# Intro, part 2
sub intro2 {
 sub fcs3 {
  for (iterate(1,3)) {
   push (@notes, "$ei:F4/C#4");
  }
 }
 fcs3(); silence("$ei");
 sub ddgccf {
  push (@notes, "$ei:D#4/C4");
  push (@notes, "$ei:D#4/C4");
  push (@notes, "$ei:G#4/F4");
 }
 ddgccf(); silence("$ei");
 fcs3(); push (@notes, "$ei:F4/C#4");
 push @notes, (
  "$ei:D#4/C4",
  "$ei:C#4/A#3",
  "$ei:C4/G#3"
 );
 silence("$ei");
 fcs3(); silence("$ei"); ddgccf();
 push @notes, (
  "$dqu:A#4/F4",
  "$ei:F4/C#4",
  "$ei:A#4/F4",
  "$ei:F4/C#4",
  "$ei:C5/G#4",
  "$ei:C#5/A#4"
 );
}

intro1(); silence("$ei"); intro1(); silence("$ei");
intro2(); silence("$ei"); intro2(); silence("$ei");
intro1(); silence("$ei"); intro1(); silence("$ei");
intro2(); silence("$ei"); intro2();
silence("$fu");

# Verse 1
sub verse1 {
 sub verse1common {
  push @notes, (
   "$ei:D#5",
   "$ei:C#5",
   "$ei:C5",
   "$si:C#5",
   "$dei:F4"
  );
 }
 sub asccs {
  push @notes, (
   "$ei:A#4",
   "$ei:C5",
   "$ei:C#5"
  );
 }
 sub commonasccs3 {
  for (iterate(1,3)) {
   verse1common(); asccs();
  }
 }
 commonasccs3();
 push @notes, (
  "$ei:C5",
  "$ei:A#4",
  "$ei:A4",
  "$si:C5",
  "$dei:A4",
  "$ei:F5",
  "$ei:D#5",
  "$ei:F5"
 );
 commonasccs3();
 verse1common();
 push @notes, (
  "$ei:F5",
  "$ei:D#5",
  "$ei:C5"
 );
}
verse1(); verse1();

# Verse 2, a variation of verse 1
sub verse2 {
 sub verse2common {
  push @notes, (
   "$ei:C5",
   "$ei:A#4",
   "$ei:A4",
   "$si:A#4",
   "$dei:D4"
  );
 }
 sub gaas {
  push @notes, (
   "$ei:G4",
   "$ei:A4",
   "$ei:A#4"
  );
 }
 sub commongaas3 {
  for (iterate(1,3)) {
   verse2common(); gaas();
  }
 }
 commongaas3();
 push @notes, (
  "$ei:A4",
  "$ei:G4",
  "$ei:F#4",
  "$si:A4",
  "$dei:F#4",
  "$ei:D5",
  "$ei:C5",
  "$ei:D5"
 );
 commongaas3();
 verse2common();
 push @notes, (
  "$ei:D5",
  "$ei:C5",
  "$ei:A4"
 );
}
verse2(); verse2();

# Verse 3, another variation of verse 1
sub verse3 {
 sub verse3common {
  push @notes, (
   "$ei:C#5",
   "$ei:B4",
   "$ei:A#4",
   "$si:B4",
   "$dei:D#4"
  );
 }
 sub gsasb {
  push @notes, (
   "$ei:G#4",
   "$ei:A#4",
   "$ei:B4"
  );
 }
 sub commongsasb3 {
  for (iterate(1,3)) {
   verse3common(); gsasb();
  }
 }
 commongsasb3();
 push @notes, (
  "$ei:A#4",
  "$ei:G#4",
  "$ei:G4",
  "$si:A#4",
  "$dei:G4",
  "$ei:D#5",
  "$ei:C#5",
  "$ei:D#5"
 );
 commongsasb3();
 verse3common();
 push @notes, (
  "$ei:D#5",
  "$ei:C#5",
  "$ei:A#4"
 );
}
verse3(); verse3();

# Verse 4, another variation of verse 1
sub verse4 {
 sub verse4common {
  push @notes, (
   "$ei:F5",
   "$ei:D#5",
   "$ei:D5",
   "$si:D#5",
   "$dei:G4"
  );
 }
 sub cdds {
  push @notes, (
   "$ei:C5",
   "$ei:D5",
   "$ei:D#5"
  );
 }
 sub commoncdds3 {
  for (iterate(1,3)) {
   verse4common(); cdds();
  }
 }
 commoncdds3();
 push @notes, (
  "$ei:D5",
  "$ei:C5",
  "$ei:B4",
  "$si:D5",
  "$dei:B4",
  "$ei:G5",
  "$ei:F5",
  "$ei:G5"
 );
 commoncdds3();
 verse4common();
 push @notes, (
  "$ei:G5",
  "$ei:F5",
  "$ei:D5"
 );
}
verse4(); verse4();

createSynths();
