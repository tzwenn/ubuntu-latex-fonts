This project enables you to use the original Ubuntu Font Familiy (http://font.ubuntu.com) with LaTeX2e.

Available fonts are Ubuntu Regular, Light and Medium (all version 0.71.2). They can be modified using the common <code>\\textit</code> and <code>\\textbf</code> commands. Please mind, that Light and Medium don't come with an own bold shape. Medium and Ubuntu Bold are used as fallbacks.

##How to install##

You can just drop all these files into your project's folder and start using the fonts.

For global installation and usage you just have to type:

	$ sudo make install

This will automatically determine your TeX-distribution's location. In case you want to change that behavior (i.e. installing it just for your account) pass an other <code>PREFIX</code> to the Makefile:

	$ make PREFIX=~/texmf install

##How to use##

In case you'd liked to have you entire document be set using this font family add this to your preamble:

	\usepackage{ubuntu}

Available package options are: <code>regular</code>, <code>light</code>, <code>medium</code>, standing for the different Ubuntu Fonts, respectively <code>none</code> for later activation.

If you want to change your font set mid-in your document just write:

	% Put this into your preamble
	\usepackage[none]{ubuntu}
	
	\begin{document}

	% ...

	\fontUbuntu 

or alternatively <code>\fontUbuntuLight</code> or <code>\fontUbuntuMedium</code>.

##What is missing##

The makefile is designed for a usual texlive installation on Ubuntu Linux. An autolocation of the TeX-distribution have to be done. Currently also the use of <code>pdflatex</code> is enforced, old-school dvi stuff will not work.

There are also other shapes and style in the Ubuntu Font Family (Medium, Light) which have definitely to be included too. Changing them should be possible from the included package within the document.

Some testing would be nice too.

##Whom should be thanked##

First and foremost the Stylistic Foundations under the supervision of Canonical and Dalton Maag, enabling the community to build on their work.

The fonts were converted as described by Gordon Grubert (http://fachschaft.physik.uni-greifswald.de/~stitch/ttf.html). Thanks there too.

Thanks to Dominik Moritz (domoritz) (https://github.com/domoritz) for patching the Makefile, so it automatically determines where to install all files.
