This project enables you to use the original Ubuntu Font Familiy (see: http://font.ubuntu.com ) with LaTeX2e.

Currently available fonts are Ubuntu regular, Ubuntu italic, Ubuntu bold and Ubuntu bold italic (all version 0.71.2) and can be changed by using the common <code>\\textit</code> and <code>\\textbf</code> commands.

##How to install##

You can just drop all these files into your project's folder and start using the fonts.

For global installation and usage you just have to type:

	$ sudo make install

This will assume your TeX-distribution's location to be	<code>/usr/share/texmf-texlive/</code>. In case you like to change that (i.e. installing it just for your account) pass an other <code>PREFIX</code> to the Makefile:

	$ make PREFIX=~/texmf install

##How to use##

If you want to change your font set mid-in your document just write:

	% Put this into your preamble
	\pdfmapfile{+ubuntu.map}
	
	\begin{document}

	% ...

	\usefont{T1}{ubuntu}{m}{n}

In case you'd liked to have you entire document be set using this font family add this to your preamble:

	\usepackage{ubuntu}

##What is missing##

The makefile is designed for a usual texlive installation on Ubuntu Linux. An autolocation of the TeX-distribution have to be done. Currently also the use of <code>pdflatex</code> is enforced, old-school dvi stuff will not work.

There are also other shapes and style in the Ubuntu Font Family (Medium, Light) which have definitely to be included too. Changing them should be possible from the included package within the document.

Some testing would be nice too.

##Whom should be thanked##

First and foremost the Stylistic Foundations under the supervision of Canonical and Dalton Maag, enabling the community to build on their work.

The fonts were converted as described by Gordon Grubert ( http://fachschaft.physik.uni-greifswald.de/~stitch/ttf.html ). Thanks there too.
