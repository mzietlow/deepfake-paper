% LaTeX Dokumentenklasse fόr die LNI Reihe der GI
%
% (C) 2002 Robert Tolksdorf
% Im Fall von Fragen zu dieser Dokumentenklasse wenden Sie sich bitte
% an mail@robert-tolksdorf.de
%
%
\ProvidesClass{akdai}[2004/13/07 v0.41, by Robert Tolksdorf, Berlin customized FZ 2015/10/24; Hamburg customized MZ 2020/07/28]

\newif\iflnienglish\lnienglishfalse
\DeclareOption{english}{\lnienglishtrue}

\ProcessOptions

% 10 pt
\LoadClass[12pt,a4paper,fleqn]{article}
% Blocksatz durch LaTeX-Default
% Satzspiegel
\setlength{\textheight}{222mm}
\setlength{\textwidth}{160mm}
\oddsidemargin0pt
\topmargin0pt
% Hyphenation
% Durch normale LaTeX-Parameter verhindert (\doublehyphendemerits)

% Title: Kopie aus article.cls mit anderem \thispagestyle
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{empty}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\fontsize{17.28}{20}\fontseries{b}\selectfont \@title \par}%
    \vskip 1.5em%
    {\fontsize{12}{14}\selectfont
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1\baselineskip%
  \end{center}%
  \par
  }

% Abstract
\renewenvironment*{abstract}{%
 \renewcommand{\abstractname}{Abstract}
 \fontsize{9}{10}\selectfont
    \quotation\noindent{\bfseries \abstractname:}%
}{\endquotation}  

% άberschriften
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
  {2\baselineskip}{\baselineskip}{\fontsize{14}{17}\fontseries{b}\selectfont}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {2\baselineskip}{\baselineskip}{\fontsize{12}{14}\fontseries{b}\selectfont}}
% weitere nicht durch Formatvorlage geklδrt


% Bildunterschriften
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  {\fontsize{9}{10}\selectfont
   \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi}
  \vskip\belowcaptionskip}

% gleichungen mit richtiger einrόckung
% fleqn-Option oben
\setlength{\mathindent}{1.5cm}

% listings mit richtiger einrόckung
\RequirePackage{verbatim}
\def\verbatim@processline{\hskip4ex\the\verbatim@line\par}

% Fussnoten mit 5cm Linie und richtiger Grφίe
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width5cm
  \kern2.6\p@}
\renewcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}{\fontsize{10}{12}\selectfont#1}}

%
\RequirePackage{listings}
\lstloadlanguages{Java}
\lstset{language=Java,keywordstyle=\bfseries,basewidth=5.5pt,xleftmargin=1.5cm,
 literate={φ}{{\"o}}1
           {δ}{{\"a}}1
           {ό}{{\"u}}1
           {ά}{{\"U}}1
           {Δ}{{\"A}}1
           {Φ}{{\"O}}1
           {ί}{{\3}}1
}    
    
% Gemutmaίte Absatzeinzόge und Abstδnde
\parindent0pt
\parskip 1ex

% bibliography
\iflanguage{english}{\bibliographystyle{lni}}{\bibliographystyle{lnig}}
\renewenvironment{thebibliography}[1]
     {%\def\refname{Literaturverzeichnis}
      \section*{\refname}%
      \bgroup\fontsize{10}{12}\selectfont
      \list{\@biblabel{\@arabic\c@enumiv}}%
           { \settowidth\labelwidth{\hspace{2mm}\@biblabel{#1}}%
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist\egroup}

 % numbering of figures by section     
\@addtoreset{figure}{section}     
\@namedef{thefigure}{\arabic{section}.\arabic{figure}}

\RequirePackage{url}

   