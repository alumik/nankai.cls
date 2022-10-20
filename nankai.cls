% (The MIT License)
%
% Copyright (c) 2021-2022 Yegor Bugayenko
% Copyright (c) 2021-2022 Zhenyu Zhong
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the 'Software'), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nankai}[2022/10/18 1.5.2 Template for Nankai Documents]

\LoadClass[12pt]{article}

\makeatletter
\newif\ifnankai@dark
\DeclareOption{dark}{\nankai@darktrue}
\newif\ifnankai@slides
\DeclareOption{slides}{\nankai@slidestrue}
\newif\ifnankai@nosecurity
\DeclareOption{nosecurity}{\nankai@nosecuritytrue}
\newif\ifnankai@authordraft
\DeclareOption{authordraft}{\nankai@authordrafttrue}
\newif\ifnankai@nobrand
\DeclareOption{nobrand}{\nankai@nobrandtrue}
\newif\ifnankai@nodate
\DeclareOption{nodate}{\nankai@nodatetrue}
\newif\ifnankai@nocover
\DeclareOption{nocover}{\nankai@nocovertrue}
\newif\ifnankai@nopaging
\DeclareOption{nopaging}{\nankai@nopagingtrue}
\newif\ifnankai@landscape
\DeclareOption{landscape}{\nankai@landscapetrue}
\newif\ifnankai@anonymous
\DeclareOption{anonymous}{\nankai@anonymoustrue}
\newif\ifnankai@cn
\DeclareOption{cn}{\nankai@cntrue}
\ProcessOptions\relax
\makeatother

\RequirePackage{geometry}
\makeatletter\ifnankai@landscape
  \geometry{paperwidth=16in, paperheight=9in, left=4in, right=2in, top=1.5in, bottom=1.5in}
\else
  \geometry{a4paper, left=1.5in, right=1in, top=1.2in, bottom=1.2in}
\fi\makeatother

\makeatletter\ifnankai@slides
  \usepackage[fontsize=24pt]{fontsize}
\fi\makeatother

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{multicol}
\RequirePackage{ragged2e}
\RequirePackage[mmddyyyy,iso]{datetime}
  \newtimeformat{daytime}{\twodigit{\THEHOUR}:\twodigit{\THEMINUTE}}
\RequirePackage{paralist}
  \setdefaultenum{a)}{a)}{a)}{a)}
\RequirePackage[para]{footmisc}
  \setlength{\footnotemargin}{2pt}
  \setlength{\footnotesep}{2pt}
\RequirePackage{graphicx}
\RequirePackage[hidelinks]{hyperref} % to enable \pageref* command
\RequirePackage[shortlabels,inline]{enumitem}
  \setlist{nosep}
\RequirePackage{lastpage}
\RequirePackage{setspace}
  \setstretch{1.08}
\RequirePackage[maxnames=1,minnames=1,natbib=true,citestyle=numeric,bibstyle=numeric,doi=false,url=false,isbn=false,isbn=false]{biblatex}
\PassOptionsToPackage{table}{xcolor}
\RequirePackage{xcolor}
  \definecolor{red}{HTML}{CF0A2C}
  \definecolor{black}{HTML}{232527}
  \definecolor{gray}{HTML}{878C8F}
  \definecolor{yellow}{HTML}{F2DC5D}
  \definecolor{blue}{HTML}{2274A5}
  \definecolor{green}{HTML}{499167}
  \definecolor{orange}{HTML}{F06543}
  \definecolor{NankaiPurple}{RGB}{113,26,95}
\RequirePackage{tikz}
\RequirePackage[absolute]{textpos}
  \TPGrid{16}{16}
\makeatletter\ifnankai@cn\RequirePackage{ctex}\else\RequirePackage[tt=false,type1=true]{libertine}\fi\makeatother%

\makeatletter\newcommand\nankai@header[1]{{%
  \ifnankai@slides%
    \setstretch{0.8}%
    \fontsize{19pt}{24pt}\selectfont%
  \else%
    \setstretch{0.8}%
    \fontsize{11pt}{13pt}\selectfont%
  \fi%
  \sffamily\color{gray}#1\par%
}}\makeatother

