#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

say "Enter your text:";
my $text = <>;
$text =~ tr/A-MN-Za-mn-z/N-ZA-Mn-za-m/; # Substitute all letters with their matching ROT-13 letter

say("\nEncoded/Decoded text:");
say $text;
