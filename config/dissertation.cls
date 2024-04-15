%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{config/dissertation}

%:-------------------------- book style -----------------------

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[11pt, pdftex, a4paper, twoside]{book} 

%:-------------------------- packages for fancy things -----------------------
\usepackage{mathptmx} % Default font for dissertations is Times.
\usepackage{array}
\usepackage{float}
\usepackage{placeins}
\usepackage{textcomp}
\usepackage{url}
\usepackage{multirow}
\usepackage{geometry}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{amsbsy}
\usepackage{amsthm}
\usepackage{mathrsfs}
\usepackage{accents}
\usepackage{bm}
\usepackage{bbm}
%\usepackage{graphics} 
\usepackage[pdftex]{graphicx} % for improved inclusion of graphics
\usepackage{epstopdf} % converts eps figures to pdf
\usepackage{subfig}
\usepackage{wrapfig} % to include figure with text wrapping around it
\usepackage[margin=10pt,font=small,labelfont=bf]{caption} % for improved layout of figure captions with extra margin, smaller font than text
\usepackage{fancyhdr} % for better header layout
\usepackage{eucal}
\usepackage[english,swedish]{babel}
\usepackage[usenames, dvipsnames]{color}
\usepackage[bottom]{footmisc}
\usepackage{enumerate} % enumerated list for List of Papers
\usepackage{ifthen}
\usepackage{multicol} % for pages with multiple text columns, e.g. References
\setlength{\columnsep}{20pt} % space between columns; default 10pt quite narrow
\usepackage[nottoc]{tocbibind} % correct page numbers for bib in TOC, nottoc suppresses an entry for TOC itself
%\usepackage{nextpage}
\usepackage[T1]{fontenc}
\usepackage{calligra}
\usepackage{datetime}
\usepackage{makecell}
\usepackage{longtable}
\usepackage{rotating}
\usepackage[onehalfspacing]{setspace}
\usepackage{titletoc}
% \usepackage[titles]{tocloft}
\usepackage[title]{appendix}
\usepackage[scaled]{uarial}
\usepackage{lipsum} % For adding dummy text

\renewcommand\boldsymbol[1]{\pmb{#1}}

\DeclareFixedFont{\timesEightteen}{\encodingdefault}{\sfdefault}{\seriesdefault}{\shapedefault}{17\p@}

\AtBeginEnvironment{subappendices}{%
\addcontentsline{toc}{section}{Appendices}
\captionsetup[table]{name=Appendix Table}
\captionsetup[figure]{name=Appendix Figure}
\setcounter{equation}{0}
\setcounter{table}{0}
\setcounter{figure}{0}
}

% For avoiding unwanted space between paragraphs
% Cf. https://tex.stackexchange.com/a/36429
\raggedbottom

%:-------------------------- PDF/PS setup -----------------------

\usepackage{ifpdf} 

\usepackage[
    pdftex, plainpages = false, pdfpagelabels, 
    pdfpagemode=UseOutlines,
    bookmarks,
    bookmarksopen = true,
    bookmarksnumbered = true,
    breaklinks = true,
    linktocpage,
    colorlinks = false,  % was true
    linkcolor = blue,
    urlcolor  = blue,
    citecolor = red,
    anchorcolor = green,
    hyperindex = true,
    hyperfigures
]{hyperref} 

\DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf}
\usepackage[pdftex]{graphicx}
\pdfcompresslevel=9
\graphicspath{{0_frontmatter/figures/}}

%:-------------------------- page layout -----------------------

%S5 settings (default)
\geometry{paperheight=24.2cm,paperwidth=16.5cm}
\geometry{left=2.25cm,right=2.25cm}
\geometry{top=1.8cm,bottom=2.3cm}

%:-------------------------- page layout -----------------------

% FRONTMATTER
\newcommand{\frontmatterSUecon}{
\frontmatter
\pagestyle{plain}
}

% MAINMATTER
\newcommand{\mainmatterSUecon}{
\begingroup
\cleardoublepage
\edef\x{\endgroup
\noexpand\mainmatter
\setcounter{page}{\the\value{page}}%
}%
\x

\cleardoublepage

\renewcommand\footnoterule{
    \kern-3\p@
    \hrule \@width 2in \kern 2.6\p@ % the \hrule is .4pt high
}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE]{\emph{\MakeUppercase{\ifnum\value{chapter}>0 Chapter \thechapter.\ \fi\leftmark}}}
\fancyhead[LO]{\emph{\MakeUppercase{\rightmark}}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

% BACKMATTER
\newcommand{\backmatterSUecon}{
\begingroup
\cleardoublepage
\edef\x{\endgroup
\noexpand\backmatter
\setcounter{page}{\the\value{page}}%
}%
\x

\cleardoublepage

\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE,LO]{\emph{\MakeUppercase{Sammafattning}}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

% DECLARATIONS
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% Subtitle
\def\subtitle#1{\gdef\@subtitle{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}

% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
    \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \else\newpage\fi}
    {\if@restonecol\twocolumn\else\newpage\fi}

% Half title page
\newcommand{\halftitlepage}%
{
\thispagestyle{empty}
    \noindent
    \ifx\@subtitle\undefined%
        {\large \MakeUppercase{\@title}\\}\\%
    \else %
        {\large \MakeUppercase{\@title \ -- \ \@subtitle}\\}\\%
    \fi%
    \noindent
    {\Large\textbf{\@author}}
\cleardoublepage
}

\crest{\includegraphics[width=25mm]{su-logo}}

% Title page
\renewcommand{\maketitle}{
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
{\large \vspace*{0mm} \hspace*{90mm} {{\@crest} \par} } %Move the logo
    \ifx\@subtitle\undefined%%
        {\Huge \vspace*{30mm}{\noindent}{\textsc{\@title}} \par \vspace*{4mm}}%
    \else %
        {\Huge \vspace*{30mm}{\noindent}{\textsc{\@title}} \par \vspace*{4mm}}%
        {\large {\noindent}{\@subtitle} \par \vspace*{8mm}}%
    \fi%
    {{\LARGE {\noindent}\@author} \par}
    \null\vfill
}

%:-------------------------- front matter layout -----------------------

\newenvironment{dedication}
{
    \phantom{.}
    \vspace{13cm}
    \begin{quote} \begin{flushright}}
{\end{flushright} \end{quote}}
