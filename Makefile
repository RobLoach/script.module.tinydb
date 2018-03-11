# script.module.tinydb
#
# This Makefile will update the TinyDB library automagically.
#
# 1. Change the VERSION to the latest tag
# 2. Run `make`
#

NAME = script.module.tinydb
VERSION = v3.8.0
KODIBRANCH = krypton

update:
	rm -rf lib
	git clone --branch=$(VERSION) https://github.com/msiemens/tinydb.git lib
	mv lib/LICENSE lib/tinydb

repo-scripts:
	git clone --branch=$(KODIBRANCH) https://github.com/xbmc/repo-scripts.git

deploy: repo-scripts
	rm -rf repo-scripts/$(NAME)
	git archive HEAD | gzip > $(NAME).tar.gz
	mkdir repo-scripts/$(NAME)
	tar xf $(NAME).tar.gz -C repo-scripts/$(NAME)
	cd repo-scripts && git status
	@echo "Review changes and push them up as a Pull Request at repo-scripts"
