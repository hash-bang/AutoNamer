package AutoNamer::UI::Test;
use MC::Input::Cli;

# Simple test output interface designed to echo results compatible with the Perl testing suite

sub new {
	my $self = {};
	bless $self;
	return $self;
}

sub rename {
	my ($self, $original, $new, $dryrun, $sdir, $dir) = @_;
	print $new, "\n";
}

sub finish {
}

1;
