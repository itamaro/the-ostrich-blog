help:
	@echo 'Makefile for The Ostrich Blog                                      '
	@echo '                                                                   '
	@echo 'Usage:                                                             '
	@echo '   make dev        Run local Hugo dev server                       '
	@echo '   make build      Build public site for distribution              '
	@echo '   make firebase   Deploy public dir to Firebase                   '
	@echo '   make clean      Clean public output dir                         '
	@echo '                                                                   '

dev:
	rm -rf dev
	@echo "Running Hugo dev server with drafts"
	hugo server --watch --buildDrafts --destination dev

build: clean
	hugo

firebase: clean build
	firebase deploy
	@echo "Finished deploying site to Firebase"

clean:
	rm -rf public
	@echo "Finished cleaning public output dir"

.PHONY: help dev build firebase clean
