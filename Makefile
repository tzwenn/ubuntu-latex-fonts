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
TFM := $(shell ls $(FONTBASE)*.tfm)
AFM = $(TFM:%.tfm=%.afm)
PFB = $(TFM:%.tfm=%.pfb)

MAP = $(FONTBASE).map
STY = $(FONTBASE).sty
FD  = t1$(FONTBASE).fd

## Installation targets
#

PREFIX = /usr/share/texmf-texlive

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
UPDMAP  = updmap-sys
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

install: makedirs copy reindex enablemap

delfiles:
	for d in $(TARGETDIRS); do \
		$(RMDIR) $(PREFIX)/$$d; \
	done
	$(RM) $(PREFIX)/$(MAPDIR)/$(MAP)

disablemap:
	$(UPDMAP) --disable $(MAP)

uninstall: delfiles reindex disablemap 

