%% LaTeX2e class for student theses
%% calgo-lab-thesis.cls
%%
%% Berlin University of Applied Sciences and Technology
%% Fachbereich 6: Informatik und Medien
%% Cognitive Algorithms Lab (Calgo Lab)
%%
%% Prof. Dr. Felix Bießmann
%% felix.biessmann@bht-berlin.de
%%
%% Version 0.1, 2023-03-26
%%
%% -----------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{calgo-lab-thesis}[2023/03/26 v0.1 Student thesis class]
\DeclareOption{german}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{english}{\PassOptionsToPackage{\CurrentOption}{babel}}
\ProcessOptions\relax

%% ---------------------------------------------------------------
%% | Based on KOMAscript by Markus Kohm http://www.komascript.de |
%% ---------------------------------------------------------------
\LoadClass[12pt,twoside,headsepline,a4paper,titlepage=true,DIV=15,BCOR=20mm]{scrbook}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors from https://www.bht-berlin.de/fileadmin/oe/pressestelle/dokumente/BHT-Styleguide.pdf
\RequirePackage{xcolor}
\xdefinecolor{bhtgray}{RGB}{85, 85, 85}
\xdefinecolor{bhtyellow}{RGB}{255, 201, 0}
\xdefinecolor{bhtred}{RGB}{234, 59, 7}
\xdefinecolor{bhtpetrol}{RGB}{0, 160, 170}
\xdefinecolor{bhtblue}{RGB}{0, 66, 130}

\newcommand{\headcolor}{bhtpetrol}
\newcommand{\alertcolor}{bhtred}

%% -----------------------
%% | Headers and footers |
%% -----------------------
\RequirePackage[automark]{scrlayer}

\clubpenalty=10000 %prevent orphans
\widowpenalty=10000 %prvent widows

%% --------------
%% | Typography |
%% --------------

% T1 font encoding
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

% serif type: Linux Libertine
\RequirePackage{libertine}
% Linux Libertine in math mode
\RequirePackage[libertine]{newtxmath}

% grotesque type: Adobe Source Sans Pro
\RequirePackage[scaled=.92]{sourcesanspro}

% monospace type: Bera Mono
\RequirePackage[scaled=.78]{beramono}

% semi-bold type (for subsections and paragraphs)
\newcommand*{\sbdefault}{sb}
\DeclareRobustCommand{\sbseries}{%
  \not@math@alphabet\sbseries\relax
  \fontseries\sbdefault\selectfont}

\DeclareTextFontCommand{\textsb}{\sbseries}

\addtokomafont{subsection}{\sbseries}
\addtokomafont{subsubsection}{\sbseries}
\addtokomafont{paragraph}{\sbseries}

% microtype for nicer typography
\RequirePackage[protrusion=true,expansion=true]{microtype}

