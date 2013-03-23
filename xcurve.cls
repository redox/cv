%%
%% This is file `xcurve.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% curve.cls
%% 


%% Copyright (C) 2007 Didier Verna

%% This file is part of XCurVe.

%% XCurVe may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.1
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%% http://www.latex-project.org/lppl.txt
%% and version 1.1 or later is part of all distributions of LaTeX
%% version 1999/06/01 or later.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{xcurve}[2007/06/01 v0.1
      eXtra Curriculum Vitae class for LaTeX2e]

\RequirePackage{ltxtable}
\RequirePackage{calc}
\RequirePackage{color}
\RequirePackage{colortbl}

\definecolor{titlecolor}{rgb}{0.211,0.373,0.569}
\definecolor{subtitlecolor}{rgb}{0.310,0.506,0.741}
\definecolor{rubriccolor}{rgb}{0.211,0.373,0.569}
\definecolor{subrubriccolor}{rgb}{0.310,0.506,0.741}


\newif\ifstrok\strokfalse
\def\strtest#1#2{%
  \def\@strone{#1}\def\@strtwo{#2}%
  \ifstrok\else\ifx\@strone\@strtwo\stroktrue\fi\fi}

\gdef\@nextentry{}

\def\@keyfont{\bfseries}
\newcommand\keyfont[1]{\gdef\@keyfont{#1}}

\newcolumntype{k}{>{\@keyfont}l}
\newcommand\keyalignment[1]{%
  \strokfalse\strtest{#1}{l}\strtest{#1}{r}\strtest{#1}{c}%
  \ifstrok\else%
    \ClassError{xcurve}{Invalid key alignment}{%
      You have called \protect\keyalignment\space with an invalid value.%
      \MessageBreak
      Valid options include l, c, and r.\MessageBreak
      Type X <return> to quit, fix the typo, and rerun LaTeX.}%
  \fi
  \newcolumntype{k}{>{\@keyfont}#1}
}

\def\@prefix{\tiny\textbullet}
\newcommand\prefix[1]{\gdef\@prefix{#1}}

\def\@maybekey#1{%
  \def\@newkey{#1}%
  \ifx\@previouskey\@newkey\gdef\@@key{}\else%
    \gdef\@@key{#1}\gdef\@previouskey{#1}%
  \fi}

\def\@alwayskey#1{%
  \gdef\@@key{#1}}

\let\@key\@alwayskey
\DeclareOption{skipsamekey}{\let\@key\@maybekey}

\newcommand\@entry[2][]{%
  \gdef\@nextentry{}\@key{#1}%
  \egroup% end of \noalign opened in \entry.
  \@@key&\@prefix&#2\\}

\newcommand\@sentry[1][]{%
  \gdef\@nextentry{\\}\@key{#1}%
  \egroup% end of \noalign opened in \entry.
  \@@key&\@prefix&}

\newcommand\entry{%
  \@nextentry
  \noalign\bgroup\gdef\@beforespace{-\subrubricbeforespace}%
  \@ifstar{\@sentry}{\@entry}}

\newcommand\noentry[1]{\@nextentry
  \noalign{\gdef\@nextentry{}}#1&&\kill}

\def\@subrubricfont{\Large\itshape\color{subrubriccolor}}
\newcommand\subrubricfont[1]{\gdef\@subrubricfont{#1}}

\newlength\subrubricbeforespace
\setlength\subrubricbeforespace{2pt}

\newlength\subrubricspace
\setlength\subrubricspace{3pt}

\let\@subrubricmark\@gobble

\def\@@subrubric#1{%
  \parbox{0cm}{%
    \raisebox{\@beforespace}{\@subrubricfont#1}%
    \par\vspace\subrubricspace}%
  \@subrubricmark{#1}}


\def\@clcccolsep{\hspace{\tabcolsep}\ifx\@prefix\@empty~\fi}

\def\@subrubric@l#1{\multicolumn{3}{@{}l@{}}{\@@subrubric{#1}}}
\def\@subrubric@c#1{\multicolumn{3}{@{}c@{}}{\@@subrubric{#1}}}
\def\@subrubric@r#1{\multicolumn{3}{@{}r@{}}{\@@subrubric{#1}}}
\def\@subrubric@cl#1{&\multicolumn{2}{@{\@clcccolsep}l@{}}{\@@subrubric{#1}}}
\def\@subrubric@cc#1{&\multicolumn{2}{@{\@clcccolsep}c@{}}{\@@subrubric{#1}}}

\let\@subrubric\@subrubric@cl

\newcommand\subrubricalignment[1]{%
  \def\@curve@temp@a{\let\@subrubric}
  \expandafter\@curve@temp@a\csname @subrubric@#1\endcsname
  \@ifundefined{@subrubric}{%
    \ClassError{xcurve}{Invalid subrubric alignment}{%
      You have called \protect\subrubricalignment\space with an invalid value.%
      \MessageBreak
      Valid options include l, c, r, cl and cc.\MessageBreak
      Type X <return> to quit, fix the typo, and rerun LaTeX.}}
}

\newcommand\subrubric[1]{%
  \@nextentry
  \noalign{\gdef\@nextentry{}}%
  \@subrubric{#1}\\*}

\newlength{\@almosttextwidth}
\AtBeginDocument{\setlength\@almosttextwidth{\textwidth-\hfuzz}}

\def\@rubricfont{\Large\bfseries\color{rubriccolor}}
\newcommand\rubricfont[1]{\gdef\@rubricfont{#1}}

\newlength\rubricspace
\setlength\rubricspace{5pt}

\def\@@rubrichead#1{\@rubricfont#1}

\def\@rubrichead@l#1{\multicolumn{3}{@{}l@{}}{\@@rubrichead{#1}}\\}
\def\@rubrichead@c#1{\multicolumn{3}{@{}c@{}}{\@@rubrichead{#1}}\\}
\def\@rubrichead@r#1{\multicolumn{3}{@{}r@{}}{\@@rubrichead{#1}}\\}
\def\@rubrichead@cl#1{%
  &\multicolumn{2}{@{\@clcccolsep}l@{}}{\@@rubrichead{#1}}\\}
\def\@rubrichead@cc#1{%
  &\multicolumn{2}{@{\@clcccolsep}c@{}}{\@@rubrichead{#1}}\\}

\let\@rubrichead\@rubrichead@c

\newcommand\rubricalignment[1]{%
  \def\@curve@temp@a{\let\@rubrichead}
  \expandafter\@curve@temp@a\csname @rubrichead@#1\endcsname
  \@ifundefined{@rubrichead}{%
    \ClassError{xcurve}{Invalid rubric alignment}{%
      You have called \protect\rubricalignment\space with an invalid value.%
      \MessageBreak
      Valid options include l, c, r, cl and cc.\MessageBreak
      Type X <return> to quit, fix the typo, and rerun LaTeX.}}
}

\newlength\rubricafterspace
\setlength\rubricafterspace{0pt}

\let\@rubricmark\@gobble

\newenvironment{rubric}[1]{%
  %% \begin{rubric}
  \def\raggedright{%
    \@rightskip\@flushglue\rightskip\@rightskip\leftskip\z@skip}%
  \def\raggedleft{%
    \rightskip\z@skip\leftskip\@flushglue\parfillskip\z@skip}%
  \gdef\@beforespace{0pt}%
  \gdef\@nextentry{}%
  \gdef\@previouskey{}%
  \global\let\old@newpage\newpage%
  \global\let\old@pagebreak\pagebreak%
  \global\let\old@nopagebreak\nopagebreak
  \begin{longtable}{@{}kl@{~}X@{}}
    \@rubrichead{#1}
    \endfirsthead
    \@rubrichead{#1\@continuedname}
    \endhead
	\arrayrulecolor{rubriccolor}
	\hline
	\vspace\rubricspace\\
    \noalign{\@rubricmark{#1}%
      \global\let\in@newpage\newpage%
      \global\let\in@pagebreak\pagebreak%
      \global\let\in@nopagebreak\nopagebreak%
      \gdef\newpage{\@nextentry\noalign{\gdef\@nextentry{}}\in@newpage}
      \gdef\pagebreak{\@nextentry\noalign{\gdef\@nextentry{}}\in@pagebreak}
      \gdef\nopagebreak{\@nextentry\noalign{\gdef\@nextentry{}}\in@nopagebreak}}}{%
    %% \end{rubric}
    \@nextentry
  \end{longtable}\par\vspace\rubricafterspace
  \global\let\newpage\old@newpage%
  \global\let\pagebreak\old@pagebreak%
  \global\let\nopagebreak\old@nopagebreak}

\newcommand\continuedname[1]{\gdef\@continuedname{#1}}

\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

\def\header@scale{.5}
\newcommand\headerscale[1]{\gdef\header@scale{#1}}
\@onlypreamble\headerscale

\newlength\headerspace
\setlength\headerspace{10pt}

\def\@leftheader{%
  \ClassError{xcurve}{No \protect\leftheader\space given}{%
    You have called \protect\makeheaders, %
    but you didn't provide a left header.\MessageBreak
    Type X <return> to quit, add a call to \protect\lefheader\space %
    in the preamble of your CV,\MessageBreak
    and rerun LaTeX.}}
\newcommand\leftheader[1]{\gdef\@leftheader{#1}}
\@onlypreamble\leftheader

\def\@rightheader{%
  \ClassError{xcurve}{No \protect\rightheader\space given}{%
    You have called \protect\makeheaders, %
    but you didn't provide a right header.\MessageBreak
    Type X <return> to quit, add a call to \protect\rightheader\space %
    in the preamble of your CV,\MessageBreak
    and rerun LaTeX.}}
\newcommand\rightheader[1]{\gdef\@rightheader{#1}}
\@onlypreamble\rightheader

\def\photo@scale{.1}
\newcommand\photoscale[1]{\gdef\photo@scale{#1}}
\@onlypreamble\photoscale

\newlength\photosep
\setlength\photosep{10pt}

\newcommand\photo[2][l]{%
  \RequirePackage{graphicx}
  \strokfalse\strtest{#1}{l}\strtest{#1}{r}\strtest{#1}{c}%
  \ifstrok\else\ClassError{xcurve}{Invalid argument to \protect\photo}{%
    Argument 2 of \protect\photo must be `l', `r' or `c'.}\fi
  \def\tmp@cmd{\global\let\makeheaders@}
  \expandafter\tmp@cmd\csname makeheaders@#1\endcsname
  \gdef\photo@file{#2}}
\@onlypreamble\photo

\newlength\photo@width

\def\includephoto@t{%
  \raisebox{.7\baselineskip-\height}{%
    \includegraphics[width=\photo@width]{\photo@file}}}

\def\includephoto@c{%
  \raisebox{-.5\height}{%
    \includegraphics[width=\photo@width]{\photo@file}}}

\def\includephoto@b{\includegraphics[width=\photo@width]{\photo@file}}

\newlength\leftheader@width
\newlength\rightheader@width

\def\makeheaders@l#1{%
  \setlength\photo@width{\photo@scale\textwidth}
  \setlength\leftheader@width{%
    (\textwidth - \photo@width - \photosep) * \real{\header@scale}}
  \setlength\rightheader@width{%
    \textwidth - \photo@width - \photosep - \leftheader@width}
  \parbox[#1]{\photo@width + \photosep}{\includephoto@\hspace\photosep}%
  \parbox[#1]{\leftheader@width}{\@leftheader}%
  \parbox[#1]{\rightheader@width}{\raggedleft\@rightheader}}

\def\makeheaders@c#1{%
  \setlength\photo@width{\photo@scale\textwidth}
  \setlength\leftheader@width{(\textwidth - \photo@width) * \real{.5}}
  \setlength\rightheader@width{\leftheader@width}
  \parbox[#1]{\leftheader@width}{\@leftheader}%
  \parbox[#1]{\photo@width}{\includephoto@}%
  \parbox[#1]{\rightheader@width}{\raggedleft\@rightheader}}

\def\makeheaders@r#1{%
  \setlength\photo@width{\photo@scale\textwidth}
  \setlength\leftheader@width{%
    (\textwidth - \photo@width - \photosep) * \real{\header@scale}}
  \setlength\rightheader@width{%
    \textwidth - \photo@width - \photosep - \leftheader@width}
  {\setlength\arrayrulewidth{12pt}\arrayrulecolor{subtitlecolor}
  \begin{tabularx}{\leftheader@width}{|l}
	\@leftheader
  \end{tabularx}}
  \parbox[#1]{\rightheader@width}{\raggedleft\@rightheader}%
  \parbox[#1]{\photo@width + \photosep}{\vspace{-40pt}\hspace\photosep\includephoto@}}

\def\makeheaders@#1{%
  \setlength\leftheader@width{\header@scale\textwidth}%
  \setlength\rightheader@width{\textwidth - \leftheader@width}%
  \parbox[#1]{\leftheader@width}{\@leftheader}%
  \parbox[#1]{\rightheader@width}{\raggedleft\@rightheader}}

\newcommand\makeheaders[1][c]{%
  \strokfalse\strtest{#1}{t}\strtest{#1}{b}\strtest{#1}{c}%
  \ifstrok\else\ClassError{xcurve}{Invalid argument to \protect\makeheaders}{%
    Argument of \protect\makeheaders must be `t', `b' or `c'.}\fi
  \def\tmp@cmd{\global\let\includephoto@}
  \expandafter\tmp@cmd\csname includephoto@#1\endcsname
  \makeheaders@{#1}%
  \par\vspace\headerspace}

\@onlypreamble\title

\def\@titlefont{\Huge\bfseries\color{titlecolor}}
\newcommand\titlefont[1]{\gdef\@titlefont{#1}}
\@onlypreamble\titlefont

\newlength\titlespace
\setlength\titlespace{5pt}

\newlength\subtitlespace
\setlength\subtitlespace{-20pt}

\let\@subtitle\@undefined
\newcommand\subtitle[1]{\gdef\@subtitle{#1}}
\@onlypreamble\subtitle

\def\@subtitlefont{\Large\itshape\color{subtitlecolor}}
\newcommand\subtitlefont[1]{\gdef\@subtitlefont{#1}}
\@onlypreamble\subtitlefont

\newcommand\maketitle{%
  \begin{center}
    {\@titlefont\@title}
	\vspace\titlespace
    \ifx\@subtitle\@undefined\else\\\@subtitlefont\@subtitle\fi
  \end{center}
  \vspace\subtitlespace}

\let\@flavor\empty
\newcommand\flavor[1]{\gdef\@flavor{#1}
  \ifx\@flavor\empty\else\edef\@flavor{.\@flavor}\fi}

\DeclareOption{ask}{%
  \typein[\@flavor]{Please specify a CV flavor (none by default):}
  \ifx\@flavor\empty\else\edef\@flavor{.\@flavor}\fi}

\def\@curveinput#1{%
  \IfFileExists{#1\@flavor.ltx}{\@iinput{#1\@flavor.ltx}}{%
    \IfFileExists{#1\@flavor.tex}{\@iinput{#1\@flavor.tex}}{%
      \IfFileExists{#1.ltx}{\@iinput{#1.ltx}}{%
\IfFileExists{#1.tex}{\@iinput{#1.tex}}{%
  \@iinput{#1}}}}}}

\renewcommand\input{\@ifnextchar\bgroup\@curveinput\@@input}

\newcommand\makerubric[1]{\LTXtable{\@almosttextwidth}{#1}}

\let\newblock\par
\newcounter{bibcount}

\AtBeginDocument{
  \@ifpackageloaded{multibbl}{
    %% multibbl version
    \def\bibliography#1#2#3{%
      \@ifundefined{#1@auxfile}{}{\expandafter\immediate%
\write\csname #1@auxfile\endcsname{\string\bibdata{#2}}}%
      \def\bibname{#3}%
      \def\refname{#3}%
      \IfFileExists{#1.bbl}{\makerubric{#1.bbl}}{%
\typeout{No file #1.bbl.}}}
  }{ %% standard version
    \def\bibliography#1{%
      \if@filesw
\immediate\write\@auxout{\string\bibdata{#1}}%
      \fi
      \IfFileExists{\jobname.bbl}{\makerubric{\jobname.bbl}}{%
\typeout{No file \jobname.bbl.}}}
  }
}

\AtBeginDocument{
  \@ifpackageloaded{bibentry}{}{
    \def\@lbibitem[#1]#2{\@sentry[\@biblabel{#1}]%
      \if@filesw{%
\let\protect\noexpand%
\immediate\write\@auxout{\string\bibcite{#2}{#1}}}
      \fi%
      \ignorespaces}
    \def\@bibitem#1{\stepcounter{bibcount}\@sentry[\@biblabel{\thebibcount}]%
      \if@filesw%
\immediate\write\@auxout{\string\bibcite{#1}{\thebibcount}}%
      \fi%
      \ignorespaces}
    \renewcommand\bibitem{%
      %% #### FIXME: Dirty code duplication from \entry
      \@nextentry
      \noalign\bgroup\gdef\@beforespace{-\subrubricbeforespace}%
      \@ifnextchar[\@lbibitem\@bibitem}
  }
}

\newcommand\listpubname[1]{\gdef\@listpubname{#1}}

\newenvironment{thebibliography}[1]{%
  \let\@key\@alwayskey
  \def\@prefix{}
  \begin{rubric}{\@ifundefined{bibname}{%
\@ifundefined{refname}{\@listpubname}{\refname}}{%
\bibname}}
  }{%
  \end{rubric}
}

\DeclareOption{english}{%
  \continuedname{~(continued)}
  \listpubname{List of Publications}}
\DeclareOption{french}{%
  \continuedname{~(suite)}
  \listpubname{Liste des Publications}}
\DeclareOption{francais}{%
  \ExecuteOptions{french}}
\DeclareOption{spanish}{%
  \continuedname{~(contin\'ua)}
  \listpubname{Lista de Publicaciones}}
\DeclareOption{portuges}{%
  \continuedname{~(continua\c c\~ao)}
  \listpubname{Publica\c c\~oes}}
\DeclareOption{portuguese}{%
  \ExecuteOptions{portuges}}
\DeclareOption{brazil}{%
  \ExecuteOptions{portuges}}
\DeclareOption{brazilian}{%
  \ExecuteOptions{portuges}}
\DeclareOption{italian}{%
  \continuedname{~(continua)}
  \listpubname{Pubblicazioni}}
\DeclareOption{german}{%
  \continuedname{~(fortgesetzt)}
  \listpubname{Verzeichnis der Ver\"offentlichungen}}
\DeclareOption{ngerman}{%
  \ExecuteOptions{german}}
\DeclareOption{dutch}{%
  \continuedname{~(vervolg)}
  \listpubname{Publicaties}}
\DeclareOption{danish}{%
  \continuedname{~(fortsat)}
  \listpubname{Udgivelser}}
\DeclareOption{swedish}{%
 \continuedname{~(forts.)}
 \listpubname{Publikationer}}

\DeclareOption{a4paper}{
  \setlength\paperheight{297mm}
  \setlength\paperwidth{210mm}}
\DeclareOption{a5paper}{
  \setlength\paperheight{210mm}
  \setlength\paperwidth{148mm}}
\DeclareOption{b5paper}{
  \setlength\paperheight{250mm}
  \setlength\paperwidth{176mm}}
\DeclareOption{letterpaper}{
  \setlength\paperheight{11in}
  \setlength\paperwidth{8.5in}}
\DeclareOption{legalpaper}{
  \setlength\paperheight{14in}
  \setlength\paperwidth{8.5in}}
\DeclareOption{executivepaper}{
  \setlength\paperheight{10.5in}
  \setlength\paperwidth{7.25in}}
\DeclareOption{landscape}{
  \setlength\@tempdima{\paperheight}
  \setlength\paperheight{\paperwidth}
  \setlength\paperwidth{\@tempdima}}

\DeclareOption{10pt}{\def\@ptsize{0}}
\DeclareOption{11pt}{\def\@ptsize{1}}
\DeclareOption{12pt}{\def\@ptsize{2}}

\DeclareOption{oneside}{\@twosidefalse\@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue}

\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{%
  \setlength\overfullrule{0pt}
  \setlongtables}

\ExecuteOptions{english,letterpaper,10pt,oneside,final}
\ProcessOptions

\input{size1\@ptsize.clo}
\setlength\parindent{0pt}
\setlength\parskip{0pt}
\setlength\tabcolsep{10pt}
\setlength\arrayrulewidth{.4\p@}
\raggedbottom
\onecolumn
\pagestyle{empty}
\pagenumbering{arabic}

\if@twoside
  \def\ps@headings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\@rubricmark##1{\markboth{\MakeUppercase{##1}}{}}%
    \def\@subrubricmark##1{\markright{##1}}%
  }
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\@rubricmark##1{\markright{\MakeUppercase{##1}}}%
  }
\fi
\def\ps@myheadings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{\thepage\hfil\slshape\leftmark}%
  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
  \let\@mkboth\@gobbletwo
  \let\@rubricmark\@gobble
  \let\@subrubricmark\@gobble
}

\endinput
%%
%% End of file `curve.cls'.
