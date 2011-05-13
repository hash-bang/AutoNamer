package AutoNamer::Cli;
use feature 'switch';
use MC::Input::Cli;

sub new {
	my $self = {};
	bless $self;
	return $self;
}

sub rename {
	my ($self, $original, $new, $dryrun, $sdir, $dir) = @_;

	CONSOLE: {
		say(0) if $fileno++; # Intert blank line so we dont upset dumb people
		say(0, "Original: $original");
		say(0, "New name: $new");
		given (ask('Option', 'g', qw/g s r o q ?/)) {
			when ('?') { # Help / Confusion key
				say(0, <DATA>);
				redo CONSOLE;
			}
			when ('g') { # Do it
				say(0, "Rename '$raw' '$new'");
				unless ($dryrun) {
					say(0, "Problem moving file '$raw' to '$new'") unless rename "$sdir/$raw", "$dir/$new";
				}
			}
			when ('s') { next FILE } # Skip
			when (/r|o/) { # Display editable prompt using either the AN (option: r) or unedited (option: o) filename as the detault
				if (my $newname = prompt("Specify name", /o/ ? $new : $original, 0, [$new, $original])) {
					$new = $newname;
					redo CONSOLE;
				} else {
					redo CONSOLE unless $newname;
				}
			}
			when ('q') {
				say(0, "Quiting");
				exit 1;
			}
			default { say(0, "Invalid value. Skipping"); next FILE }
		}
	}
}

sub finish {
	my($self, $dryrun) = @_;
	say(0, 'Finished');
}

1;

# DATA contains the console help screen because I'm lazy and can't be arsed to deal with this in a HereDoc
__DATA__
g	Go (default)	Perform the suggested rename operation
s	Skip		Do not do anything to this file. Move onto the next
r	Rename		Let me override the AN suggested naming
o	Original ren	Same as 'r' but use the original filename
q	Quit		Stop all further operations and exit immediately
?	Help		Display this help screen
