This project enables you to use the original Ubuntu Font Familiy (see: http://font.ubuntu.com ) with LaTeX2e.

Currently available fonts are Ubuntu regular, Ubuntu italic, Ubuntu bold and Ubuntu bold italic and can be changed by using the common <code>\\textit</code>, <code>\\textbf</code> commands.

##How to install##

You can just drop all these files into your project's folder and start using the fonts.

For global usage you will have to copy them into their according directories in your LaTeX-Distribution, e.g. for the Adobe Font Metrics on Texlive:

	mkdir -p /usr/share/texmf-texlive/fonts/afm/public/ubuntu/
	cp *.afm /usr/share/texmf-texlive/fonts/afm/public/ubuntu/

For TrueType fonts embedded into you PDFs, you must move the ttf-files into pdftex' <code>"TrueType Font Dir"</code>, as well as map the fonts in ubuntu.map. Afterwards run:

	texhash /usr/share/texmf-texlive/


##How to use##

If you want to change your font set mid-in your document just write:

	% If you are using pdflatex put this into your preamble
	\pdfmapfile{+ubuntu.map}
	
	\begin{document}

	% ...

	\usefont{T1}{ubuntu}{m}{n}

In case you'd liked to have you entire document be set using this font family add this to your preamble:

	\usepackage{ubuntu}

##What is missing##

Of course an automated installation (i.e. a nice Makefile) is missing yet.
Some testing would be nice too.

##Whom should be thanked##

First and foremost the Stylistic Foundations under the supervision of Canonical and Dalton Maag, enabling the community to build on their work.

The fonts were converted as described by Gordon Grubert ( http://fachschaft.physik.uni-greifswald.de/~stitch/ttf.html ). Thanks there too.
