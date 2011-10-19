This project enables you to use the original [Ubuntu Font Familiy](http://font.ubuntu.com) with LaTeX2e.

Available fonts are Ubuntu Regular, Light, Medium, Condensed and Monospace (as of version 0.80). They can be modified using the common `\textit`, `\textbf` and `\texttt` commands. Please mind, that Light and Medium don't come with an own bold shape. Medium and Ubuntu Bold are used as fallbacks. There is no such thing for Ubuntu Condensed, it will always come by its default shape.

[![Flattr this](http://api.flattr.com/button/flattr-badge-large.png")](http://flattr.com/thing/275508/Ubuntu-LaTeX-Fonts)

##How to install##

You can just drop all these files into your project's folder and start using the fonts.

For global installation and usage you just have to type:

```bash
$ sudo make install
```

This will automatically determine your TeX-distribution's location. In case you want to change that behavior (i.e. installing it just for your account) pass an other `PREFIX` to the Makefile:

```bash
$ make PREFIX=~/texmf install
```

##How to use##

In case you'd liked to have you entire document be set using this font family add this to your preamble:

```latex
\usepackage{ubuntu}
```

Available package options are: `regular`, `light`, `medium`, `condensed`, standing for the different Ubuntu Fonts, respectively `none` for later activation.

For all fonts Ubuntu Monospace gets loaded as typewriter default, unless you specify `none`.

If you want to change your font set mid-in your document just write:

```latex
% Put this into your preamble
\usepackage[none]{ubuntu}

\begin{document}

% ...

{\fontUbuntu This is Ubuntu Regular}

Here, the \LaTeX standard is used again.
```

Alternatively `\fontUbuntuLight`, `\fontUbuntuMedium` or `\fontUbuntuCondensed` are provided.

##What is missing##

Changing the font in the middle of a file does not affect all writings, as section captions or other external defined texts. If this matters to you, consider setting your whole document in Ubuntu font and trigger for example `\usefont{cmbx12}{m}{n}` where needed.

Currently the use of `pdflatex` is enforced, old-school dvi stuff will not work.

Of course some testing and a documentation would be nice too.

##Whom should be thanked##

First and foremost the Stylistic Foundations under the supervision of [Canonical](http://www.canonical.com/) and [Dalton Maag](http://www.daltonmaag.com/about/our_people.html), enabling the community to build on their work.

The fonts were converted as described by [Gordon Grubert](http://fachschaft.physik.uni-greifswald.de/~stitch/ttf.html). Thanks there too.

Thanks to Dominik Moritz ([domoritz](https://github.com/domoritz)) for patching the Makefile, so it automatically determines where to install this package.

##How to support##

* Download it, write some nice stuff
* Publish your writings, tell your friends
* Fork it, fix an issue. Send pull request
* Flattr it
