package SoXMusicGen;

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

use POSIX;

use Exporter qw(import);
our @EXPORT = qw(setTempo setDefaultSynthType createSynths createSamples
                 silence iterate $synthSampleRate $samplesDir
                 $maxSynthChannels $maxSamplesChannels @notes
                 $fu $ha $qu $ei $si
                 $dha $dqu $dei $dsi
                 $tqu $tei $tsi
                );

our @notes; # In the following format - "$duration:NOTE"

sub setTempo {
 my $BPM=$_[0];

 # durations
 our $fu=240 / $BPM; # Whole note
 our $ha=120 / $BPM; # Half note
 our $qu=60 / $BPM; # Quarter note
 our $ei=30 / $BPM; # Eighth note
 our $si=15 / $BPM; # Sixteenth note
 our $dha=180 / $BPM; # Dotted-half note
 our $dqu=90 / $BPM; # Dotted-quarter note
 our $dei=45 / $BPM; # Dotted-eighth note
 our $dsi=22.5 / $BPM; # Dotted-sixteenth note
 our $tqu=40 / $BPM; # Triplet-quarter note
 our $tei=20 / $BPM; # Triplet-eighth note
 our $tsi=10 / $BPM; # Triplet-sixteenth note
}

my @defaultsynth=("sin"); # Just in case you forget to specify synth type
my @synthtype=@defaultsynth; # Number of default synths must match
our $maxSynthChannels=1;     # number of max channels to use
sub setDefaultSynthType {
 @defaultsynth=@_;
 @synthtype=@defaultsynth;
}

sub iterate {
 my @iteration=($_[0]..$_[1]);
 return @iteration;
}

our $synthSampleRate=48000;

sub createSynths {
 foreach my $note (@notes) {
  if ($note ne "") { # We don't want to print a forever synth
   my @currentNote = split(':', $note);
   print '"|sox -r ', $synthSampleRate, ' -n -p synth ',
         POSIX::floor($currentNote[0]*1000)/1000;
   my @pitches = split('/', uc $currentNote[1]);
   for my $currentSynthAndPitch (iterate(0,$maxSynthChannels-1)) {
    print ' ', $synthtype[$currentSynthAndPitch];
    if(exists($pitches[$currentSynthAndPitch])) {
     print ' ', $pitches[$currentSynthAndPitch];
    } else {
     print ' ', $pitches[-1];
    }
   }
   print '"', "\n";
  } else {
   print "\n"; # For compatibility with libsox.sh scripts that differentiated
  }            # loop and non-loop parts
 }
 @notes = (); # You usually want to reset the notes array after calling this
}

sub silence { # needed because pluck synth doesn't support zero frequency
 createSynths(); # necessary because we will be changing
 @synthtype = ();              # synth type
 for (iterate(0,@defaultsynth-1)) { # If number of default synths is 4,
  push (@synthtype, "sin");         # we create 4 sine synths
 } # sin, square, sawtooth, trapezium, and exp support freq=0
 push (@notes, "$_[0]:0");
 createSynths(); # get the silence printed
 @synthtype=@defaultsynth;     # before we return to default synth
}

our $samplesDir;
our $maxSamplesChannels=1;

sub createSamples {
 foreach my $note (@notes) {
  if ($note ne "") {
   my @currentNote = split(':', $note);
   my @pitches = split('/', uc $currentNote[1]);
   if($maxSamplesChannels == 1) {
    print '"|sox ', $samplesDir, '/', uc $pitches[0], '.* -p ',
          'trim 0 ', POSIX::floor($currentNote[0]*1000)/1000, '"', "\n";
   } else {
    print '"|sox -M ';
   for my $currentSample (iterate(0,$maxSamplesChannels-1)) {
     if(exists($pitches[$currentSample])) {
      print $samplesDir, '/', uc $pitches[$currentSample], '.* ';
     } else {
      print $samplesDir, '/', uc $pitches[-1], '.* ';
     }
    }
    print '-p trim 0 ',
          POSIX::floor($currentNote[0]*1000)/1000, '"', "\n";
   }
  } else {
   print "\n";
  }
 }
 @notes = (); # You usually want to reset the notes array after calling this
}

1;
