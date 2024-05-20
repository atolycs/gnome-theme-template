NOW_PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
INSTALL_TO := ${HOME}/.local/share/gnome-background-properties
DOWNLOADED_PATH := $(NOW_PATH:/=)

SED_OPTIONS := "@BACKGROUNDDIR@"
SRC := custom-template.xml

.PHONY: test build install

test:
	echo $(DOWNLOADED_PATH)

build: 
	sed -i -e s#$(SED_OPTIONS)#$(DOWNLOADED_PATH)#g $(SRC)

$(INSTALL_TO)/$(SRC): $(DOWNLOADED_PATH)/$(SRC)
	mkdir -p $(INSTALL_TO)
	ln -s $< $@

install: $(INSTALL_TO)/$(SRC)

