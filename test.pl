#!/usr/bin/perl
use FileHandle;
use IPC::Open2;
use Data::Dump;
use Test;

$_ = q/
I Am Number Four 2011 PPVRIP IFLIX www.IWANNADOWNLOAD.com.avi	| I Am Number Four.avi
Limitless (2011) DvDRiP English Final-aAF.mkv			| Limitless.mkv
RocknRolla[2008]DvDrip-aXXo.avi					| RocknRolla.avi
Source Code (2011) Eng.DVDRip.UltrA.avi				| Source Code.avi
Sucker Punch (2011) DvDRiP English Final-ViSiON.mp4		| Sucker Punch.mp4
Taken[2008]DvDrip-aXXo.avi					| Taken.avi
Troy.2004.DVDRip.avi						| Troy.avi
TROY.2004.ITALIAN..DVDrip.AC3.TrTdCrew.avi			| TROY.avi
Troy.avi							| Troy.avi
Charlie And The Chocolate Factory KLAXXON.avi			| Charlie And The Chocolate Factory.avi
/;

my @files, @expect;
foreach (split /\n/) { # Parse the input into @files and @expect
	my($given, $desired) = (m/^(.*?)\s*\|\s*(.*)\s*$/m);
	next unless $given;
	push @files, $given;
	push @expect, $desired;
}
$pid = open2(ANOUT, ANIN, 'autonamer --noimdb --ui test --fake'); # Throw input though AutoNamer
print ANIN join "\n", @files;
close ANIN;

plan tests => scalar(@files); # Setup tests now we know how many to run

while ($got = <ANOUT>) {
	chomp $got;
	$raw = shift @files;
	$wanted = shift @expect;
	#print STDERR ($got eq $wanted ? ' OK ' : 'FAIL'), " - Got '$got' wanted '$wanted' (from '$raw')\n";
	ok($got, $wanted);
}
