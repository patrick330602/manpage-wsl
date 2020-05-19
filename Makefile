DATETMP = $(shell date +%Y-%m-%d)
DEST = dist
VERTMP = 1.0

all: wslpath

wslpath:
	[ -d $(DEST) ] || mkdir $(DEST)
	sed -e 's/DATEPLACEHOLDER/'$(DATETMP)'/' -e 's/VERSIONPLACEHOLDER/'$(VERTMP)'/' wslpath.1 > $(DEST)/wslpath.1.tmp
	mv $(DEST)/wslpath.1.tmp $(DEST)/wslpath.1
	gzip -f -q $(DEST)/wslpath.1
