package AutoNamer::Gtk;
use Input::Cli;

sub new {
	my $self = {};
	bless $self;
	return $self;
}

sub rename {
	my ($self, $original, $dryrun, $new, $dir, $ext) = @_;
	say(0, "Rename: '$original' -> '$new' (dir = '$dir', ext = '$ext')");
}

sub finish {
	my($self) = @_;
	say(0, 'Finish!');
}

1;
