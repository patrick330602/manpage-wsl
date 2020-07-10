DESTDIR ?=
PREFIX ?= /usr

DEST = dist

DATETMP = $(shell date +%Y-%m-%d)
VERTMP = 1.0

OV_SOURCES:=wslpath.1 \
	wsl.7 \
	wsl2.7

.PHONY: $(OV_SOURCES)

$(OV_SOURCES):
	[ -d $(DEST) ] || mkdir $(DEST)
	for s in $(OV_SOURCES); do \
		sed -e 's/DATEPLACEHOLDER/'$(DATETMP)'/' -e 's/VERSIONPLACEHOLDER/'$(VERTMP)'/' $${s} > $(DEST)/$${s}.tmp; \
		mv $(DEST)/$${s}.tmp $(DEST)/$${s}; \
		gzip -f -q $(DEST)/$${s}; \
	done


install:
	install -Dm 644 $(DEST)/*.1.gz -t $(DESTDIR)$(PREFIX)/share/man/man1
	install -Dm 644 $(DEST)/*.7.gz -t $(DESTDIR)$(PREFIX)/share/man/man7