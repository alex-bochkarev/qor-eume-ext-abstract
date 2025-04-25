% qor-eume-ext-abstract.cls
%
% A LaTeX2e document class for the extended abstracts
% to be submitted for the EU/ME + Quantum OR working groups
% meetings. Developed for the second edition of the event
% in Kaiserslautern, 2025.

% The user's guide for this class is in the example.tex.

\def\fileversion{0.9}
\def\filedate{2025/04/25}
\def\meeting{EU/ME+QOR 2025 -- Kaiserslautern, Germany, September 10--12, 2025}
\def\pagelimit{4}

% ====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qor-eume-ext-abstract}[\filedate\space Version \fileversion\space by
  Alexey Bochkarev and Co. for \meeting]

\LoadClass{scrartcl}

% Set margins
\KOMAoptions{
  paper=a4,
  twoside=true,
  fontsize=11pt,
  DIV=default     % Disable KOMA's layout system to avoid conflict
}

% Set exact margins with geometry (yes, it's okay here)
\RequirePackage[
  left=1.18in,
  right=1.18in,
  top=0.59in,
  bottom=1.50in
]{geometry}

% Language: English
\RequirePackage[english]{babel}

% Setting fonts

%%% Set font = Times New Roman
%%%   The mechanism depends on the engine
%%%   chosen by the user.
\RequirePackage{iftex}
\ifLuaTeX
  \RequirePackage{fontspec}
  \RequirePackage{unicode-math}
  \setmainfont{Times New Roman}
  \setmonofont{Courier New}
  \setmathfont{TeX Gyre Termes Math} % Times-compatible math font

\else\ifXeTeX
  \RequirePackage{fontspec}
  \RequirePackage{unicode-math}
  \setmainfont{Times New Roman}
  \setmonofont{Courier New}
  \setmathfont{TeX Gyre Termes Math}

\else
  % pdfLaTeX fallback (no real Times New Roman, but good substitutes)
  \RequirePackage{newtxtext,newtxmath} % Times-like text + math fonts
  \renewcommand{\ttdefault}{pcr}       % Use Courier for monospaced
\fi\fi

%%% Font sizes / elements styling
%%%% Title: 16pt, boldface, centered
\setkomafont{title}{\fontsize{16pt}{20pt}\selectfont\bfseries}

%%%% Authors and affiliations: centered
\setkomafont{author}{\normalsize}

%%%% Section titles: 14pt, boldface
\setkomafont{section}{\fontsize{14pt}{16pt}\selectfont\bfseries}
\setkomafont{subsection}{\fontsize{12pt}{14pt}\selectfont\bfseries}

\RequirePackage{authblk}  % for affiliations
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\hypersetup{
  colorlinks,
  linkcolor={black},
  citecolor={black},
  urlcolor={black},
}
\RequirePackage[capitalize,noabbrev]{cleveref}

\let\oldhref\href
\renewcommand{\href}[2]{\oldhref{#1}{\small\texttt{#2}}}

\setlength{\affilsep}{\baselineskip}

\AtBeginDocument{%
  \renewcommand{\maketitle}{%
  \begin{center}
    {\usekomafont{title}\@title} \\[1.25\baselineskip]
    {\usekomafont{author}\@author}
  \end{center}
}
}

\newcommand{\affilblock}[2][*]{\setlength{\parskip}{0pt}\affil[#1]{#2\vspace{0.5\baselineskip}}}

% Footers, headers, and page numbers
\RequirePackage{fancyhdr}
\newcommand{\shorttitle}[1]{\newcommand{\theshorttitle}{#1}}
\newcommand{\shortauthors}[1]{\newcommand{\theshortauthors}{#1}}
\AtBeginDocument{%
  \pagestyle{fancy}
  \fancyhead[LO,RE]{\selectfont\bfseries\theshorttitle}
  \fancyhead[LE,RO]{\selectfont\bfseries\theshortauthors}
  \fancyfoot[LO,RE]{\selectfont\bfseries\meeting}
  \fancyfoot[LE,RO]{\selectfont\bfseries\thepage}
  \fancyfoot[C]{}
}

% Page limit warning
\newcount\savedpages  % storing the current page count

\AtEndDocument{
  \savedpages=\value{page} % Store the final page count
  \ifnum\savedpages>\pagelimit
    \typeout{\par===============================================================================}
    \typeout{WARNING: The document contains \the\savedpages pages: it is above the page limit of \pagelimit!}
    \typeout{===============================================================================\par}
  \else
    \typeout{\par===============================================================================}
    \typeout{INFO: The document is within the page limit (\pagelimit; you have \the\savedpages).}
    \typeout{===============================================================================\par}
  \fi
}

% Items
\RequirePackage{enumitem}
\setlist[itemize]{itemsep=0pt, topsep=0pt}
\setlist[enumerate]{itemsep=0pt, topsep=0pt}

% Figures and Tables
\RequirePackage{graphicx}
\RequirePackage{booktabs,float}

% References
\RequirePackage[style=numeric, sorting=nyt, maxbibnames=10]{biblatex}
