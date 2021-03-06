\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{XDUthesis}[2015/01/01 XDU, Thesis document class, version 0.1.0]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   class and packages

%%%%%%%%%%%%%%%%%%%%
%% Options
%%%%%%%%%%%%%%%%%%%%

%% disable oneside option
\DeclareOption{oneside}{\OptionNotUsed}


%% print version or electronic version
\newif\ifXDU@Option@PrintVersion \XDU@Option@PrintVersiontrue
\DeclareOption{pversion}{\XDU@Option@PrintVersiontrue}
\DeclareOption{eversion}{\XDU@Option@PrintVersionfalse}

%% info
\newif\ifXDU@Option@info \XDU@Option@infotrue
\DeclareOption{noinfo}{\XDU@Option@infofalse}

%% ref
\newif\ifXDU@Option@ref@sort \XDU@Option@ref@sortfalse
\newif\ifXDU@Option@ref@compress \XDU@Option@ref@compressfalse
\DeclareOption{refsort}{\XDU@Option@ref@sorttrue}
\DeclareOption{refcompress}
  {\XDU@Option@ref@sorttrue\XDU@Option@ref@compresstrue}

%% others
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%
%% load class and packages
%%%%%%%%%%%%%%%%%%%%

%% book
%%
%\LoadClass[zihao=-4,UTF8,twoside,fontset=windows]{ctexbook}
\LoadClass[fancyhdr,zihao=-4,UTF8,twoside,fontset=none]{ctexbook}
\RequirePackage[a4paper]{geometry}

%% calc
\RequirePackage{calc}

%% ifthen
\RequirePackage{ifthen}

\RequirePackage[titles]{tocloft}

\RequirePackage{caption}

\RequirePackage{diagbox}

%% natbib
\ifXDU@Option@ref@sort
  \ifXDU@Option@ref@compress
    \RequirePackage[numbers,sort&compress,super,square]{natbib}
  \else
    \RequirePackage[numbers,sort,super,square]{natbib}
  \fi
