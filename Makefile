## Makefile for dotahk
.PHONY: install install1 install2 diff

INSTALL=install -p
INSTFILES1=$(wildcard *.ahk) $(wildcard *.ahkl)
INSTDIR1=$(HOME)/.ahk_d
INSTFILES2=AutoHotkey.lnk
INSTDIR2=/c/Users/Kei/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup

install: install1 install2

install1: $(INSTFILES1)
	$(INSTALL) --target-directory=$(INSTDIR1) $^

install2: $(INSTFILES2)
	$(INSTALL) --target-directory=$(INSTDIR2) $^

diff: $(INSTFILES1)
	$(foreach instfile,$^,diff -u $(INSTDIR1)/$(instfile) $(instfile);)
