#!/usr/bin/env/perl

use strict;
use warnings;
use feature 'say';

# Generation options
say "Enter password length:";
my $length = <>;
unless ($length =~ /[0-9]+/) { die "Password length should be a number!"; } # Check if answer is a number
say "Use capital letters? (y/n)";
my $caps = <>;
unless ($caps =~ /^[ynYN]/) { die "Invalid answer!"; } # Check if answer starts with y or n
say "Use lowercase letters? (y/n)";
my $lows = <>;
unless ($lows =~ /^[ynYN]/) { die "Invalid answer!"; }
say "Use numbers? (y/n)";
my $nums = <>;
unless ($nums =~ /^[ynYN]/) { die "Invalid answer!"; }
say "Use special syms? (y/n)";
my $syms = <>;
unless ($syms =~ /^[ynYN]/) { die "Invalid answer!"; }

# Create a set of used syms
my @set = ();
my @caps = ("A".."Z");
my @lows = ("a".."z");
my @nums = (0..9);
my @syms = ("!","@","#","\$","%","^","&","*");
if ($caps =~ /^[yY]/) { push(@set, @caps); }
if ($lows =~ /^[yY]/) { push(@set, @lows); }
if ($nums =~ /^[yY]/) { push(@set, @nums); }
if ($syms =~ /^[yY]/) { push(@set, @syms); }
unless (@set) { die "You didn't select any characters!"; }

# Password generation
say "\nHere's your password:";
for (1..$length) {
	print $set[rand @set];
}
say "";
