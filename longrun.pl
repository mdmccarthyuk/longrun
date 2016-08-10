#!/usr/bin/perl

use strict;
use warnings;
use Date::Parse;

my $filename=$ARGV[0];
my $calcTime=0;
my $thisTime="";
my $lastTime="";
my $logMsg="";

open LOGFILE, "<$filename" or die($!);  

while (my $line = <LOGFILE>) {
  if ($line =~ /(^\d+:\d+:\d+) (.*)/) {
    $thisTime = $1;
    $logMsg = $2;
    if ($lastTime ne "") {
      $calcTime= str2time($thisTime) - str2time($lastTime);
    } else {
      $calcTime = 0;
    }
    print "$calcTime $thisTime $logMsg\n";
    $lastTime=$thisTime;
  }
}

close(LOGFILE);

