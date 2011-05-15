# Distributed files

FONTBASE = ubuntu
TFM := $(shell ls $(FONTBASE)*.tfm)
AFM = $(TFM:%.tfm=%.afm)
PFB = $(TFM:%.tfm=%.pfb)

MAP = $(FONTBASE).map
STY = $(FONTBASE).sty
FD  = t1$(FONTBASE).fd

# Installation targets

PREFIX = /usr/share/texmf-texlive

TFMDIR = fonts/tfm/$(FONTBASE)
AFMDIR = fonts/afm/$(FONTBASE)
PFBDIR = fonts/type1/public/$(FONTBASE)

MAPDIR = fonts/map
STYDIR = tex/latex/$(FONTBASE)
FDDIR  = tex/latex/$(FONTBASE)

# commands

CP = cp

all:

install:
	$(CP) $(TFM) $(PREFIX)/$(TFMDIR)/
	$(CP) $(AFM) $(PREFIX)/$(AFMDIR)/
	$(CP) $(PFB) $(PREFIX)/$(PFBDIR)/
	$(CP) $(MAP) $(PREFIX)/$(MAPDIR)/
	$(CP) $(STY) $(PREFIX)/$(STYDIR)/
	$(CP) $(FD)  $(PREFIX)/$(FDDIR)/