\fi
\newcommand*{\citens}[2][]{%
  \begingroup
  \let\NAT@mbox=\mbox
  \let\@cite\NAT@citenum
  \let\NAT@space\NAT@spacechar
  \let\NAT@super@kern\relax
  \renewcommand\NAT@open{[}%
  \renewcommand\NAT@close{]}%
  \cite[#1]{#2}%
  \endgroup
}


%% hyperref
\RequirePackage[pdfencoding=auto]{hyperref}

%% color
\ifXDU@Option@PrintVersion\relax\else
  \RequirePackage{color}
\fi

%% config file
\AtEndOfPackage{\makeatletter\input{XDUthesis.def}\makeatother}
\AtEndOfPackage{\makeatletter\input{XDUthesis.cfg}\makeatother}
\AtEndOfPackage{\makeatletter\renewcommand{\numberline}[1]{%
\settowidth\@tempdimb{#1\hspace{0.25em}}%
\ifdim\@tempdima<\@tempdimb%
  \@tempdima=\@tempdimb%
\fi
\hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}\makeatother}
\AtEndOfPackage{\makeatletter\@addtoreset{equation}{chapter}\makeatother}

%%%%%%Other%%%%%%%
\RequirePackage[bottom,perpage,hang]{footmisc}
\raggedbottom
%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
%% setup packages
%%%%%%%%%%%%%%%%%%%%
%% setup
\ifXDU@Option@PrintVersion
  \hypersetup{
    CJKbookmarks,
    bookmarksnumbered,
    plainpages    = false,
    pdfstartview  = FitH
  }
\else
  \definecolor{XDU@hypercolor@darkgreen}{rgb}{0.1,0.5,0.1}
  \hypersetup{
    CJKbookmarks,
    bookmarksnumbered,
    colorlinks,
    linkcolor     = black,
    anchorcolor   = black,
    citecolor     = black,
    urlcolor      = black,
    plainpages    = false,
    pdfstartview  = FitH
  }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   utilities

\DeclareRobustCommand{\XDU@toc@add}[1]
  {\phantomsection\addcontentsline{toc}{chapter}{#1}}

%% underline
\def\CJKunderlinecolor{}
\def\XDU@@underline[#1]#2{\CJKunderline {\hbox to #1{\hfill{#2}\hfill}}}
\DeclareRobustCommand{\XDU@underline}
  {\@ifnextchar[\XDU@@underline\CJKunderline }

\def\XDU@@underlinea[#1]#2{\CJKunderline[thickness=1pt] {\hbox to #1{\hfill{#2}\hfill}}}
\DeclareRobustCommand{\XDU@underlinea}
  {\@ifnextchar[\XDU@@underlinea\CJKunderline }

\DeclareRobustCommand*{\XDU@bold}{\bfseries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    font
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{calrsfs}
\@ifpackageloaded{fontspec}{
    \PassOptionsToPackage{no-math}{fontspec}
}{
    \RequirePackage[no-math]{fontspec}
}
\setmainfont{Times New Roman}
\RequirePackage{mathspec}
\setmathsfont{Times New Roman}
%\usepackage{xeCJK}
% 设置文档正文字体为宋体
%\setCJKmainfont[BoldFont=SimHei]{SimSun}
%\setCJKmonofont{SimSun}     % 设置缺省中文字体
%\setCJKfamilyfont{song}[AutoFakeBold=1]{SimSun}                             %宋体 song  
\setCJKfamilyfont{song}[AutoFakeBold={3}]{SimSun}                             %宋体 song  
\newcommand{\song}{\CJKfamily{song}}
%\setCJKfamilyfont{hei}{SimHei}                              %黑体  hei 
%\setCJKfamilyfont{hei}[AutoFakeBold=1]{SimHei}                              %黑体  hei  
\setCJKfamilyfont{hei}[AutoFakeBold={3}]{SimHei}                              %黑体  hei  
\newcommand{\hei}{\CJKfamily{hei}}

%% equation
\renewcommand\normalsize{%
	\abovedisplayskip = 0pt
	\belowdisplayskip = 0pt
	\abovedisplayshortskip=0pt
	\belowdisplayshortskip=1.65em}

%% family
\DeclareRobustCommand*{\XDU@font@st}{\song}
\DeclareRobustCommand*{\XDU@font@ht}{\hei}

%% size
\DeclareRobustCommand*{\XDU@font@zihao}[1]{\zihao{#1}\setlength{\baselineskip}{20pt}}

\renewcommand*{\baselinestretch}{1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    document setting

%% 参考网址：https://en.wikibooks.org/wiki/LaTeX/Page_Layout
%% page ql head
\setlength{\textwidth}{\paperwidth}%
\setlength{\textheight}{\paperheight}%
\setlength\marginparwidth{0cm}%
\setlength\marginparsep{0cm}%
\addtolength{\textwidth}{-5.5cm}% 2.5+2.5+0.5
\setlength{\oddsidemargin}{3cm-1in-\hoffset}%
\setlength{\evensidemargin}{2.5cm-1in-\hoffset}%
\setlength{\topmargin}{2cm-1in-\voffset}%
\setlength{\headheight}{31pt}%
\setlength{\headsep}{0pt}%
\setlength{\textheight}{24cm}%
\setlength{\footskip}{\paperheight-3cm-6pt-\textheight-1.75cm}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    head and foot

%% remove header from empty page

%% label of even page header
\def\XDU@hdr@thesistitle
  {Master Thesis of \XDU@elabel@university}

%% the double line under header
\newcommand{\makeheadrule}{%
\makebox[0pt][l]{\rule[9pt]{\headwidth}{0.5pt}}%
\rule[8pt]{\headwidth}{0.5pt}}
\renewcommand{\headrule}{%
{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
\makeheadrule}}

%% set header
\fancypagestyle{plain}{
    \pagestyle{fancy}
}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[CE]{{\XDU@font@st\XDU@font@zihao{5}\XDU@hdr@thesistitle}}
\fancyhead[CO]{{\XDU@font@st\XDU@font@zihao{5}\nouppercase\leftmark}}
\fancyfoot[C]{{\XDU@font@st\XDU@font@zihao{5}\thepage}}
%% par skip
%\parskip 0pt plus 6pt minus 0pt
%% section level
\setcounter{secnumdepth}{4}

%% chapter
\ctexset { chapter = { 
                        name={\XDU@chapter@prenumber,\XDU@chapter@afternumber }, 
                        number={\arabic {chapter}}, 
                        format={\centering \XDU@font@ht \XDU@font@zihao {3}}, 
                        nameformat={}, 
                        numberformat={},
                        aftername={\quad },
                        titleformat={}, 
                        beforeskip={6pt}, 
                        afterskip={18pt},
                        indent={0pt} 
                    } 
}

%% chapter without number
\DeclareRobustCommand{\XDU@nchapter}[1]{\chapter*{#1}\markboth{#1}{}}

%% section
\ctexset { section = {
                      name={,}, 
                      number={\thesection }, 
                      format={\raggedright \XDU@bold \XDU@font@st \XDU@font@zihao {-3}}, 
                      nameformat={},
                      numberformat={}, 
                      aftername={\quad }, 
                      titleformat={}, 
                      beforeskip={18pt plus 0pt minus 0pt}, 
                      afterskip={12pt}, 
                      indent={0pt} 
                     } 
}

%% subsection
\ctexset { subsection = {
                         name={,}, 
                         number={\thesubsection},
                         format={\raggedright \XDU@bold \XDU@font@st \XDU@font@zihao {4}},
                         nameformat={}, 
                         numberformat={}, 
                         aftername={\quad }, 
                         titleformat={},
                         beforeskip={12pt plus 0pt minus 0pt}, 
                         afterskip={6pt}, 
                         indent={2em},
                         indent={0.85cm}
                        } 
}

%% subsubsection
\ctexset { subsubsection = { 
                            name={,}, 
                            number={\thesubsubsection},
                            format={\raggedright \XDU@font@st \XDU@font@zihao {-4}}, 
                            nameformat={},
                            numberformat={}, 
                            aftername={\quad }, 
                            titleformat={}, 
                            beforeskip={6pt plus 0pt minus 0pt}, 
                            afterskip={0pt}, indent={4em} 
                           } 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    figure and table

%% figure name
\ctexset { figurename={\XDU@font@zihao {5}\XDU@label@figure@cap } }

%% table name
\ctexset { tablename={\XDU@font@zihao {5}\XDU@label@table@cap } } 
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}} %转行

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    chinese  cover
%% ql first
%\RequirePackage{emptypage}
\DeclareRobustCommand{\XDU@make@cover}{
   \setlength{\parindent}{0pt}\thispagestyle{empty}% \thispagestyle:changes the style for the current page only
    %\setlength{\topskip}{0pt}\setlength{\parskip}{0pt}\renewcommand{\baselinestretch}{1}\setlength{\baselineskip}{0pt}
    %\rule{\textwidth}{1pt}
    \vspace*{14.2cm}\\
    \begin{minipage}[t][3.2cm]{\textwidth}
        \centering
        \normalfont\XDU@font@st\XDU@font@zihao{2}\setlength{\baselineskip}{30pt}%
        \XDU@bold\XDU@value@thesis@title\\%
    \end{minipage}
    \vspace*{0.9cm}
    \hspace*{3.5cm}\begin{minipage}[t][3.2cm]{9cm}
    	\vspace*{1cm}
        \XDU@font@zihao{4}\setlength{\baselineskip}{30pt}%
        \newlength{\linelength}
        \setlength{\linelength}{9cm-4.5em}
        \XDU@bold\XDU@font@ht{\XDU@label@cover@author}\XDU@font@st\XDU@underlinea[\linelength]{\XDU@value@author@name}\\%
        \setlength{\linelength}{9cm-9.5em}
        \XDU@bold\XDU@font@ht{\XDU@label@cover@schoolAdvisor}\XDU@font@st\XDU@underlinea[\linelength]{\XDU@value@schoolAdvisor@name~\XDU@value@schoolAdvisor@title}\\%
        \setlength{\linelength}{9cm-9.5em}
        \XDU@bold\XDU@font@ht{\XDU@label@cover@industrialAdvisor}\XDU@font@st\XDU@underlinea[\linelength]{\XDU@value@industrialAdvisor@name~\XDU@value@industrialAdvisor@title}\\%
        \setlength{\linelength}{9cm-6.5em}
        \XDU@bold\XDU@font@ht{申请学位类别}\XDU@font@st\XDU@underlinea[\linelength]{\XDU@value@degree}%
    %}
    \end{minipage}
    \clearpage\thispagestyle{empty}\setlength{\parindent}{2\ccwd}\cleardoublepage
}



\DeclareRobustCommand{\XDU@make@title}
  {{\cleardoublepage\setlength{\parindent}{0pt}\thispagestyle{empty}%

    \normalfont\XDU@font@st\renewcommand{\baselinestretch}{1.2}\zihao{5}%
    \rule{0pt}{1.25cm}\hspace{6pt}\parbox[b]{4.5cm}{
        \XDU@bold\XDU@label@cover@UDC\XDU@underlinea[73pt]{\XDU@value@thesis@UDC}\par%
        \vspace{2pt}%
        \XDU@bold\XDU@label@cover@classification\XDU@underlinea[73pt]{\XDU@value@thesis@classification}%
    }
    \hfill\parbox[b]{4.5cm}{
        \XDU@bold\XDU@label@cover@studentNo\XDU@underlinea[83pt]{\XDU@value@thesis@studentNo}\par%
        \vspace{2pt}%
        \XDU@bold\XDU@label@cover@confidential\XDU@underlinea[83pt]{\XDU@value@thesis@confidential}%
    }

\renewcommand{\baselinestretch}{1}%
    \vspace{2.05cm}%
    \makebox[\textwidth]{\rule{0pt}{4.5cm}\shortstack[c]{
        \XDU@bold\XDU@font@ht\XDU@font@zihao{1}\setlength{\baselineskip}{30pt}\XDU@label@university\\%
        \vspace{60pt} \\%
        \XDU@bold\XDU@font@st\XDU@font@zihao{-1}\setlength{\baselineskip}{30pt}\XDU@value@degreemark\XDU@value@thesis%
    }}
    \rule{0pt}{2.7cm}%
    \rule[-3.2cm]{0pt}{3.2cm}\parbox[t]{\textwidth}{
    \begin{center}%
     \XDU@bold\XDU@font@zihao{2}\setlength{\baselineskip}{30pt}\XDU@value@thesis@title%
    \end{center}%
    }

    \vspace{2.5cm}%
    \hspace{4.5cm}\parbox{8.5cm}{
        \XDU@font@st\XDU@font@zihao{4}\setlength{\baselineskip}{32pt}%
        {\XDU@bold\XDU@label@cover@author{：}}\XDU@value@author@name\\%
        {\XDU@bold\XDU@label@cover@field{：}}\XDU@value@field\\%
        {\XDU@bold\XDU@label@cover@degree{：}}\XDU@value@degree\\%
        {\XDU@bold\XDU@label@cover@schoolAdvisor{：}}\XDU@value@schoolAdvisor@name~\XDU@value@schoolAdvisor@title\\%
        {\XDU@bold\XDU@label@cover@industrialAdvisor{：}}\XDU@value@industrialAdvisor@name~\XDU@value@industrialAdvisor@title\\%
        {\XDU@bold\XDU@label@cover@school{：}}\XDU@value@school\\%
        {\XDU@bold\XDU@label@cover@submit@date{：}}\XDU@value@thesis@submit@date%
    }
   \clearpage\thispagestyle{empty}%
   \renewcommand{\baselinestretch}{1}%
   \setlength{\parindent}{2\ccwd}\cleardoublepage}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    english  cover

\DeclareRobustCommand{\XDU@make@titleenglish}{
\begin{titlepage}
    \cleardoublepage\setlength{\parindent}{0pt}\thispagestyle{empty}%
    \normalfont\XDU@font@st%
    %\vspace*{0.3cm}%
    %\setlength{\parskip}{1pt}\setlength{\topskip}{1pt}\setlength{\baselineskip}{1pt}\setlength{\lineskip}{1pt}
%    \hrule
    %\rule[0cm]{\textwidth}{1pt}
    %\rule[0cm]{0.8\textwidth}{1pt}
    %\makebox[\textwidth]{\rule{0pt}{0.3cm}}
    \rule[-2.6cm]{0pt}{3.5cm}\begin{minipage}[t][3.5cm][t]{\textwidth}
        \centering
        \XDU@font@zihao{2}\setlength{\baselineskip}{30pt}%
        {\XDU@bold\XDU@evalue@thesis@title}\\%
    \end{minipage}
    \vspace*{2.5cm}\\%
    \begin{minipage}[t][5.5cm]{\textwidth}
        \centering
        \XDU@font@zihao{3}\setlength{\baselineskip}{30pt}%
        A\space\XDU@evalue@papertype\space submitted to\\\XDU@elabel@university\\%
in partial fulfillment of the requirements \\ for the degree of\space\XDU@evalue@degree%
\\ in\space\XDU@evalue@author@major%

    \end{minipage}
    %\vspace*{6.5cm}\\%
    \vspace*{6.3cm}\\%
    \begin{minipage}[t][5.3cm][t]{\textwidth}
        \centering
        \XDU@font@zihao{3}\setlength{\baselineskip}{30pt}%
        By \\%
        \XDU@evalue@author@name\\%
        \hspace*{1.66cm}\begin{minipage}[t][2cm]{6.5cm}
            %\centering
            \XDU@elabel@cover@advisor\XDU@evalue@schoolAdvisor@name

            \vspace{10pt}

            \XDU@elabel@cover@advisor\XDU@evalue@industrialAdvisor@name\\
        \end{minipage}
        \hfill    
        \begin{minipage}[t][2cm]{6.5cm}
            %\centering
            {Title:}\XDU@evalue@schoolAdvisor@title

            \vspace{10pt}
            
            {Title:}\XDU@evalue@industrialAdvisor@title\\%
        \end{minipage}
        \XDU@evalue@thesis@submit@date\\%
    \end{minipage}

   \clearpage\thispagestyle{empty}%
   \setlength{\parindent}{2\ccwd}\cleardoublepage
\end{titlepage}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    statement and copyright

\DeclareRobustCommand{\XDU@make@statementandcopyright}
  {{\cleardoublepage\setlength{\parindent}{0pt}\thispagestyle{empty}%
  \normalfont\XDU@font@st%
   \vspace*{-29pt}
   \begin{center}%
   \bfseries\XDU@font@zihao{4}%
     \XDU@label@stat@statement%
   \end{center}%
   \XDU@font@zihao{-4}%
   \vskip 7pt%
   \hspace*{2em}\setlength{\parindent}{2\ccwd}\XDU@value@stat@statement\setlength{\parindent}{0pt}%
  \vskip 20pt%
   \hspace*{2em}\XDU@lable@stat@auther\XDU@underline[110pt]{}\hspace*{4em}%
    \XDU@lable@stat@date\XDU@underline[110pt]{}\hspace*{1em}
  \vskip \stretch{4}%
   \begin{center}%
     \bfseries\XDU@font@zihao{4}%
     \XDU@lable@stat@copyright%
   \end{center}%
   \XDU@font@zihao{-4}%
   \vskip 7pt%
   \hspace*{2em}\setlength{\parindent}{2\ccwd}\XDU@value@stat@copyright\setlength{\parindent}{0pt}%
  \vskip 20pt%
   \normalfont\XDU@font@st\XDU@font@zihao{-4}%
   \hspace*{2em}\XDU@lable@stat@auther\XDU@underline[110pt]{}\hspace*{4em}%
 \XDU@lable@stat@advisor\XDU@underline[110pt]{}\hspace*{1em}%
  \vskip 20pt%
   \hspace*{2em}\XDU@lable@stat@date\XDU@underline[110pt]{}\hspace*{4em}%
     \XDU@lable@stat@date\XDU@underline[110pt]{}\hspace*{1em}%
  \vskip \stretch{1}%
  \clearpage\thispagestyle{empty}%
  \setlength{\parindent}{2\ccwd}\cleardoublepage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    abstract

%% chinese abstract
\newenvironment{abstract}
  {\setlength{\parskip}{0em}\XDU@toc@add{\XDU@toc@abstract}%
   \XDU@nchapter{\XDU@label@abstract}\setlength{\parskip}{0em}\XDU@font@zihao{-4}}
  {\cleardoublepage}

%% chinese keywords
\DeclareRobustCommand{\keywords}[1]
  {{\setlength{\parindent}{0pt}\vspace{20pt}%
   \normalfont\XDU@font@st\bfseries\XDU@font@zihao{-4}%
   \XDU@label@keywords%
   \normalfont\XDU@font@st\XDU@font@zihao{-4}%
   {#1}\setlength{\parindent}{2\ccwd}}}

%% english abstract
\newenvironment{englishabstract}
  {\setlength{\parskip}{0em}\XDU@toc@add{\XDU@etoc@abstract}\XDU@nchapter{\XDU@elabel@abstract}%
   \vspace{-2ex}\CTEXnoindent\setlength{\parskip}{0em}\normalfont\XDU@font@zihao{-4}%
   \CTEXnoindent}
  {\cleardoublepage}

%% english keywords
\DeclareRobustCommand{\englishkeywords}[1]
  {{\setlength{\parindent}{0pt}\vspace{2ex}%
   \normalfont\XDU@font@st\bfseries\XDU@font@zihao{-4}%
   \XDU@elabel@keywords~%
   \normalfont\XDU@font@st\XDU@font@zihao{-4}%
   {#1}\setlength{\parindent}{2\ccwd}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    content
    \renewcommand{\cftdot}{\ldots}
    \renewcommand{\cftdotsep}{0.1}
    \setlength{\cftbeforechapskip}{0pt}
    \setlength{\cftbeforesecskip}{0pt}
    \setlength{\cftbeforesubsecskip}{0pt}
    \renewcommand{\cftchapfont}{\XDU@font@ht\XDU@font@zihao{-4}}
    \renewcommand{\cftsecfont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftsubsecfont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
    \renewcommand{\cftchapdotsep}{\cftdotsep}
    \renewcommand{\cftchappagefont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftsecpagefont}{\XDU@font@zihao{-4}}
    \renewcommand{\cftsubsecpagefont}{\XDU@font@zihao{-4}}
    \renewcommand{\cftfigfont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftloftitlefont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftfigpagefont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cfttabfont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftlottitlefont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cfttabpagefont}{\XDU@font@st\XDU@font@zihao{-4}}

    \captionsetup[table]{aboveskip=3pt}
    \captionsetup[table]{belowskip=0pt}
    \captionsetup[figure]{aboveskip=5pt}
    \captionsetup[figure]{belowskip=-5pt}
    %\setlength{\abovecaptionskip}{0.5em}
    %\setlength{\belowcaptionskip}{0pt}
    %%\renewcommand{\captionlabeldelim}{\ ~}%去冒号
    \DeclareCaptionLabelSeparator{twospace}{\ ~}
    \captionsetup{labelsep=twospace} 
    \renewcommand{\captionfont}{\XDU@font@st\XDU@font@zihao{5}}
    \renewcommand{\cftfignumwidth}{2.5em}
    %\renewcommand{\cftfigpresnum}{\hspace{-1.5em}图}
    \renewcommand{\cftfigpresnum}{\hspace{-1.5em}Fig. }
    \renewcommand{\cfttabnumwidth}{4em}
    %\renewcommand{\cfttabpresnum}{\hspace{-1.5em}表}
    \renewcommand{\cfttabpresnum}{\hspace{-1.5em}TABLE }
    \newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
    \addtocontents{lof}{\protect\noaddvspace}
    \addtocontents{lof}{\linespread{1.5}\selectfont}
    \addtocontents{lot}{\protect\noaddvspace}
    \addtocontents{lot}{\linespread{1.5}\selectfont}

%% list of figures
\ctexset { listfigurename={\XDU@label@listoffigures} }
\DeclareRobustCommand{\XDU@listoffigures}
  {\XDU@toc@add{\XDU@toc@listoffigures}%
    \listoffigures}

%% list of tables
\ctexset { listtablename={\XDU@label@listoftables } } 
\DeclareRobustCommand{\XDU@listoftables}
  {\XDU@toc@add{\XDU@toc@listoftables}%
    \listoftables}

%% list of Symbols
\newenvironment{symbollist}
  {\setlength{\parindent}{0pt}\XDU@toc@add{\XDU@toc@symbollist@title}%
   \XDU@nchapter{\XDU@label@symbollist@title}\setlength{\parindent}{2\ccwd}%
   \begin{list}{}
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \setlength{\parindent}{0pt}\normalfont\XDU@font@st\XDU@font@zihao{-4}
     \setlength{\leftmargin}{0.5\labelwidth}}}
  {\end{list}\setlength{\parindent}{2\ccwd}\cleardoublepage}


%% list of abbreviations
\newenvironment{abbreviationlist}
  {\setlength{\parindent}{0pt}\XDU@toc@add{\XDU@toc@abbreviationlist@title}%
   \XDU@nchapter{\XDU@label@abbreviationlist@title}\setlength{\parindent}{2\ccwd}%
   \begin{list}{}
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \setlength{\parindent}{0pt}\normalfont\XDU@font@st\XDU@font@zihao{-4}
     \setlength{\leftmargin}{0.5\labelwidth}}}
  {\end{list}\setlength{\parindent}{2\ccwd}\cleardoublepage}

%% content
\ctexset { contentsname={\XDU@label@content } }
\DeclareRobustCommand{\XDU@tableofcontents}
  {\tableofcontents}
%\renewcommand{\cftdotsep}{0.3pt}
%\newcommand\mydot[1]{\scalebox{#1}{.}}
%\renewcommand\cftdot{\mydot{1}} % change the size of dots
%\renewcommand\cftdotsep{0.3} % change the space between dots

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    referrence
\RequirePackage{url}
\renewcommand{\UrlFont}{\XDU@font@zihao{5}}
\ctexset { bibname={\XDU@label@ref@title } }
\bibliographystyle{gbt7714-2005}

\renewenvironment{thebibliography}[1]
  {\XDU@toc@add{\XDU@toc@ref@title}%
   \XDU@nchapter{\bibname}%
   \XDU@font@zihao{5}%
   \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \settowidth\labelwidth{\@biblabel{#1}}%
     \leftmargin\labelwidth\advance\leftmargin\labelsep%
     \@openbib@code\usecounter{enumiv}\let\p@enumiv\@empty%
     \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy\clubpenalty4000\@clubpenalty\clubpenalty%
   \widowpenalty4000\sfcode`\.\@m}
  {\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
   \endlist
   \cleardoublepage
   }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    thanks

\renewenvironment{thanks}
  {\XDU@toc@add{\XDU@toc@thanks}%
   \XDU@nchapter{\XDU@label@thanks}}
  {\cleardoublepage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    resume

%% environment
\newenvironment{resume}
  {\setlength{\parindent}{0pt}\XDU@toc@add{\XDU@toc@resume@title}%
   \XDU@nchapter{\XDU@label@resume@title}%
   \renewcommand{\thesection}{\arabic{section}}\setlength{\parindent}{2\ccwd}}
  {\cleardoublepage}

%% resume list
\newcounter{XDU@counter@resumelistcounter}
\newenvironment{resumelist}[1]
  {{\subsection*{\textbf{#1}}\setlength{\parindent}{2\ccwd}}%
   \begin{list}{[\arabic{XDU@counter@resumelistcounter}]}
    {\usecounter{XDU@counter@resumelistcounter}
     \setcounter{XDU@counter@resumelistcounter}{0}
     \setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
     \setlength{\parindent}{0pt}\normalfont\XDU@font@st\XDU@font@zihao{-4}
     \setlength{\leftmargin}{2\labelwidth}}}
  {\end{list}}

\newenvironment{resumelist*}
  {\begin{list}{}
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \setlength{\parindent}{0pt}\normalfont\XDU@font@st\XDU@font@zihao{-4}
     \setlength{\leftmargin}{\labelwidth}}}
  {\end{list}}

%% resume list item
\DeclareRobustCommand{\resumelistitem}{\item{}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    thesis structure

%% front matter
\DeclareRobustCommand{\XDUfrontmatter}
  {\XDU@make@cover%
   \XDU@make@title%
   \XDU@make@titleenglish%
   \XDU@make@statementandcopyright%
   \frontmatter\pagenumbering{Roman}%
   \setlength{\baselineskip}{20pt}
   }

%% premain matter
\DeclareRobustCommand{\XDUpremainmatter}
  {\XDU@listoffigures\cleardoublepage%
   \XDU@listoftables\cleardoublepage%
  }
%% main matter
\DeclareRobustCommand{\XDUmainmatter}
  {\XDU@tableofcontents\cleardoublepage%
   \mainmatter}

%% back matter
\DeclareRobustCommand{\XDUbackmatter}[1]
  {\backmatter{}#1{}}
