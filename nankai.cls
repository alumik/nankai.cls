% (The MIT License)
%
% Copyright (c) 2021-2023 Yegor Bugayenko
% Copyright (c) 2021-2023 Zhenyu Zhong
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
\ProvidesClass{nankai}[2023/10/21 1.7.3 Template for Nankai Documents]

\LoadClass[12pt]{article}

\RequirePackage{pgfopts}
\pgfkeys{
    /nankai/.cd,
    breaks/.store in=\nankai@breaks,
    slides/.store in=\nankai@slides,
    nosecurity/.store in=\nankai@nosecurity,
    authordraft/.store in=\nankai@authordraft,
    nobrand/.store in=\nankai@nobrand,
    nodate/.store in=\nankai@nodate,
    nocover/.store in=\nankai@nocover,
    nopaging/.store in=\nankai@nopaging,
    landscape/.store in=\nankai@landscape,
    anonymous/.store in=\nankai@anonymous,
    cn/.store in=\nankai@cn,
}
\ProcessPgfPackageOptions{/nankai}

\makeatletter\ifdefined\nankai@breaks
    \let\nankai@oldsection\section
    \renewcommand\section{\clearpage\nankai@oldsection}
\fi\makeatother

\RequirePackage{geometry}
\makeatletter\ifdefined\nankai@landscape
    \geometry{paperwidth=16in, paperheight=9in, left=4in, right=2in, top=1.5in, bottom=1.5in}
\else
    \geometry{a4paper, left=1.5in, right=1in, top=1.2in, bottom=1.2in}
\fi\makeatother

\makeatletter\ifdefined\nankai@slides
    \usepackage[fontsize=24pt]{fontsize}
\fi\makeatother

\RequirePackage[T1]{fontenc}
\PassOptionsToPackage{tt=false,type1=true}{libertine}
\RequirePackage{libertine}
\RequirePackage[varqu]{zi4}
\RequirePackage[libertine]{newtxmath}
\RequirePackage[utf8]{inputenc}
\RequirePackage{multicol}
\RequirePackage{ragged2e}
\PassOptionsToPackage{mmddyyyy,iso}{datetime}
\RequirePackage{datetime}
\newtimeformat{daytime}{\twodigit{\THEHOUR}:\twodigit{\THEMINUTE}}
\PassOptionsToPackage{para}{footmisc}
\RequirePackage{footmisc}
\setlength{\footnotemargin}{2pt}
\setlength{\footnotesep}{2pt}
\PassOptionsToPackage{hidelinks}{hyperref}
\RequirePackage{hyperref}
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nosep}
\RequirePackage{lastpage}
\RequirePackage{setspace}
\setstretch{1.08}
\RequirePackage[maxnames=1,minnames=1,natbib=true,citestyle=numeric,bibstyle=numeric,url=false,isbn=false,isbn=false]{biblatex}
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
\RequirePackage{mdframed}
\mdfdefinestyle{NankaiNote}{
    topline=false,
    bottomline=false,
    rightline=false,
    backgroundcolor=NankaiPurple!20,
    linecolor=NankaiPurple,
    linewidth=3pt
}
\RequirePackage[absolute]{textpos}
\TPGrid{16}{16}
\RequirePackage{booktabs}
\PassOptionsToPackage{font={small,sf}}{caption}
\RequirePackage{caption}
\makeatletter\ifdefined\nankai@cn\RequirePackage{ctex}\else\RequirePackage[tt=false,type1=true]{libertine}\fi\makeatother%

\makeatletter\g@addto@macro\@floatboxreset\centering\makeatother

\makeatletter\newcommand\nankai@header[1]{{%
            \ifdefined\nankai@slides%
                \setstretch{0.8}%
                \fontsize{19pt}{24pt}\selectfont%
            \else%
                \setstretch{0.8}%
                \fontsize{11pt}{13pt}\selectfont%
            \fi%
            \sffamily\color{gray}#1\par%
        }}\makeatother%

