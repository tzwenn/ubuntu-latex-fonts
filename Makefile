###################
##
## Makefile for ubuntu-latex-fonts
##
## THIS PROJECT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
## EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
## MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
## IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
## CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
## TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
## SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Distributed files
#

FONTBASE = ubuntu
RES = resources
TFM := $(shell ls $(RES)/$(FONTBASE)*.tfm)
AFM  = $(TFM:%.tfm=%.afm)
PFB  = $(TFM:%.tfm=%.pfb)

MAP  = $(RES)/$(FONTBASE).map
STY  = $(RES)/$(FONTBASE).sty
FD  := $(shell ls $(RES)/t1$(FONTBASE)*.fd)

## Installation targets
#

# PREFIX = /usr/share/texmf-texlive
# automatically get directory path
PREFIX = $(shell kpsewhich -var-value TEXMFDIST)

TFMDIR = fonts/tfm/$(FONTBASE)
AFMDIR = fonts/afm/$(FONTBASE)
PFBDIR = fonts/type1/public/$(FONTBASE)

MAPDIR = fonts/map
STYDIR = tex/latex/$(FONTBASE)
FDDIR  = tex/latex/$(FONTBASE)

# These are the directories only owned by the ubuntu fonts,
# we'll have to create them
TARGETDIRS = $(TFMDIR) $(AFMDIR) $(PFBDIR) $(STYDIR) $(FDDIR)

## commands
#

CP      = cp
MKDIR   = mkdir -p
TEXHASH = texhash
#I'd liked very much to have updmap-sys working
UPDMAP  = updmap
RMDIR   = rm -rf

all:

makedirs:
	for d in $(TARGETDIRS); do \
		$(MKDIR) $(PREFIX)/$$d; \
	done
# just precaution, this is very unlikely to be needed
	$(MKDIR) $(PREFIX)/$(MAPDIR)
copy:
	$(CP) $(TFM) $(PREFIX)/$(TFMDIR)/
	$(CP) $(AFM) $(PREFIX)/$(AFMDIR)/
	$(CP) $(PFB) $(PREFIX)/$(PFBDIR)/
	$(CP) $(MAP) $(PREFIX)/$(MAPDIR)/
	$(CP) $(STY) $(PREFIX)/$(STYDIR)/
	$(CP) $(FD)  $(PREFIX)/$(FDDIR)/

reindex:
	$(TEXHASH) $(PREFIX)

enablemap:
	$(UPDMAP) --enable Map=$(MAP)

updatemap: enablemap

install: makedirs copy reindex

delfiles:
	for d in $(TARGETDIRS); do \
		$(RMDIR) $(PREFIX)/$$d; \
	done
	$(RM) $(PREFIX)/$(MAPDIR)/$(MAP)

disablemap:
	$(UPDMAP) --disable $(MAP)

cleanmap: disablemap

uninstall: delfiles reindex

help:
	@echo "Make file for ubuntu-latex-fonts"
	@echo "For installation of the Ubuntu Font Family type:\n"
	@echo "\tsudo make install"
#@echo "\tmake updatemap"
	@echo
	@echo "For uninstallation type:\n"
	@echo "\tsudo make uninstall"
#@echo "\tmake cleanmap"
	@echo
	@echo "Hint: By default the fonts are installed to $(PREFIX). \
You can change that behavior by passing PREFIX, e.g.:\n"
	@echo "\tmake PREFIX=~/texmf install"

.PHONY: install uninstall help
