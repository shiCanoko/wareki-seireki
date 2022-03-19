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

if ($wareki =~ /慶応元年/ || $wareki =~ /慶応1年/){
    print ("1865\n");
}
elsif ($wareki =~ /慶応/ ){
    my $anser = convert($wareki);
}
if ($wareki =~ /明治元年/ || $wareki =~ /明治1年/){
    print ("1868\n");
}
if ($wareki =~ /大正元年/ || $wareki =~ /大正1年/){
    print ("1912\n");
}
if ($wareki =~ /昭和元年/ || $wareki =~ /昭和1年/){
    print ("1926\n");
}
if ($wareki =~ /平成元年/ || $wareki =~ /平成1年/){
    print ("1989\n");
}
if ($wareki =~ /令和元年/ || $wareki =~ /令和1年/){
    print ("2019\n");
} elsif ($wareki =~ /令和/ ){
    my @number = split(/令和/, $wareki);
    my $seireki = 2019 + $number[1] - 1;
    print ("$seireki\n");
}

sub convert{
    my ($kanji) = @_;
    my @number = split(/$kanji/, $wareki);
    my $seireki = 1865 + $number[1] - 1;
    return $seireki;
}