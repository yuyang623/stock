#!/usr/bin/perl

use strict;
use warnings;

while(<STDIN>){
  chomp;
  my @data = split(/\t/, $_);
  my $num = @data;
  my $str = "";
  my $base = $data[1];
  for ( my $inti = 0; $inti < $num; $inti++){
    $str .= $data[$inti] / $base . "\t";
  }
  chop $str;
  print $str . "\n";
}

