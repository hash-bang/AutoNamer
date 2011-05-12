package AutoNamer::Gtk;
use Input::Cli;
use Gtk2 '-init';
use Gtk2::SimpleList;
use constant TRUE  => 1;
use constant FALSE => 0;

my $window;
my $dryrun;
my $list;

sub new {
	my $class = shift;
	my $self = {};
	bless $self, $class;
	$self->initialize();
	return $self;
}

sub initialize {
	my ($self) = @_;
	$self->{window} = Gtk2::Window->new;
	$self->{window}->set_title('AutoNamer');
	$self->{window}->signal_connect(delete_event => sub {Gtk2->main_quit; TRUE});
	$self->{window}->set_default_size(800, 400);
	$self->{window}->set_position('center');

	$self->{list} = Gtk2::SimpleList->new (
	      'Do' => 'bool',
	      'New name' => 'text',
	      'Original' => 'text',
	      'Source dir' => 'text',
	      'Dest dir' => 'text',
	);
	$self->{list}->set_column_editable(1, TRUE);
	
	$vbox = Gtk2::VBox->new;
	$scrolled = Gtk2::ScrolledWindow->new;
	$scrolled->set_policy('automatic', 'automatic');
	$scrolled->add($self->{list});
	$vbox->add($scrolled);
	$self->{window}->add($vbox);
	
	$actionbar = Gtk2::HBox->new;
	$cancel = Gtk2::Button->new_from_stock('gtk-cancel');
	$cancel->set_size_request(100, 30);
	$cancel->signal_connect(clicked => sub {Gtk2->main_quit; TRUE});
	$apply = Gtk2::Button->new_from_stock('gtk-apply');
	$apply->set_size_request(100, 30);
	$apply->signal_connect(clicked => \&renameall, $self);
	$actionbar->add_with_properties($apply, expand => FALSE, pack_type => 'end');
	$actionbar->add_with_properties($cancel, expand => FALSE, pack_type => 'end');
	$vbox->add_with_properties($actionbar, expand => FALSE);
}

sub rename {
	my ($self, $original, $new, $dryrun, $sdir, $dir) = @_;
	push @{$self->{list}->{data}}, [ 1, $new, $original, $sdir, $dir ];
}

sub finish {
	my ($self, $dryrun) = @_;
	$self->{dryrun} = $dryrun;
	$self->{window}->show_all;
	Gtk2->main;
}

sub renameall {
	my ($button, $self) = @_;
	use Data::Dump;
	say(0,'Begin');
	foreach (@{$self->{list}->{data}}) {
		my ($do, $new, $original, $sdir, $dir) = @{$_};
		next unless $do;
		say(0, "Rename '$sdir/$original' -> '$dir/$new'");
		unless ($self->{dryrun}) {
			say(0, "Problem moving file '$raw' to '$new'") unless rename "$sdir/$raw", "$dir/$new";
		}
		
	}
	say(0,'End');
	Gtk2->main_quit;
}

1;
