package AutoNamer::Debug;
use Input::Cli;

sub new {
	my $self = {};
	bless $self;
	return $self;
}

sub rename {
	my ($self, $original, $dryrun, $new, $sdir, $dir) = @_;
	say(0, "Rename: '$original' -> '$new' (source dir = '$sdir', dst dir = '$dir')");
}

sub finish {
	my($self) = @_;
	say(0, 'Finish!');
}

1;
