package AutoNamer::UI::Debug;
use MC::Input::Cli;

sub new {
	my $self = {};
	bless $self;
	return $self;
}

sub rename {
	my ($self, $original, $new, $dryrun, $sdir, $dir) = @_;
	say(0, "Rename: '$original' -> '$new' (source dir = '$sdir', dst dir = '$dir')");
}

sub skip {
	my ($self, $reason, $original, $dryrun) = @_;
	say(0, "Skipped ($reason): $original");
}

sub finish {
	my($self, $dryrun) = @_;
	say(0, 'Finish!');
}

1;
