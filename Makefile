FONTBASE = ubuntu
TFM := $(shell ls $(FONTBASE)*.tfm)
AFM = $(TFM:%.tfm=%.afm)
PFB = $(TFM:%.tfm=%.pfb)
FD  = t1$(FONTBASE).fd

STY = $(FONTBASE).sty
MAP = $(FONTBASE).map

all:

install:
	echo "Installing"

