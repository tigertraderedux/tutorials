all: git.html

%.html: %.md
	markdown $< > $@
