# su-econ-dissertation-template

## About

Template for a doctoral dissertation in Economics that follows the Stockholm University [dissertation style guide](https://www.su.se/polopoly_fs/1.690436.1699960340!/menu/standard/file/Instructions%20for%20Word%20template%20doctoral%20thesis_2023-09-04.pdf).

A compiled version of the template can be found [here](./dissertation.pdf).

Adapted from the [Stockholm University PhD thesis template](https://www.overleaf.com/latex/templates/stockholm-university-phd-thesis-template/mrxkgjdpwrvn) in Overleaf.

## Using Arial font in TOC

To use the Arial font in the table of contents, you need to download `getnonfreefonts` and then add the Arial font.

You can do this by following these steps:

1. Download the installer from [here](https://tug.org/fonts/getnonfreefonts/).
2. Open a terminal, go to the folder where the installer was downloaded, and run `sudo texlua install-getnonfreefonts`.
3. Download the Arial font by running `sudo getnonfreefonts --sys arial-urw`.

If you encounter problems with doing this, consider also using the Helvetica font (very similar to Arial) for the TOC.  
To change the font, change [line 55 in `config/dissertation.cls`](./config/dissertation.cls#L55) to `\usepackage[scaled]{helvet}`.

## Using the template

To compile [the dissertation TeX file](./dissertation.tex), use `pdflatex`.

For example, if you have a Mac and use [TeXShop](https://en.wikipedia.org/wiki/TeXShop), use `pdflatexmk` to compile.

I am not planning to make changes to this repository. You are free to use this template by downloading or forking the repository.