\makeatletter\newcommand\nankai@bar{%
  \begin{textblock}{1}[0,0](0,0)%
    \tikz \node[fill=NankaiPurple,minimum width=\TPHorizModule,minimum height=16\TPVertModule] {};%
  \end{textblock}%
}\makeatother

\makeatletter\newcommand\nankai@logo{
  \includegraphics[width=.3\linewidth]{nankai-logo}
}

\RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhf{}
  \makeatletter\fancyfoot[L]{
    \nankai@bar
    \ifnankai@authordraft%
      \begin{textblock}{14}[0.5,0.5](8,8)%
        \tikz \node[minimum width=14\TPHorizModule] {%
          \fontsize{64}{64}\selectfont\sffamily\scshape\color{gray!20}\rotatebox{30}{\ifnankai@cn 草~~稿\else it is a draft\fi}
        };%
      \end{textblock}%
    \else\fi%
  }\makeatother
  \makeatletter\fancyhead[L]{
    \ifnum\value{page}=1\else%
      \ifnankai@nobrand\else%
        \begin{textblock}{8}[0,0](1.2,0.2)%
          \nankai@logo%
        \end{textblock}%
      \fi%
    \fi%
  }\makeatother
  \makeatletter\fancyhead[R]{
    \begin{textblock}{8}[1,0](15.8,0.2)%
      \raggedleft\nankai@header{%
        \ifnankai@nosecurity\else%
          \thesecurity
        \fi%
      }%
    \end{textblock}%
  }\makeatother
  \makeatletter\fancyfoot[R]{
    \begin{textblock}{8}[0,1](1.2,15.8)%
      \ifnum\value{page}=1\else%
        \nankai@header{\raggedright%
          \ifnankai@anonymous\else%
            \theauthor%
            \ifnankai@nosecurity\else%
              \ifx\theid\empty\else, \theid\fi
            \fi%
            \ifnankai@nobrand\else%
              \newline
            \fi%
          \fi%
          \ifnankai@nobrand\else%
            \thecompany{}
          \fi%
        }%
      \fi%
    \end{textblock}%
    \begin{textblock}{8}[1,1](15.8,15.8)%
      \raggedleft\nankai@header{%
        \ifnum\value{page}=1\else%
          \ifnankai@nopaging\else%
            \ifnankai@cn 第 \thepage{} 页, 共 \pageref*{LastPage} 页\else Page \#\thepage{} of \pageref*{LastPage}\fi%
            \ifnankai@nodate\else%
              \\
            \fi%
          \fi%
        \fi%
        \ifnankai@nodate\else%
          \today{} \settimeformat{daytime}\currenttime{}%
        \fi%
      }%
    \end{textblock}%
  }\makeatother

\RequirePackage{changepage}
\renewenvironment{abstract}
  {\begin{adjustwidth}{0pt}{1in}{\scshape Abstract:}\newline\small}
  {\end{adjustwidth}}

\makeatletter\renewcommand\maketitle{%
  \vspace*{18pt}%
  {\bfseries{\Huge\thetitle}}
  \ifx\thesubtitle\empty\else%
    \\[6pt]
    {\color{gray!50!black}\large\thesubtitle}
  \fi
  \\[18pt]
  \ifnankai@nobrand\else%
    \ifnankai@anonymous\else%
      \ifx\thecompany\empty\else%
        \thecompany\newline
      \fi
    \fi
  \fi
  \ifx\theauthor\empty\else%
    {\scshape\ifnankai@anonymous
      \ifnankai@cn 匿名\else Anonymous Authors\fi%
    \else%
      \theauthor
    \fi}%
  \fi%
  \ifnankai@anonymous\else%
    \ifx\theauthor\empty\else
      \ifnankai@nobrand\else%
        \ifx\theid\empty\else
          $\;$/ {\theid}
        \fi
      \fi
    \fi
  \fi
  \vspace{2em}
}\makeatother

