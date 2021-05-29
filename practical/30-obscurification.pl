#!/usr/bin/perl
# This is my first Perl program ever. Please ignore my awful code.

use strict;
use warnings;
use feature 'say';
use Socket;

# Get the url and split it in path
say "Enter URL or IP address:";
my $raw_addr = <>;
unless ($raw_addr =~ /.*\//) {
	$raw_addr =~ s/\n/\//;
}
my @parts = split /\//, $raw_addr;

# Turn the hostname into DWORD
my $ipb = gethostbyname $parts[0];
unless ($ipb) {
	die "Invalid URL!";
}
my @ip_s = split /\./, inet_ntoa($ipb);
my $dword = (($ip_s[0]*256+$ip_s[1])*256+$ip_s[2])*256+$ip_s[3];

# Generate the digits before URL (2841702714090427@url.com)
my $number = rand(10);
$number =~ tr/.//d;

# Convert the rest of the URL into ascii codes
my @spath = @parts[1..$#parts];
my $lpath = join("/", @spath);
$lpath =~ s/([^\/\n])/ sprintf "%%%0x", ord $1 /eg;
my $path = uc $lpath;

# Print obscurification result
say("");
unless ($path eq "") {
	say "Obscurified URL (Less obscure):";
	say "http://".$number."@".$dword."/".join("/", @spath);
	say "Obscurified URL (More obscure):";
	say "http://".$number."@".$dword."/".$path;
	say "Please note that for whatever reason the second version only works in some browsers and not the others. AFAIK there's no workaround, but if you know something about that, let me know.";
} else {
	say "Obscurified URL:";
	say "http://".$number."@".$dword;
}
