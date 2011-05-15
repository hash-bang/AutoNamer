#!/usr/bin/perl
#use Test::Simple tests => 10;

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

foreach (split /\n/) {
	my($given, $desired) = (m/^(.*?)\s*\|\s*(.*)\s*$/m);
	next unless $given;
	$corrected = `an --noimdb --ui test --fake '$given'`;
	chomp $corrected;

	print STDERR ($corrected eq $desired ? ' OK ' : 'FAIL'), " - '$given' -> '$corrected'\n";
	#ok($corrected eq $desired, "Auto correct: '$given' -> '$desired'");
}
