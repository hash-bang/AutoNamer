VERSION := $(shell perl -MExtUtils::MakeMaker -le 'print MM->parse_version(shift)' autonamer)

.PHONY: README.md

README.md: autonamer
	pod2text autonamer | perl -e '$$_=join("",<>); s/(.*<!-- POD -->).*(<!-- END POD -->.*)/"$$1\n" . join("", <STDIN>) . $$2/es; print;' README.md >README.md.tmp
	mv README.md.tmp README.md
	git add README.md
	git commit -m 'Auto update from POD'

commit: README
	-git commit -a

push: commit
	git push

update:
	cd MC; git pull

version:
	echo "VERSION IS $(VERSION)"

test:
	xargs autonamer --no-imdb --fakes -vvn --ui debug <tests/Movies.txt

clean:
	-rm -r $(DEBFACTORY)
