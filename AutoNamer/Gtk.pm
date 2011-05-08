package AutoNamer::Gtk;
use Gtk2 '-init';
use Gtk2::SimpleList;
use constant TRUE  => 1;
use constant FALSE => 0;

my $window;
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

	$hbox = Gtk2::HBox->new;
	$self->{window}->add($hbox);
	
	$categories = Gtk2::SimpleList->new('Categories' => 'text');
	@{$categories->{data}} = qw/All AutoCorrected Failed/;
	$categories->select(0);
	$categories->signal_connect (row_activated => sub {
		my ($treeview, $path, $column) = @_;
		print "mmm, ".$categories->{data}[$_[1]->to_string][0]."\n";
	});
	$hbox->pack_start($categories, FALSE, FALSE, 0);
	
	$self->{list} = Gtk2::SimpleList->new (
	      'Do' => 'bool',
	      'New name' => 'text',
	      'Original' => 'text',
	      'Directory' => 'text',
	);
	$self->{list}->set_column_editable(1, TRUE);
	
	$vbox = Gtk2::VBox->new;
	$scrolled = Gtk2::ScrolledWindow->new;
	$scrolled->set_policy('automatic', 'automatic');
	$scrolled->add($self->{list});
	$vbox->add($scrolled);
	$hbox->add($vbox);
	
	$actionbar = Gtk2::HBox->new;
	$cancel = Gtk2::Button->new_from_stock('gtk-cancel');
	$cancel->set_size_request(100, 30);
	$cancel->signal_connect(clicked => sub {Gtk2->main_quit; TRUE});
	$apply = Gtk2::Button->new_from_stock('gtk-apply');
	$apply->set_size_request(100, 30);
	$actionbar->add_with_properties($apply, expand => FALSE, pack_type => 'end');
	$actionbar->add_with_properties($cancel, expand => FALSE, pack_type => 'end');
	$vbox->add_with_properties($actionbar, expand => FALSE);
}

sub rename {
	my ($self, $original, $new, $dryrun, $sdir, $dir) = @_;
	push @{$self->{list}->{data}}, [ 1, $new, $original, $dir ];
}

sub finish {
	my ($self) = @_;
	$self->{window}->show_all;
	Gtk2->main;
}

1;
