# script.module.tinydb
#
# This Makefile will update the TinyDB library automagically.
#
# 1. Change the VERSION to the latest tag
# 2. Run `make`
#

VERSION = v3.8.0

update:
	rm -rf lib
	git clone --branch=$(VERSION) https://github.com/msiemens/tinydb.git lib
	mv lib/LICENSE lib/tinydb

deploy:
	rm -rf repo-scripts
	git clone --branch=krypton https://github.com/xbmc/repo-scripts.git
	rm -rf repo-scripts/script.module.tinydb
