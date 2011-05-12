VERSION := $(shell perl -MExtUtils::MakeMaker -le 'print MM->parse_version(shift)' an)

README: an
	pod2text an >README
	git add README
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
	xargs an --no-imdb --fakes -vvn --ui debug <tests/Torrents.txt

clean:
	-rm -r $(DEBFACTORY)