\newcommand\PrintCrumb[2]{%
  \begin{minipage}{\columnwidth}%
    \raggedright\textsc{#1}:\\#2%
  \end{minipage}\vspace{4pt}%
}

\newcommand\PrintThankYouPage{
  \newpage
  \vspace*{\fill}
  \begin{center}
    \normalsize
    {\Huge\color{NankaiPurple}\textbf{Thank you!}}
  \end{center}
  \vspace*{\fill}
}

\makeatletter\newcommand\PrintDisclaimer{%
  \justify\vspace*{\fill}%
  \begingroup%
  \setstretch{0.55}%
  \sffamily\scriptsize\color{gray!50!black}%
  \textbf{Disclaimer}: The opinions expressed in this document are in good faith and
  while every care has been taken in preparing it,
  \ifnankai@nobrand%
    the author%
  \else%
    \thecompany{}%
  \fi
  makes no representations and gives no warranties of whatever
  nature in respect of these documents, including but not limited to the
  accuracy or completeness of any information, facts and/or opinions contained therein.
  \ifnankai@nobrand%
    The author%
  \else%
    \thecompany{}%
  \fi,
  its subsidiaries, the directors, employees and agents
  cannot be held liable for the use of and reliance of the opinions, estimates, forecasts and
  findings in these documents.
  \par
  \endgroup%
}\makeatother

\makeatletter\newcommand\PrintFirstPage[1]{
  \ifnankai@landscape\else
    \PackageError{nankai}{It's allowed to use PrintFirstPage only in landscape mode}{Read nankai.pdf for more information}
  \fi
  \nankai@bar
  \def\param{#1}%
  \ifx\param\empty\else
    \includegraphics[height=2in]{#1}
    \newline
  \fi
  \vspace*{0.5in}
  \maketitle
  \ifnankai@nocover\else
    \begin{textblock}{14}[1,1](14,14)
      \raggedleft\includegraphics[height=3.6in]{cover-picture.pdf}
    \end{textblock}
  \fi
}\makeatother

\makeatletter\newcommand\PrintLastPage{
  \ifnankai@landscape\else
    \PackageError{nankai}{It's allowed to use PrintLastPage only in landscape mode}{Read nankai.pdf for more information}
  \fi
  \newpage
  \vspace*{1in}
  \begin{center}
    \begin{minipage}{0.6\columnwidth}\raggedright
      \normalsize
      \setlength{\parskip}{6pt}
      {\Huge\color{red}\textbf{Thank you!}}

      \vspace{0.5in}

      \ifnankai@cn 允公允能，日新月异\fi

      Dedication to public interests, acquisition of all-roud capability,
      \newline
      and aspiration for progress with each passing day.

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
      \ifnankai@nobrand%
        The author%
      \else%
        \thecompany{}%
      \fi
      may change the information at any time without notice.
    \end{minipage}
  \end{center}%
}\makeatother

\makeatletter\newcommand\PrintBibliography{
  \setlength\bibitemsep{3pt}
  \AtNextBibliography{\small}
  \newpage
  \raggedright
  \ifnankai@landscape
    \begin{multicols}{3}\setstretch{0.95}\printbibliography\end{multicols}
  \else
    \begin{multicols}{2}\setstretch{0.95}\printbibliography\end{multicols}
  \fi
}\makeatother

\makeatletter\ifnankai@dark
  \RequirePackage{pagecolor}
  \pagecolor{black}
  \color{white}
\fi

\AtBeginDocument{%
\raggedbottom%
\raggedcolumns%
\setlength\headheight{32pt}%
\setlength\footskip{32pt}%
\setlength\topskip{0mm}%
\setlength\parindent{0pt}%
\setlength\parskip{6pt}%
\setlength\columnsep{32pt}%
\def\arraystretch{1.5}%
}

\renewcommand\title[1]{\renewcommand\thetitle{#1}}
\newcommand\thetitle{Untitled}
\newcommand*\thecompany{College of Software, Nankai University}
\newcommand\company[1]{\renewcommand\thecompany{#1}}
\newcommand\thesubtitle{}
\newcommand\subtitle[1]{\renewcommand\thesubtitle{#1}}
\renewcommand\author[1]{\renewcommand\theauthor{#1}}
\newcommand\theauthor{Anonymous Author(s)}
\newcommand*\thesecurity{Confidential}
\newcommand\security[1]{\renewcommand\thesecurity{#1}}
\newcommand*\theid{}
\newcommand\id[1]{\renewcommand\theid{#1}}

\ifcsname nospell\endcsname\else\newcommand\nospell[1]{#1}\fi

\endinput
