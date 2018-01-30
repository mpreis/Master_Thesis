%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]%
\ProvidesClass{dbrgrptt}[%
  2015/10/19 v1.0 Paris-Lodron Univerity of Salzburg, Department of Computer%
  Sciences, Database Research Group, thesis template%
]%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Explicitly parsed to keep track of the layout
\DeclareOption{twocolumn}{%
  \newcommand{\@two@column}{\@empty}%
  \PassOptionsToClass{\CurrentOption}{memoir}%
}%
\DeclareOption{onecolumn}{%
  \newcommand{\@one@column}{\@empty}%
  \PassOptionsToClass{\CurrentOption}{memoir}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Language (passed to Babel package)
\DeclareOption{english}{%
  \PassOptionsToPackage{\CurrentOption}{babel}%
  \newcommand{\@lang@en}{\@empty}%
}%
\DeclareOption{naustrian}{%
  \PassOptionsToPackage{\CurrentOption}{babel}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thesis type (stored)
\DeclareOption{master}{%
  % language-dependent
  \ifdefined\@lang@en%
    \newcommand{\@thesis@type}{MASTER'S THESIS}%
  \else%
    \newcommand{\@thesis@type}{MASTERARBEIT}%
  \fi%

  % language-independent
  \newcommand{\@aimed@degree}{Diplom-Ingenieur}%
}%
\DeclareOption{bachelor}{%
  % language-dependent
  \ifdefined\@lang@en%
    \newcommand{\@thesis@type}{BACHELOR'S THESIS}%
  \else%
    \newcommand{\@thesis@type}{BACHELORARBEIT}%
  \fi%
  % language-independent
  \newcommand{\@aimed@degree}{Bachelor of Engineering}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Seal indication
\DeclareOption{seal}{%
  \newcommand{\@seal}{\@empty}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Signature indication
\DeclareOption{signatures}{%
  \newcommand{\@signatures}{\@empty}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Unknown option (passed to memoir class)
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}%
}%

% Process options
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[a4paper, 11pt]{memoir}%
\chapterstyle{veelo}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rectangle items for the itemize environment
\renewcommand{\labelitemi}{\scriptsize$\blacksquare$}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numbered subsections and subsubsections
\setsecnumdepth{subsubsection}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[utf8]{inputenc}
%\RequirePackage[T1]{fontenc}
\RequirePackage{babel}%
\RequirePackage{graphicx}%
\RequirePackage[linesnumbered, procnumbered, ruled, norelsize]{algorithm2e}%
\RequirePackage{tikz}%
\RequirePackage{ifthen}%
\RequirePackage{xparse}%
\RequirePackage{epstopdf}%
\RequirePackage{geometry}%
\RequirePackage{color}%
\RequirePackage{amssymb}%
\RequirePackage[pdfpagelabels]{hyperref}%
\RequirePackage{acronym}%
\RequirePackage{amsthm}%
\RequirePackage{amsmath}%
\RequirePackage{subcaption}%
\RequirePackage{standalone}%
\RequirePackage{calc}%
\RequirePackage{import}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Paths
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\graphicspath{{figs/}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\HUGE}{\fontsize{30}{34}\selectfont}%
\renewcommand{\huge}{\fontsize{20}{23}\selectfont}%
\renewcommand{\LARGE}{\fontsize{17}{22}\selectfont}%
\renewcommand{\Large}{\fontsize{14}{18}\selectfont}%
\renewcommand{\large}{\fontsize{12}{14.5}\selectfont}%
\renewcommand{\normalsize}{\fontsize{11}{13.5}\selectfont}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Macros & styles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title of the thesis
% \thesistitle{<TITLE>}
\newcommand{\thesistitle}[1]{\title{#1}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Date of the thesis
% \thesisdate{<DATE>}
\newcommand{\thesisdate}[1]{\date{#1}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author of the thesis
% \thesisauthor{<NAME>}{<REGISTRATION-NUMBER>}
\newcommand{\thesisauthor}[2]{%
  \author{#1}%
  \newcommand{\@thesis@author@name}{#1}%
  \newcommand{\@thesis@author@regno}{#2}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set main supervisor (also initializes the three possible co-supervisors with
% @empty
% \setsupervisor{<PRETITLES> <NAME-OF-SUPERVISOR>, <POSTTITLES>}
\newcommand{\setsupervisor}[1]{%
  \newcommand{\@supervisor}{#1}%
  \newcommand{\@first@cosupervisor}{\@empty}%
  \newcommand{\@second@cosupervisor}{\@empty}%
  \newcommand{\@third@cosupervisor}{\@empty}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set first co-supervisor
% \setfirstcosupervisor{<PRETITLES> <NAME-OF-FIRST-COSUPERVISOR>, <POSTTITLES>}
\newcommand{\setfirstcosupervisor}[1]{%
  \renewcommand{\@first@cosupervisor}{#1}%
}%
% Set second co-supervisor
% \setsecondcosupervisor{<PRETITLES> <NAME-OF-SECOND-COSUPERVISOR>, <POSTTITLES>}
\newcommand{\setsecondcosupervisor}[1]{%
  \renewcommand{\@second@cosupervisor}{#1}%
}%
% Set third co-supervisor
% \setthirdcosupervisor{<PRETITLES> <NAME-OF-THIRD-COSUPERVISOR>, <POSTTITLES>}
\newcommand{\setthirdcosupervisor}[1]{%
  \renewcommand{\@third@cosupervisor}{#1}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Statement of authentication
% \authenticationstatement
\newcommand{\authenticationstatement}{%
  \@preface@prefix%

  \chapter{\@soa@title}%

  \vspace{1cm}%
  \noindent\@soa@statement%

  \vspace{1.5cm}%
  \noindent\@field@box{Salzburg, \today\hfill}%
  \noindent\@field@box{\hfill\vspace{-0.2cm}\underline{\hspace{.5\textwidth}}}%

  \noindent\@field@box{\hfill}%
  \noindent\@field@box{\hfill\tiny\@thesis@author@name}%

  \@preface@postfix%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Acknowledgments
% \acknowledgments{<ACKNOWLEDGMENTS-TEXT>}
\newcommand{\acknowledgments}[1]{\@preface@default@page{\@ack@title}{#1}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract (redefinition)
% \abstract{<ABSTRACT-TEXT>}
\renewcommand{\abstract}[1]{\@preface@default@page{\@abstract@title}{#1}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Insert highlighted TODO notice
\newcommand{\todo}[1]{{\textcolor{red}{{\bfseries TODO:} #1}}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Insert highlighted TOREVISE notice
\newcommand{\torevise}{\textcolor{red}{\bfseries TOREVISE}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Insert highlighted text that needs review
\newcommand{\needsreview}[1]{\textcolor{red}{#1}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Insert 'et al.' in italics
\newcommand{\etal}{\textit{et~al.~}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Used internally but may also be useful externally if one wants different layouts
% for several sites and wants to restore the default layout afterwards
\newcommand{\restorelayout}{%
  \ifdefined\@one@column%
    \onecolumn%
  \else
    \ifdefined\@two@column%
      \twocolumn%
    \fi%
  \fi%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Backup old \enumerate and \itemize environment definitions
% Renew \enumerate and \itemize environments to have
%   - \parskip{0pt}
\let\oldenumerate\enumerate%
\let\endoldenumerate\endenumerate%
\renewenvironment{enumerate}{%
  \begin{oldenumerate}%
     \setlength{\parskip}{0pt}%
     \renewcommand{\labelenumii}{\theenumii}%
     \renewcommand{\theenumii}{\theenumi.\arabic{enumii}.}%
}{\end{oldenumerate}}%
\let\olditemize\itemize%
\let\endolditemize\enditemize%
\renewenvironment{itemize}{%
  \begin{olditemize}%
     \setlength{\parskip}{0pt}%
}{\end{olditemize}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resolve algorithm2e list of algorithms bug (list not mentioned in the ToC)
\newlistof{listofalgorithms}{loa}{%
  \ifdefined\@lang@en%
    List of Algorithms%
  \else%
    Algorithmenverzeichnis%
  \fi%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% algorithm environment
\SetAlgoSkip{bigskip}%
\DontPrintSemicolon%
\SetAlgoVlined%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Theorem styling
\newtheoremstyle{break}%
  {}% Space above, empty = default value
  {}% Space below
  {}% Body font
  {}% Indent amount, empty = noindent
  {\bfseries}%  Theorem head font
  {.}%  Punctuation after Theorem head
  {\newline}% Space after Theorem head
  {\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}% Theorem head specification
\theoremstyle{break}%
\newtheorem{theorem}{Theorem}[chapter]%
\newtheorem{lemma}[theorem]{Lemma}%
\newtheorem{corollary}[theorem]{Corollary}%
\newtheorem{definition}[theorem]{Definition}%
\newtheorem{proposition}[theorem]{Proposition}%
\renewenvironment{proof}[1][\proofname]{{\bfseries \noindent #1. \newline}}{\qed}%
\renewcommand\qedsymbol{$\blacksquare$}%

\theoremstyle{remark}
\newtheorem*{remark}{Remark}%

% Equation numbering
\numberwithin{equation}{section}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set the path to the (old) University of Salzburg seal
\newcommand{\@old@seal}{general/logo-university-of-salzburg-new-en.eps}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set language-dependent variables (mostly text but also some figure paths)
\newcommand{\@set@language@dependent@variables}{%
  % english
  \ifdefined\@lang@en%
    % text
    \newcommand{\@aimed@degree@prefix}{%
      submitted in partial fulfillment of the requirements for the degree of%
    }%
    \newcommand{\@study@title@prefix}{in}%
    \newcommand{\@study@title}{Computer Sciences}%
    \newcommand{\@thesis@author@name@prefix}{by}%
    \newcommand{\@regno@prefix}{Registration Number}%
    \newcommand{\@department@prefix}{to the}%
    \newcommand{\@department}{Department of Computer Sciences}%
    \newcommand{\@faculty@prefix}{at the}%
    \newcommand{\@faculty}{Faculty of Natural Sciences}%
    \newcommand{\@university@prefix}{at the}%
    \newcommand{\@university}{Paris Lodron University of Salzburg}%
    \newcommand{\@supervisor@prefix}{Supervisor}%
    \newcommand{\@cosupervisor@prefix}{%
      \ifthenelse{%
        \equal{\@second@cosupervisor}{\@empty} \and%
        \equal{\@third@cosupervisor}{\@empty}%
      }{Co-Supervisor}{Co-Supervisors}%
    }%
    \newcommand{\@soa@title}{Statement of Authentication}%
    \newcommand{\@soa@statement}{%
      I hereby declare that I have written the present thesis independently,
      without assistance from external parties and without use of other resources
      than those indicated. The ideas taken directly or indirectly from external
      sources (including electronic sources) are duly acknowledged in the text.
      The material, either in full or in part, has not been previously submitted
      for grading at this or any other academic institution.%
    }%
    \newcommand{\@ack@title}{Acknowledgments}%
    \newcommand{\@abstract@title}{Abstract}%
    \newcommand{\@todo@text}{Enter text.}%
    % figures (paths)
    \newcommand{\@logo}{general/logo-university-of-salzburg-new-en.eps}%
  % german
  \else%
    % text
    \newcommand{\@aimed@degree@prefix}{%
      zur Erlangung des akademischen Grades%
    }%
    \newcommand{\@study@title@prefix}{im Rahmen des Studiums}%
    \newcommand{\@study@title}{Informatik}%
    \newcommand{\@thesis@author@name@prefix}{eingereicht von}%
    \newcommand{\@regno@prefix}{Matrikelnummer}%
    \newcommand{\@department@prefix}{am}%
    \newcommand{\@department}{Fachbereich f{\"u}r Computerwissenschaften}%
    \newcommand{\@faculty@prefix}{an der}%
    \newcommand{\@faculty}{Naturwissenschaftlichen Fakult{\"a}t}%
    \newcommand{\@university@prefix}{der}%
    \newcommand{\@university}{Paris Lodron Universit{\"a}t Salzburg}%
    \newcommand{\@supervisor@prefix}{Betreuer}%
    \newcommand{\@cosupervisor@prefix}{Nebenbetreuer}%
    \newcommand{\@soa@title}{Verfassungserkl{\"a}rung}%
    \newcommand{\@soa@statement}{%
      Hiermit erkl{\"a}re ich, dass ich die vorliegende Arbeit selbst{\"a}ndig,
      ohne fremde Hilfe und ohne Benutzung anderer als der angegebenen Hilfsmittel
      angefertigt habe. Die aus fremden Quellen (einschlie{\ss}lich elektronischer
      Quellen) direkt oder indirekt {\"u}bernommenen Gedanken sind ausnahmslos als
      solche kenntlich gemacht. Die Arbeit ist in gleicher oder {\"a}hnlicher Form
      oder auszugsweise im Rahmen einer anderen Pr{\"u}fung noch nicht vorgelegt
      worden.%
    }%
    \newcommand{\@ack@title}{Danksagung}%
    \newcommand{\@abstract@title}{Kurzfassung}%
    \newcommand{\@todo@text}{Text einf{\"u}gen.}%
    % figures (paths)
    \newcommand{\@logo}{general/logo-university-of-salzburg-new-ger.eps}%
  \fi%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parbox filling a third of a page horizontally (used to generate the signature
% fields)
\newcommand{\@field@box}[1]{%
  \parbox{.5\textwidth}{#1}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Common prefix and postfix of the preface part of the thesis
\newcommand{\@preface@prefix}{
  \onecolumn%
  \renewcommand{\chapterheadstart}{\vspace*{6cm}}%
}%
\newcommand{\@preface@postfix}{%
  \renewcommand{\chapterheadstart}{\vspace*{\beforechapskip}}%
  \restorelayout%
  \clearpage\leavevmode\thispagestyle{empty}\newpage%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Helper macros to reduce code copies
\newcommand{\@preface@default@page}[2]{%
  \@preface@prefix%

  \chapter{#1}%

  #2%

  \@preface@postfix%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titlepage
\renewcommand{\maketitle}{%
  \@set@language@dependent@variables%

  % page layout (memoir style)
  \settrimmedsize{11in}{210mm}{*}%
  \setlength{\trimtop}{0pt}%
  \setlength{\trimedge}{\stockwidth}%
  \addtolength{\trimedge}{-\paperwidth}%
  \settypeblocksize{8.25in}{33pc}{*}%
  \setulmargins{4cm}{*}{*}%
  \setlrmargins{1.25in}{*}{*}%
  \setmarginnotes{17pt}{51pt}{\onelineskip}%
  \setheadfoot{\onelineskip}{2\onelineskip}%
  \setheaderspaces{*}{2\onelineskip}{*}%
  \checkandfixthelayout%

  % old page layout
  %\newgeometry {%
  %  left = 2.5cm,%
  %  right = 2.4cm,%
  %  bottom = 2.5cm,%
  %  top = 2cm%
  %}%

  \begin{titlingpage}%
    % background
    \ifdefined\@seal%
      \begin{tikzpicture}[overlay,remember picture]%
        \node[at=(current page.south east),anchor=south east,inner sep=0pt, outer sep=0pt] {
          \includegraphics[width = .86\paperwidth]{general/seal-crop}
        };
      \end{tikzpicture}
    \fi%

    % header

    \makepagestyle{plushf}%
    % \makeoddhead{plushf}{}{\includegraphics[height=58pt]{\@logo}}{}%
    % footer
    \makeoddfoot{plushf}{}{%
      \centering
      \@department{} $\bullet$ \@faculty{}

      \@university{}

      Jakob-Haringer-Stra{\ss}e 2 $\bullet$ A-5020 Salzburg% $\bullet$ +43 (0) 662 8044-6328

      \url{informatik.uni-salzburg.at}
    }{}%
    \makefootrule{plushf}{\textwidth}{.25pt}{\footruleskip}%
    \aliaspagestyle{titlingpage}{plushf}%

    \setheadfoot{\heightof{\includegraphics[height=58pt]{\@logo}}}{16pt}%
    \centering%

    {\HUGE\bfseries\@title}%

    \vspace*{1.25cm}%
    {\huge\@thesis@type}%

    \vspace*{.75cm}%
    {\Large\@aimed@degree@prefix}%

    \vspace*{.75cm}%
    {\huge\bfseries\@aimed@degree}%

    \vspace*{.75cm}%
    {\Large\@study@title@prefix}%

    \vspace*{.75cm}%
    {\huge\bfseries\@study@title}

    \vspace*{.75cm}%
    {\Large\@thesis@author@name@prefix}%

    \vspace*{.75cm}%
    {\huge\bfseries\@thesis@author@name}%

    \vspace{.5cm}%
    {\Large\@regno@prefix{ }\@thesis@author@regno}%

    \begin{flushleft}%
      \normalsize%
      \vspace{.75cm}%
      {\@department@prefix{ }\@department}%

      {\@faculty@prefix{ }\@faculty}%

      {\@university@prefix{ }\@university}%

      \vspace{.75cm}%
      \begin{tabular}{@{}ll@{}}%
        \@supervisor@prefix: & \@supervisor \tabularnewline%
        \ifthenelse{\equal{\@first@cosupervisor}{\@empty}}{}{%
          \@cosupervisor@prefix: & \@first@cosupervisor \tabularnewline%
        }%
        \ifthenelse{\equal{\@second@cosupervisor}{\@empty}}{}{%
          \@empty & \@second@cosupervisor \tabularnewline%
        }%
        \ifthenelse{\equal{\@third@cosupervisor}{\@empty}}{}{%
          \@empty & \@third@cosupervisor \tabularnewline%
        }%
      \end{tabular}%
    \end{flushleft}%

    \ifdefined\@signatures%
      %\vspace{1.1cm}%
      \@field@box{Salzburg, \today\hfill}%
      \@field@box{\hfill\vspace{-0.2cm}\underline{\hspace{.5\textwidth}}\hfill}%

      \@field@box{\hfill}%
      \@field@box{\hfill{\tiny\@thesis@author@name\hfill}}%

      \vspace{1cm}%
      \@field@box{\hfill}%
      \@field@box{\hfill\vspace{-0.2cm}\underline{\hspace{.5\textwidth}}}%

      \@field@box{\hfill}%
      \@field@box{\hfill{\tiny\@supervisor}}%
    \else
      \vspace{1.5cm}%
      \begin{center}%
        Salzburg, \today
      \end{center}
    \fi%
  \end{titlingpage}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{example}{\itshape\par\bigskip\noindent\ignorespaces}{\par\bigskip}
