# текущий каталог
CWD		= $(CURDIR)
# имя пакета
MODULE	= $(notdir $(CWD))

# дата (для .zip)
NOW		= $(shell date +%d%m%y)
# версия сборки (короткий git hash)
REL		= $(shell git rev-parse --short=4 HEAD)

PIP		= $(CWD)/bin/pip3
PY		= $(CWD)/bin/python3

NIMBLE	= $(HOME)/.nimble/bin/nimble
PRETTY	= $(HOME)/.nimble/bin/nimpretty

# сетевые настройки для веб-сервера по умолчанию
IP     ?= 127.0.0.1
PORT   ?= 19999

WGET	= wget -c --no-check-certificate

PANDOC	= /usr/bin/pandoc


HTML  = docs/index.html
HTML += docs/README.html
HTML += docs/HowWrite.html
# HTML += docs/Как\ стать\ соавтором.html

# первое правило: по умолчанию, будет использовано при запуске make без параметров
.PHONY: all
all: metalcore

docs/index.html: $(PANDOC) wiki/Home.md pandoc.py Makefile
	$(PANDOC) wiki/Home.md -f gfm -t json | $(PY) pandoc.py > $@.json
#	cat $@.json | $(PANDOC) -s -f json -t html -o $@ --metadata title=$(MODULE)
docs/%.html: $(PANDOC) wiki/%.md
	$^ -f gfm -t html -o $@

.PHONY: hello
hello: $(NIMBLE)
	$(MAKE) -C $@
#	cd $@ ; $< build ; ./$@

.PHONY: metalcore
metalcore: $(NIMBLE)
	$(MAKE) -C $@



# установка ПО

.PHONY: install
install: debian $(PIP)
	$(PIP) install    -r requirements.txt
	$(MAKE) requirements.txt

# обновление ПО

.PHONY: update
update: debian $(PIP)
	$(PIP) install -U    pip
	$(PIP) install -U -r requirements.txt
	$(MAKE) requirements.txt

$(PIP) $(PY):
	python3 -m venv .
	$(PIP) install -U pip pylint autopep8
	$(MAKE) requirements.txt

.PHONY: requirements.txt
requirements.txt: $(PIP)
	$< freeze | grep -v 0.0.0 > $@

.PHONY: debian
debian:
	sudo apt update
	sudo apt install -u `cat apt.txt`

$(NIMBLE):
	curl https://nim-lang.org/choosenim/init.sh -sSf | sh



.PHONY: master shadow release zip wiki

MERGE  = Makefile README.md .gitignore .vscode apt.txt requirements.txt
MERGE += wiki docs
# MERGE += src tests
MERGE += hello nims macG4

master:
	git checkout $@
	git checkout shadow -- $(MERGE)

shadow:
	git checkout $@

release:
	git tag $(NOW)-$(REL)
	git push -v && git push -v --tags
	git checkout shadow

zip:
	git archive --format zip --output $(MODULE)_src_$(NOW)_$(REL).zip HEAD

wiki:
	cd $@ ; git pull -v
	git add -f wiki/*
	cd $@ ; git push -v
