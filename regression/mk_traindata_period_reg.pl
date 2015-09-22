#!/usr/bin/perl

use strict;
use warnings;

if(@ARGV < 2){
  print "Usage: $0 <output data num> <period>" . "\n";
#  print "out put data num: 出力する学習データ数";
#  print "period: 素性とする期間";
  exit;
}

my $data_num = $ARGV[0];
my $period = $ARGV[1];

my $cnt = 0;
my @data;
while(<STDIN>){
  chomp;
  $data[$cnt] = $_;
  $cnt++;
}

for (my $inti = 0; $inti < $data_num; $inti++) {
  my $label;
  my $head = $cnt - 1 - $inti;
  my $str = "";
  for (my $intj = 0; $intj < $period; $intj++){
    $str .= $data[$head - 1 - $intj] . "\t";
  }
  chop $str;
  print $data[$head] . "\t" . $str . "\n";
}
