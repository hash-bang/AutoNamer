#!/usr/bin/perl
use TestKit;
chdir '..';
AutoNamer::TestKit::test(join('', <DATA>), 'autonamer --noimdb --ui test --fake');

__DATA__
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