\makeatletter\newcommand\nankai@bar{%
    \begin{textblock}{1}[0,0](0,0)%
        \tikz \node[fill=NankaiPurple,minimum width=\TPHorizModule,minimum height=16\TPVertModule] {};%
    \end{textblock}%
}\makeatother%

\makeatletter\newcommand\nankai@logo[1]{%
    \includegraphics[width=#1\linewidth]{nankai-logo}%
}%

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\makeatletter\fancyfoot[L]{
    \nankai@bar
    \ifdefined\nankai@authordraft%
        \begin{textblock}{14}[0.5,0.5](8,8)%
            \tikz \node[minimum width=14\TPHorizModule] {%
                \fontsize{64}{64}\selectfont\sffamily\scshape\color{gray!20}\rotatebox{30}{\ifdefined\nankai@cn 草~~稿\else It is a draft\fi}
            };%
        \end{textblock}%
    \else\fi%
}\makeatother
\makeatletter\fancyhead[L]{
    \ifnum\value{page}=1\else%
        \ifdefined\nankai@nobrand\else%
            \begin{textblock}{8}[0,0](1.2,0.2)%
                \nankai@logo{\ifdefined\nankai@slides 0.4\else 0.3\fi}%
            \end{textblock}%
        \fi%
    \fi%
}\makeatother
\makeatletter\fancyhead[R]{
    \begin{textblock}{8}[1,0](15.8,0.2)%
        \raggedleft\nankai@header{%
            \ifdefined\nankai@nosecurity\else%
                \thesecurity%
            \fi%
        }%
    \end{textblock}%
}\makeatother
\makeatletter\fancyfoot[R]{
    \begin{textblock}{8}[0,1](1.2,15.8)%
        \ifnum\value{page}=1\else%
        \nankai@header{\raggedright%
            \ifdefined\nankai@anonymous\else%
                \theauthor%
                \ifdefined\nankai@nosecurity\else%
                    \ifx\theid\empty\else, \theid\fi%
                \fi%
                \ifdefined\nankai@nobrand\else%
                    \newline
                \fi%
            \fi%
            \ifdefined\nankai@nobrand\else%
                \thecompany{}%
            \fi%
        }%
        \fi%
    \end{textblock}%
    \begin{textblock}{8}[1,1](15.8,15.8)%
        \raggedleft\nankai@header{%
            \ifnum\value{page}=1\else%
            \ifdefined\nankai@nopaging\else%
                \ifdefined\nankai@cn 第 \thepage{} 页, 共 \pageref*{LastPage} 页\else Page \#\thepage{} of \pageref*{LastPage}\fi%
                \ifdefined\nankai@nodate\else%
                    \\
                \fi%
            \fi%
            \fi%
            \ifdefined\nankai@nodate\else%
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
    {\bfseries{\Huge\raggedright\thetitle\par}}%
    \ifx\thesubtitle\empty\else%
        {\color{gray!50!black}\large\raggedright\thesubtitle\par}%
    \fi%
    \vspace{2em}%
    \ifdefined\nankai@nobrand\else%
        \ifdefined\nankai@anonymous\else%
            \ifx\thecompany\empty\else%
                \thecompany\par%
            \fi%
        \fi%
    \fi%
    \parbox{.6\textwidth}{\raggedright%
        \ifx\theauthor\empty\else%
            {\scshape\ifdefined\nankai@anonymous%
                    \ifdefined\nankai@cn 匿名作者\else Anonymous Author(s)\fi%
                \else%
                    \theauthor%
                \fi}%
        \fi%
        \ifdefined\nankai@anonymous\else%
            \ifx\theauthor\empty\else%
                \ifdefined\nankai@nobrand\else%
                    \ifx\theid\empty\else%
                        $\;$/ {\theid}%
                    \fi%
                \fi%
            \fi%
        \fi%
        \par%
    }%
    \vspace{2em}%
}\makeatother

\newcommand\PrintCrumb[2]{%
    \begin{minipage}{\columnwidth}%
        \raggedright\textsc{#1}:\\#2%
    \end{minipage}\vspace{1em}%
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
    \ifdefined\nankai@nobrand%
        the author
    \else%
        \thecompany{}
    \fi
    makes no representations and gives no warranties of whatever
    nature in respect of these documents, including but not limited to the
    accuracy or completeness of any information, facts and/or opinions contained therein.
    \ifdefined\nankai@nobrand%
        The author,
    \else%
        \thecompany{},
    \fi
    its subsidiaries, the directors, employees and agents
    cannot be held liable for the use of and reliance of the opinions, estimates, forecasts and
    findings in these documents.
    \par%
    \endgroup%
}\makeatother

\makeatletter\newcommand\PrintFirstPage[1]{%
    \ifdefined\nankai@landscape\else%
        \PackageError{nankai}{It's allowed to use PrintFirstPage only in landscape mode}{Read nankai.pdf for more information}
    \fi%
    \nankai@bar%
    \def\param{#1}%
    \ifx\param\empty\else%
        \includegraphics[height=2in]{#1}%
        \newline%
    \fi%
    \vspace*{0.5in}%
    \maketitle%
    \ifdefined\nankai@nocover\else%
        \begin{textblock}{14}[1,1](14,14)%
            \raggedleft\includegraphics[height=3.6in]{cover-picture.pdf}%
        \end{textblock}%
    \fi%
}\makeatother

\makeatletter\newcommand\PrintLastPage{
    \ifdefined\nankai@landscape\else
        \PackageError{nankai}{It's allowed to use PrintLastPage only in landscape mode}{Read nankai.pdf for more information}
    \fi%
    \newpage%
    \vspace*{1in}%
    \begin{center}%
        \begin{minipage}{0.6\columnwidth}\raggedright%
            \normalsize%
            \setlength{\parskip}{6pt}%
            {\Huge\color{red}\textbf{Thank you!}}%
            \par%
            \vspace{0.5in}%
            \par%
            \ifdefined\nankai@cn 允公允能，日新月异\fi

            Dedication to public interests, acquisition of all-roud capability,
            \newline%
            and aspiration for progress with each passing day.
            \par%
            \textbf{%
                Copyright \copyright{} \the\year{} \thecompany{}
                \newline
                All Rights Reserved.%
            }
            \par%
            The information in this document may contain predictive
            statements including, without limitation, statements regarding
            the future financial and operating results, future product
            portfolio, new technology, etc. There are a number of factors that
            could cause actual results and developments to differ materially
            from those expressed or implied in the predictive statements.
            Therefore, such information is provided for reference purpose
            only and constitutes neither an offer nor an acceptance.
            \ifdefined\nankai@nobrand%
                The author%
            \else%
                \thecompany{}%
            \fi%
            may change the information at any time without notice.
        \end{minipage}
    \end{center}%
}\makeatother

\makeatletter\newcommand\PrintBibliography{%
    \setlength\bibitemsep{3pt}%
    \AtNextBibliography{\small}%
    \ifdefined\huawei@breaks\newpage\fi%
    \begingroup%
    \raggedright%
    \setstretch{0.95}%
    \ifdefined\huawei@landscape%
        \begin{multicols}{3}\printbibliography\end{multicols}%
    \else%
        \ifdefined\huawei@breaks%
            \begin{multicols}{2}\printbibliography\end{multicols}%
        \else%
            \printbibliography%
        \fi%
    \fi%
}\makeatother

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
\makeatletter
\newcommand\theauthor{\ifdefined\nankai@cn 匿名作者\else Anonymous Author(s)\fi}
\makeatother
\newcommand*\thesecurity{Confidential}
\newcommand\security[1]{\renewcommand\thesecurity{#1}}
\newcommand*\theid{}
\newcommand\id[1]{\renewcommand\theid{#1}}

\newenvironment{note}{\begin{mdframed}[style=NankaiNote]}{\end{mdframed}}

\ifcsname nospell\endcsname\else\newcommand\nospell[1]{#1}\fi

\endinput
