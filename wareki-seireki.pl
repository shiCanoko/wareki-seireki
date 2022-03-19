#!/usr/bin/env perl
# shica
use strict;
use warnings;

#和暦は慶応、明治、大正、昭和、平成、令和に対応してください。
#範囲外の指定（例えば存在しない「平成40年」など）をした場合の挙動は未定義とします
#（エラーにしても、実際にその和暦が続いたときの西暦年を出力してもよいです）。

# perl wareki-seireki.pl 平成30年
# 2018

my $wareki = $ARGV[0];

my $seireki;
my $first_year_keiou = 1865;
my $first_year_meiji = 1868;
my $first_year_taisho = 1912;
my $first_year_showa = 1926;
my $first_year_heisei = 1989;
my $first_year_reiwa = 2019;


if ($wareki =~ /慶応元年/ || $wareki =~ /慶応1年/){
    print ("$first_year_keiou\n");
}
elsif ($wareki =~ /慶応/ ){
    $seireki = convert($wareki, "$first_year_keiou");
    print ("$seireki\n");
}
if ($wareki =~ /明治元年/ || $wareki =~ /明治1年/){
    print ("$first_year_meiji\n");
}
elsif ($wareki =~ /明治/ ){
    $seireki = convert($wareki, "$first_year_meiji");
    print ("$seireki\n");
}
if ($wareki =~ /大正元年/ || $wareki =~ /大正1年/){
    print ("$first_year_taisho\n");
}
elsif ($wareki =~ /大正/ ){
    $seireki = convert($wareki, "$first_year_taisho");
    print ("$seireki\n");
}
if ($wareki =~ /昭和元年/ || $wareki =~ /昭和1年/){
    print ("$first_year_showa\n");
}
elsif ($wareki =~ /昭和/ ){
    $seireki = convert($wareki, "$first_year_showa");
    print ("$seireki\n");
}
if ($wareki =~ /平成元年/ || $wareki =~ /平成1年/){
    print ("$first_year_heisei\n");
}
elsif ($wareki =~ /平成/ ){
    $seireki = convert($wareki, "$first_year_heisei");
    print ("$seireki\n");
}
if ($wareki =~ /令和元年/ || $wareki =~ /令和1年/){
    print ("$first_year_reiwa\n");
}
elsif ($wareki =~ /令和/ ){
    $seireki = convert($wareki, "$first_year_reiwa");
    print ("$seireki\n");
}

sub convert{
    my ($wareki, $first_year) = @_;
    my $wareki_number = getWarekiNumber($wareki);
    my $seireki = $wareki_number + $first_year - 1;
    return $seireki;
}

sub getWarekiNumber{
    my ($wareki) = @_;
    my $wareki_number;
    if ($wareki =~ /(\d{1,})/) {
        $wareki_number = $1
    }
    return $wareki_number;
}