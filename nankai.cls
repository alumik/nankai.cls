\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nankai}[2021/06/24 1.01 Template for Nankai Documents]

\newif\ifnosecurity
\DeclareOption{nosecurity}{\nosecuritytrue}
\newif\ifauthordraft
\DeclareOption{authordraft}{\authordrafttrue}
\newif\ifnobrand
\DeclareOption{nobrand}{\nobrandtrue}
\newif\ifnodate
\DeclareOption{nodate}{\nodatetrue}
\newif\ifnocover
\DeclareOption{nocover}{\nocovertrue}
\newif\ifnopaging
\DeclareOption{nopaging}{\nopagingtrue}
\newif\ifcn
\DeclareOption{cn}{\cntrue}
\newif\iflandscape
\DeclareOption{landscape}{\landscapetrue}
\newif\ifanonymous
\DeclareOption{anonymous}{\anonymoustrue}
\ProcessOptions\relax

\LoadClass[12pt]{article}

\RequirePackage{geometry}
\iflandscape
  \geometry{paperwidth=16in, paperheight=9in, left=4in, right=2in, top=1.5in, bottom=1.5in}
\else
  \geometry{a4paper, left=1.5in, right=1in, top=1.2in, bottom=1.2in}
\fi
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{CJKutf8}
\RequirePackage{tabularx}
\RequirePackage{multicol}
\RequirePackage{ragged2e}
\RequirePackage{multicol}
\RequirePackage[mmddyyyy,iso]{datetime}
  \newtimeformat{daytime}{\twodigit{\THEHOUR}:\twodigit{\THEMINUTE}}
\RequirePackage[tt=false,type1=true]{libertine}
\RequirePackage{paralist}
\RequirePackage{makecell}
\RequirePackage[para]{footmisc}
  \setlength{\footnotemargin}{2pt}
  \setlength{\footnotesep}{2pt}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage[abspath]{currfile}
\RequirePackage{enumitem}
  \setlist{nosep}
