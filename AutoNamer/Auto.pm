package AutoNamer::Auto;
use Input::Cli;

sub new {
	my $self = {};
	bless $self;
	return $self;
}

sub rename {
	my ($self, $original, $new, $dryrun, $dir, $ext) = @_;
	say(0, "Rename: '$original' -> '$new' (dir = '$dir', ext = '$ext')");

	unless ($dryrun) {
		say(0, "Problem moving file '$original' to '$new'") unless rename $raw, $new;
	}
}

sub finish {
	my($self) = @_;
	say(0, 'Finish!');
}

1;