% commands for code and model keywords in text
\newcommand{\code}[1]{\texttt{\hyphenchar\font45\relax #1}}
\newcommand{\model}[1]{\textsf{#1}}

% nicer spacing for enumerations
\RequirePackage{enumitem}

%% --------------
%% | Title page |
%% --------------

% Logos
\newcommand{\bhtlogo}{logos/BHT\_Logo\_horizontal\_Anthrazit\_transparent.pdf}
\newcommand{\bhtlogoscaled}[1]{{\mbox{\includegraphics[width=#1]\bhtlogo}}}

\titlehead{%
	\hfill\bhtlogoscaled{0.45\textwidth}
	\textcolor{bhtpetrol}{\rule{\linewidth}{1mm}}
}

\setkomafont{title}{\huge\sffamily\bfseries\color{\headcolor}}
\setkomafont{subtitle}{\normalfont\large}

\uppertitleback{
	\iflanguage{english}
		{Berlin University of Applied Sciences and Technology (BHT)}
		{Berliner Hochschule für Technik (BHT)}\\
	Fachbereich VI - Informatik und Medien\\
	Luxemburger Straße 10\\
	13353 Berlin
}

%% variables for title page
\newcommand{\theuniversity}{
	\iflanguage{english}
		{Berlin University of Applied Sciences and Technology (BHT)}
		{Berliner Hochschule für Technik (BHT)}
}
\newcommand{\theinstitute}{Cognitive Algorithms Lab (Calgo Lab)}
\newcommand{\thethesistype}{}
\newcommand{\thereviewerone}{Prof. Dr. Felix Bießmann}
\newcommand{\thereviewertwo}{}
\newcommand{\theadvisorone}{}
\newcommand{\theadvisortwo}{}
\newcommand{\theeditstart}{}
\newcommand{\theeditend}{}

%% formatting commands for titlepage
\newcommand{\thesistype}[1]{\subtitle{\vskip2em #1 \iflanguage{english}{of}{von}}%
\renewcommand{\thethesistype}{#1}}
\newcommand{\myinstitute}[1]{\renewcommand{\theinstitute}{#1}}
\newcommand{\reviewerone}[1]{\renewcommand{\thereviewerone}{#1}}
\newcommand{\reviewertwo}[1]{\renewcommand{\thereviewertwo}{#1}}
\newcommand{\advisorone}[1]{\renewcommand{\theadvisorone}{#1}}
\newcommand{\advisortwo}[1]{\renewcommand{\theadvisortwo}{#1}}

\newcommand{\editingtime}[2]{%
\renewcommand{\theeditstart}{#1}%
\renewcommand{\theeditend}{#2}%
%% do not show the date
\date{}
}


\newcommand{\settitle}{%
	\publishers{%
		\large
		\theuniversity\\
		Fachbereich VI - Informatik und Medien\\
		\theinstitute\\[2em]
		\begin{tabular}{l l}
			  \iflanguage{english}{Reviewer}{Erstgutachter}: & \thereviewerone\\
			  %skip w/o second reviewer
			  \ifthenelse{\equal{\thereviewertwo}{}}{}{%
			  \iflanguage{english}{Second reviewer}{Zweitgutachter}: & \thereviewertwo\\
			  }%
			  %skip w/o external advisor
			  \ifthenelse{\equal{\theadvisorone}{}}{}{%
			  \iflanguage{english}{Advisor}{Betreuer}: & \theadvisorone\\
			  }%
			  %skip w/o second external advisor
			  \ifthenelse{\equal{\theadvisortwo}{}}{}{%
			  \iflanguage{english}{Second advisor}{Zweiter Betreuer}: & \theadvisortwo\\
			  }%
		\end{tabular}
		\vskip2em
		\theeditstart{} -- \theeditend
		\vspace*{\stretch{4}}

		\textcolor{bhtpetrol}{\rule{\linewidth}{1mm}}
	}
}

%% -----------------------------
%% | Abstract/Acknowledgements |
%% -----------------------------

\newcommand{\abstract}[1][\abstractname]{\chapter*{#1}}
\newcommand{\Abstract}[1][\abstractname]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}

\def\ackname{Acknowledgments}
\def\abstractname{Abstract}
\def\switcht@deutsch{\svlanginfo
	\def\ackname{Danksagung}
	\def\abstractname{Kurzfassung}
}
\def\switcht@english{\svlanginfo
	\def\ackname{Acknowledgements}
	\def\abstractname{Abstract}
}

%% In English theses, an additional German Abstract is needed.
\newcommand{\includeabstract}{
	\include{sections/abstract}
}

%% ------------
%% | Packages |
%% ------------

% draft mode
\RequirePackage{ifdraft}
\RequirePackage{ifthen}

% enumerate subsubsections
\setcounter{secnumdepth}{3}

% wallpaper for title page (HSKA-Frame)
\RequirePackage{wallpaper}

% subimport of files
\RequirePackage{import}

% languages
\RequirePackage{babel}

% hyphenation for compound words
\RequirePackage[shortcuts]{extdash}

% nice tables
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}

% show graphics in draft mode
\RequirePackage{graphicx}
\setkeys{Gin}{draft=false}

% appendix
\RequirePackage[toc,title,header]{appendix}
\noappendicestocpagenum

% todo-notes
\RequirePackage[obeyDraft]{todonotes}
\presetkeys{todonotes}{inline}{}

% PDF specific packages
\RequirePackage[hyphens]{url}
\RequirePackage[breaklinks,colorlinks=false,hidelinks]{hyperref}
\newcommand\setpdf{\hypersetup{%
    pdftitle={\thethesistype},%
    pdfsubject={\@title},%
    pdfauthor={\@author},%
    linkcolor=kit-blue100,%
    citecolor=kit-green100,%
    urlcolor=kit-red100
    }%
    \let\theauthor\@author
}

%% automatic naming of sections with autoref
\def\sectionautorefname{Section}
\def\subsectionautorefname{Subsection}
\def\subsubsectionautorefname{Subsection}
\def\paragraphautorefname{Paragraph}

%% Glossary 
\RequirePackage[%
    nonumberlist,
    nogroupskip,
    acronym,
    ]{glossaries} 
\renewcommand*{\glspostdescription}{}