\RequirePackage{microtype}
\RequirePackage{wrapfig}
\RequirePackage{lastpage}
\RequirePackage{xfp} % for \setrelativestretch
\RequirePackage{setspace}
  \setstretch{1.08}
  \newcommand{\setrelativestretch}[1]{%
    \begingroup\edef\x{\endgroup%
      \noexpand\setstretch{\fpeval{(#1)*(\baselinestretch)}}%
    }\x%
  }
\RequirePackage[maxnames=1,minnames=1,natbib=true,style=ieee,doi=false,url=false,isbn=false,isbn=false]{biblatex}
\RequirePackage[table]{xcolor}
  \definecolor{nankai-purple}{RGB}{113,26,95}
  \definecolor{nankai-black}{HTML}{232527}
\RequirePackage{tikz}
\RequirePackage{tabularx}
\RequirePackage{titling}
\RequirePackage{svg}
\RequirePackage[absolute]{textpos}
  \TPGrid{16}{16}
\ifcn\RequirePackage{ctex}\fi%

% Our custom commands to redefine:
\renewcommand\title[1]{\renewcommand\thetitle{#1}}
\newcommand\thetitle{Untitled}
\newcommand*\thecompany{College of Software, Nankai University}
\newcommand\thesubtitle{}
\renewcommand\author[1]{\renewcommand\theauthor{#1}}
\newcommand\theauthor{Anonymous}
\newcommand*\thesecurity{Confidential}
\newcommand*\theid{}

% Custom commands
\newcommand\nospell[1]{#1}
\newcommand\headers[1]{\setrelativestretch{0.8}{\small\sffamily\color{gray}#1}}
\newcommand\tbd[1]{{\color{red}#1}}
\newcommand\crumb[2]{\begin{minipage}{\columnwidth}\raggedright\textsc{#1}:\\#2\end{minipage}\vspace{4pt}}

\AtBeginDocument{%
  \raggedbottom%
  \setlength\topskip{0mm}%
  \setlength\parindent{0pt}%
  \setlength\parskip{6pt}%
  \setlength\columnsep{32pt}%
  \def\arraystretch{1.5}%
}

\newcommand\LeftNankaiBar{%
  \begin{textblock}{1}[0,0](0,0)%
    \tikz \node[fill=nankai-purple,minimum width=\TPHorizModule,minimum height=16\TPVertModule] {};%
  \end{textblock}%
}

\newcommand\PrintNankaiLogo{
  \includegraphics[width=.3\linewidth]{nankai-logo}
}

\RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhf{}
  \fancyfoot[L]{
    \LeftNankaiBar{}
    \ifauthordraft%
      \begin{textblock}{14}[0.5,0.5](8,8)%
        \tikz \node[minimum width=14\TPHorizModule] {%
          \fontsize{64}{64}\selectfont\sffamily\scshape\color{gray!20}\rotatebox{30}{\ifcn草~~稿\else it is a draft\fi}
        };%
      \end{textblock}%
    \else\fi%
    \ifnum\value{page}=1\else%
      \ifnobrand\else%
        \begin{textblock}{8}[0,0](1.2,0.2)%
          \PrintNankaiLogo{}%
        \end{textblock}%
      \fi%
    \fi%
    \begin{textblock}{8}[1,0](15.8,0.2)%
      \raggedleft\headers{%
        \ifnosecurity\else%
          \thesecurity
        \fi%
      }%
    \end{textblock}%
    \begin{textblock}{8}[0,1](1.2,15.8)%
      \ifnum\value{page}=1\else%
        \headers{%
          \ifanonymous\else%
            \theauthor%
            \ifnosecurity\else~%
              \theid
            \fi%
            \ifnobrand\else%
              \newline
            \fi%
          \fi%
          \ifnobrand\else%
            \thecompany{}
          \fi%
        }%
      \fi%
    \end{textblock}%
    \begin{textblock}{8}[1,1](15.8,15.8)%
      \raggedleft\headers{%
        \ifnum\value{page}=1\else%
          \ifnopaging\else%
            \ifcn第 \thepage{} 页\else%
              Page \thepage{}%
            \fi
            \ifnodate\else%
              \\
            \fi%
          \fi%
        \fi%
        \ifnodate\else%
          \today{} \settimeformat{daytime}\currenttime{}%
        \fi%
      }%
    \end{textblock}%
  }

  \renewcommand\maketitle{%
  \vspace*{18pt}
  {\bfseries{\Huge\thetitle}}
  \\[6pt]
  \ifx\thesubtitle\empty\else%
    {\color{gray!50!black}\large\thesubtitle}
  \fi
  \\[18pt]
  \ifnobrand\else%
    \ifanonymous\else%
      \ifx\thecompany\empty\else%
        \thecompany\newline
      \fi
    \fi
  \fi
  \ifx\theauthor\empty\else%
    {\scshape\ifanonymous
      \ifcn匿名\else Anonymous Authors\fi
    \else%
      \theauthor
    \fi}%
  \fi%
  \ifanonymous\else%
    \ifx\theauthor\empty\else
      \ifnobrand\else%
        \ifx\theid\empty\else
          \;/ {\theid}
        \fi
      \fi
    \fi
  \fi\newline
  \vspace{2em}
}

\newcommand\PrintThankYouPage{
  \newpage
  \vspace*{\fill}
  \begin{center}
  {\Huge\color{nankai-purple}\textbf{Thank you!}}
  \end{center}
  \vspace*{\fill}
}

\newcommand\PrintDisclaimer{%
  \justify\vspace*{\fill}\setrelativestretch{0.55}{{\sffamily\scriptsize\color{gray!50!black}%
  \textbf{Disclaimer}: The opinions expressed in this document are in good faith and
  while every care has been taken in preparing it,
  \ifnobrand%
    the author%
  \else%
    \thecompany{}%
  \fi
  makes no representations and gives no warranties of whatever
  nature in respect of these documents, including but not limited to the
  accuracy or completeness of any information, facts and/or opinions contained therein.
  \ifnobrand%
    The author%
  \else%
    \thecompany{}%
  \fi,
  its subsidiaries, the directors, employees and agents
  cannot be held liable for the use of and reliance of the opinions, estimates, forecasts and
  findings in these documents.}}}

\newcommand\PrintFirstPage[1]{
  \LeftNankaiBar{}
  \def\param{#1}%
  \ifx\param\empty\else
    \includegraphics[height=2in]{#1}
    \newline
  \fi
  \vspace*{0.5in}
  \maketitle
  \iflandscape\ifnocover\else
    \begin{textblock}{14}[1,1](14,14)
      \raggedleft\includegraphics[height=3.6in]{cover-picture.pdf}
    \end{textblock}
  \fi\fi
}

\newcommand\PrintLastPage{
  \newpage
  \vspace*{1in}
  \begin{center}
  \begin{minipage}{0.6\columnwidth}\raggedright
  \setlength{\parskip}{6pt}
  {\Huge\color{nankai-purple}\textbf{Thank you!}}

  \vspace{0.5in}

  Bring digital to every person, home and organization
  \newline
  for a fully connected, intelligent world.

  \textbf{%
    Copyright \copyright{} \the\year{} \thecompany{}
    \newline
    All Rights Reserved.%
  }

  The information in this document may contain predictive
  statements including, without limitation, statements regarding
  the future financial and operating results, future product
  portfolio, new technology, etc. There are a number of factors that
  could cause actual results and developments to differ materially
  from those expressed or implied in the predictive statements.
  Therefore, such information is provided for reference purpose
  only and constitutes neither an offer nor an acceptance.
  \ifnobrand%
    The author%
  \else%
    \thecompany{}%
  \fi
  may change the information at any time without notice.
  \end{minipage}
  \end{center}%
}

\newcommand\PrintBibliography{
  \setlength\bibitemsep{0pt}
  \AtNextBibliography{\small}
  \newpage
  \raggedright
  \iflandscape
    \begin{multicols}{3}\setrelativestretch{1.0}{\printbibliography}\end{multicols}
  \else
    \begin{multicols}{2}\setrelativestretch{1.0}{\printbibliography}\end{multicols}
  \fi
}

\endinput