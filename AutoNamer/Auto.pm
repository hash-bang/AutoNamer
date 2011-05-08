package AutoNamer::Auto;
use Input::Cli;

sub new {
	my $self = {};
	bless $self;
	return $self;
}

sub rename {
	my ($self, $original, $new, $dryrun, $sdir, $dir) = @_;
	say(0, "Rename: '$original' -> '$new' (dir = '$dir', ext = '$ext')");

	unless ($dryrun) {
		say(0, "Problem moving file '$original' to '$new'") unless rename "$sdir/$raw", "$dir/$new";
	}
}

sub finish {
	my($self, $dryrun) = @_;
	say(0, 'Finish!');
}

1;
