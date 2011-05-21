package AutoNamer::TestKit;
our $VERSION = '0.1';
use FileHandle;
use IPC::Open2;
use Data::Dump;
use Test;

require Exporter;
@ISA = qw/Exporter/;
@EXPORT_OK = qw/testkit/;

sub test {
	my ($files, $cmd) = @_;
	my @files, @expect;
	foreach (split /\n/, $files) { # Parse the input into @files and @expect
		my($given, $desired) = (m/^(.*?)\s*\|\s*(.*)\s*$/m);
		next unless $given;
		push @files, $given;
		push @expect, $desired;
	}
	$pid = open2(ANOUT, ANIN, $cmd); # Throw input though AutoNamer
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
}
