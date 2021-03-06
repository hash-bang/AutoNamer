AutoNamer is a Perl script to try and correct weird file names for movies, music or TV shows.

It works by applying some simple (and configurable) rules to the file names in order to clean them up.

AutoNamer will try its best to correct file names given to it automatically. If --ui is specified it is possible to make this process interactive where AutoNamer will ask the user exactly what operations should be applied.

Command line reference
======================
```
NAME
    autonamer - AutoNamer, Simple app that tries to correctly name media
    files.

SYNOPSIS
            an [options] [files...]

OPTIONS
    --case
    --no-case
            Try to clean up the filename by checking for common casing
            faults such as CaMeLcAsInG or FULL CAPS. Can be negated with
            --no-case.

    --dir [path]
    -d [path]
            By default AN will try to rename the file in place, not altering
            the original files path. If you wish to output the media file to
            an alternate directory you can specify the output path here.

    --dryrun
    -n      Do everything BUT change the filename. This is used mainly to
            see what AN *would* do without actually doing it.

    --fakes
    --no-fakes
            Allow fake (i.e. non-existant) files to be passed on to
            AutoNamer. If this is set a list of fake files can be passed and
            names can be suggested. Trying to rename these files will
            obviously fail. This functionality is added primerily for
            testing purposes.

    --garbage
    --no-garbage
            Try to clean up the filename by removing all non english
            standard characters from the file name. Can be negated with
            --no-year.

    --imdb
    --no-imdb
            Try to contact IMDB to finalize details we've guessed in the
            earlier stages. Can be negated with --no-imdb.

    --regexp
    --no-regexp
            Apply the known regular expression hacks to try to tidy up the
            title. Can be negated with --no-regexp.

    --skipaf
            Skip the IMDB stage if we dont manage to clean up the file name
            correctly. If not set (the default) and the autocorrection stage
            fails, the original filename will be passed onto IMDB in a last
            ditch attempt to get something meaningful.

    --ui [ui]
            Sets which output interface to use. The default is 'auto'.

            Possible choices are:

            auto
                The default, this interface simply renames the files using
                the default suggestions.

            cli Interactive console mode. The user will be prompted upon
                each suggestion.

            gtk Use the GTK libraries to draw a graphical GUI interface.

    -v
    --verbose
            Be more verbose when outputting information to STDERR. Specify
            multiple times to increase verbosity.

    -t [string]
    --template [string]
            Overide the default output filename template. By default the
            template is '%t.%e'.

            The following strings will be expanded when determining the
            output filename:

            %e  The original file extension.

            %t  The title of the media, determined after the auto correction
                and (optional) IMDB stages.

            %y  The year the media was made.

    --year
    --no-year
            Extract the year of the media from the title and use it in the
            subsequent IMDB query (unless --no-imdb is set) Can be negated
            with --no-year.

DESCRIPTION
    AN is a simple file renamer that trys to apply a variety of methods to
    determine the true name of a given set of files. It can optionally
    rename the source files (and even move them) to the output filenames.

EXAMPLES
    an movies/*
        Simplist use of AN. This will scan the contents of the 'movies'
        directory for files matching recognized extensions. If it matches it
        will inteligently rename them.

    an -n movies/*
        Same as above but doesn't actually do anything. This is useful to
        see the effect of the renaming process without actually applying the
        effects.

    an movies/* -d .
        Scan the 'movies' directory renaming files as we go. Renamed files
        will be moved into the current directory.

    an movies/* -d -t '%t (%y).%e
        Same as above but also renames the files using the format 'Title
        (year).extension' e.g. 'Troy (2004).avi'.

INSTALLATION
    AN requires a certain set of CPAN modules. These can be installed using
    the following command as root:

            cpan IMDB::Film

    The module IMDB::Film has a nasty habit of failing tests. If prompted to
    perform these during the CPAN installation its probably best to select
    the default 'no' option when asked if you wish to test the module.

BUGS
    Quite probably.

    Please report to the author when found.

AUTHOR
    Matt Carter <m@ttcarter.com>

```

TODO
====

* .Deb files for Linux systems
* .exe installation files for Windows
* Refine the UI a bit so its more polished
