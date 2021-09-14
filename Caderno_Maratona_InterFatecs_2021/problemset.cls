\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{problemset}[2017/03/23 Modelo para prova da Maratona InterFatecs - Leandro Luque]

\newif\ifplastex
\plastexfalse

\newif\if@footer\@footertrue
\DeclareOption{nofooter}{\@footerfalse}

\newif\if@problemnumbers\@problemnumberstrue
\DeclareOption{noproblemnumbers}{\@problemnumbersfalse}

\newif\if@problemids\@problemidstrue
\DeclareOption{noproblemids}{\@problemidsfalse}

\newif\if@samplenumbers\@samplenumberstrue
\DeclareOption{nosamplenumbers}{\@samplenumbersfalse}

%Remover paginas em branco
%\newif\if@clearevenpages\@clearevenpagesfalse
\newif\if@clearevenpages\@clearevenpagestrue

\newif\if@autoincludesamples\@autoincludesamplestrue
\DeclareOption{noautoincludesamples}{\@autoincludesamplesfalse}

\DeclareOption{plainproblems}{
  \@footerfalse
  \@problemnumbersfalse
  \@clearevenpagesfalse
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}
\RequirePackage{float}
\RequirePackage{times}            % Font choice
\RequirePackage{amsmath}          % AMS
\RequirePackage{amssymb}          % AMS
\RequirePackage[OT2,T1]{fontenc}  % Cyrillic and standard
\RequirePackage[utf8]{inputenc}   % UTF-8 support
\RequirePackage{fancyhdr, lastpage}         % Headers
\RequirePackage{graphicx}         % Graphics
\RequirePackage{subfigure}        % Subfigures
\RequirePackage{wrapfig}          % Illustrations
\RequirePackage{import}           % Proper file inclusion
\RequirePackage{fancyvrb}         % 
\RequirePackage{listingsutf8}         % For samples
\RequirePackage[left=1in,right=1in,top=0.75in,bottom=0.75in]{geometry}
%\RequirePackage{fullpage}         % Set up margins for full page
\RequirePackage{url}              % Urls
\RequirePackage[normalem]{ulem}   % \sout
\RequirePackage[urlcolor=black,colorlinks=true,implicit=false]{hyperref}
\ifplastex\else
\RequirePackage{pgffor}
\fi

%% Comandos usados para definir o nome, logo etc. da competição
\newcommand*{\contestname}[1]{\def\@contestname{#1}}
\newcommand*{\contestshortname}[1]{\def\@contestshortname{#1}}
\newcommand*{\contestlogo}[1]{\def\@contestlogo{#1}}
\newcommand*{\location}[1]{\def\@location{#1}}
\newcommand*{\licenseblurb}[1]{\def\@licenseblurb{#1}}
\newcommand*{\problemlanguage}[1]{\def\@problemlanguage{#1}}
\contestname{}
\contestshortname{}
\contestlogo{}
\location{}
\licenseblurb{}
\problemlanguage{}

% Comando usado para definir o logo do cabeçalho
\newsavebox{\PS@headerbox}
\savebox{\PS@headerbox}{}
\addtolength{\headheight}{0.25in}
\addtolength{\textheight}{-0.25in}
\setlength{\headsep}{12pt}
\newcommand*{\headerlogo}[1]{
  \def\@headerlogo{#1}
  \savebox{\PS@headerbox}{\includegraphics[width=0.15\textwidth]{\@headerlogo}}
  \addtolength{\textheight}{\headheight}
  \settoheight{\headheight}{\usebox{\PS@headerbox}}
  \addtolength{\headheight}{4.2pt}
  \addtolength{\textheight}{-\headheight}
}

\renewcommand\section{\@startsection{section}{1}{\z@}%
                                   {-3ex}%
                                   {1ex}%
                                   {\normalfont\large\sf\bfseries}}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.55ex}%
                                     {1.7ex}%
                                     {\normalfont\normalsize\sf\bfseries}}


\newcommand{\illustration}[3]{
  \begin{wrapfigure}{r}{#1\textwidth}
    \includegraphics[width=#1\textwidth]{#2}
    \begin{flushright}
      \vspace{-9pt}
      \tiny #3
    \end{flushright}
    \vspace{-15pt}
  \end{wrapfigure}
  \par
  \noindent
}

%% Redefinir cleardoublepage para deixar páginas pares extras em branco
\newcommand{\makeemptypage}{
  ~\thispagestyle{empty}
  \vfill
  \centerline{\Large \textsf{Esta página foi propositadamente deixada em branco.}}
  \vfill
  \clearpage
}

\renewcommand{\cleardoublepage}{
  \clearpage%
  \ifodd\value{page}\else\makeemptypage\fi%
}

\newcommand{\clearproblemsetpage}{
  \if@clearevenpages
  \cleardoublepage
  \else
  \clearpage
  \fi
}


%% Define um contador de problemas e nomes de A a Z
\newcounter{problemcount}
\setcounter{problemcount}{0}
\newcommand{\problemnumber}{\Alph{problemcount}}

%% Numera figuras como A.1, A.2 etc.
\ifplastex\else
\if@problemnumbers
\renewcommand{\thefigure}{\problemnumber.\arabic{figure}}
\fi
\fi


%% Comando para iniciar um novo problema

%% Inclusão de problema
\newcommand{\includeproblem}[1]{
  \startproblem{#1}
  \import{#1/}{problema\@problemlanguage.tex}

  %% Automaticamente inclui código de exemplo 1..9, se habilitado
  \ifplastex\else
  \if@autoincludesamples
  \foreach \SampleNum in {1,...,50} {
    \IfFileExists{\@problemid/\SampleNum_in.txt}{
      \displaysample{\@problemid/\SampleNum}
    }
  }
  \fi
  \fi
}

%% Inclusão de problema
\newcommand{\enincludeproblem}[1]{
  \startproblem{#1}
  \import{#1/}{problema\@problemlanguage.tex}

  %% Automaticamente inclui código de exemplo 1..9, se habilitado
  \ifplastex\else
  \if@autoincludesamples
  \foreach \SampleNum in {1,...,50} {
    \IfFileExists{\@problemid/\SampleNum_in.txt}{
      \displaysampleen{\@problemid/\SampleNum}
    }
  }
  \fi
  \fi
}

\newcommand{\startproblem}[1]{
  \clearproblemsetpage
  \refstepcounter{problemcount}
  \setcounter{samplenum}{0}
  \setcounter{figure}{0}%
  \def\@problemid{#1}
}

\newcommand{\problema}[2]{
  \def\@problema{#1}
  \def\@autor{#2}
  \problemheader{\@problema}{\@problemid}{\@autor}
}

\newcommand{\problem}[2]{
  \def\@problem{#1}
  \def\@author{#2}
  \enproblemheader{\@problem}{\@problemid}{\@author}
}

\newcommand{\ps@formattime}[1]{
  #1\ifnum#1=1 second \else seconds \fi
}

\newcommand{\problemheader}[3]{
  \addcontentsline{toc}{section}{\if@problemnumbers {\problemnumber \qquad}\fi #1}
  \begin{center}
    \textsf{
      \if@problemnumbers {\Large Problema \problemnumber\\[3mm]}  \fi
      {\LARGE \textbf{#1}}
      \if@problemids {\\[2mm]{\textit{Arquivo fonte:} #2.\{ c | cpp | java | py \} \\ }} \fi
	  {\small \textit{Autor:} #3}
      \IfFileExists{#2/.timelimit}{
        \newread\ps@timelimitfile
        \openin\ps@timelimitfile=#2/.timelimit
        \read\ps@timelimitfile to\ps@timelimit
        \\[2mm]{\Large Time limit:\ps@formattime{\ps@timelimit}}
      }{}
      \\[5mm]
    }
  \end{center}
}

\newcommand{\enproblemheader}[3]{
  \addcontentsline{toc}{section}{\if@problemnumbers {\problemnumber \qquad}\fi #1}
  \begin{center}
    \textsf{
      \if@problemnumbers {\Large Problem \problemnumber\\[3mm]}  \fi
      {\LARGE \textbf{#1}}
      \if@problemids {\\[2mm]{\textit{Source file:} #2.\{ c | cpp | java | py \} \\ }} \fi
	  {\small \textit{Author:} #3}
      \IfFileExists{#2/.timelimit}{
        \newread\ps@timelimitfile
        \openin\ps@timelimitfile=#2/.timelimit
        \read\ps@timelimitfile to\ps@timelimit
        \\[2mm]{\Large Time limit:\ps@formattime{\ps@timelimit}}
      }{}
      \\[5mm]
    }
  \end{center}
}

%% Comandos relacionados a exemplos extras

\newcommand{\sampleinputname}{Exemplo de Entrada}
\newcommand{\sampleoutputname}{Exemplo de Saída}

\newcommand{\ensampleinputname}{Example of Input}
\newcommand{\ensampleoutputname}{Example of Output}

%% Contador de exemplos
\newcounter{samplenum}
\newcommand{\sampleid}{\arabic{samplenum}}

\newcommand{\includesample}[1]{
  \displaysample{\@problemid/exemplo/#1}
}

\newcommand{\enincludesample}[1]{
  \displaysampleen{\@problemid/exemplo/#1}
}

\newcommand{\displaysample}[1]{
  \IfFileExists{#1_in.txt}{}{\ClassError{problemset}{Can't find file '#1_in.txt'}{}}
  \IfFileExists{#1_out.txt}{}{\ClassError{problemset}{Can't find file '#1_out.txt'}{}}
  \refstepcounter{samplenum}
  \vspace{0.4cm}
  \sampletable
      {\sampleinputname{} \if@samplenumbers\sampleid\fi}{#1_in.txt}
      {\sampleoutputname{} \if@samplenumbers\sampleid\fi}{#1_out.txt}
}

\newcommand{\displaysampleen}[1]{
  \IfFileExists{#1_in.txt}{}{\ClassError{problemset}{Can't find file '#1_in.txt'}{}}
  \IfFileExists{#1_out.txt}{}{\ClassError{problemset}{Can't find file '#1_out.txt'}{}}
  \refstepcounter{samplenum}
  \vspace{0.4cm}
  \sampletable
      {\ensampleinputname{} \if@samplenumbers\sampleid\fi}{#1_in.txt}
      {\ensampleoutputname{} \if@samplenumbers\sampleid\fi}{#1_out.txt}
}

\newlength{\PS@sampleidealwidth}
\setlength{\PS@sampleidealwidth}{0.473\textwidth}
\newsavebox{\PS@sampleinbox}
\newsavebox{\PS@sampleoutbox}
\newlength{\PS@sampleinwidth}
\newlength{\PS@sampleoutwidth}
\newlength{\PS@sampletotwidth}

\newcommand{\sampletable}[4]{
  % First find widths of the two files
  \savebox{\PS@sampleinbox}{\lstinputlisting[inputencoding=utf8/latin1,basicstyle=\ttfamily]{#2}}
  \savebox{\PS@sampleoutbox}{\lstinputlisting[inputencoding=utf8/latin1,basicstyle=\ttfamily]{#4}}
  \settowidth{\PS@sampleoutwidth}{\usebox{\PS@sampleoutbox}}
  \settowidth{\PS@sampleinwidth}{\usebox{\PS@sampleinbox}}
  \setlength{\PS@sampletotwidth}{\PS@sampleinwidth}
  \addtolength{\PS@sampletotwidth}{\PS@sampleoutwidth}
  % Check if too wide for side-by-side
  \ifdim\PS@sampletotwidth>2\PS@sampleidealwidth
    \par
    \noindent
    \begin{tabular}{|l|}
      \multicolumn{1}{l}{\textsf{\textbf{#1}}}\\
      \hline
      \parbox[t]{0.968\textwidth}{\vspace{-0.3cm}\usebox{\PS@sampleinbox}}\\
      \hline
    \end{tabular}
    \par
    \vspace{0.25cm}
    \noindent
    \begin{tabular}{|l|}
      \multicolumn{1}{l}{\textsf{\textbf{#3}}}\\
      \hline
      \parbox[t]{0.968\textwidth}{\vspace{-0.3cm}\usebox{\PS@sampleoutbox}}\\
      \hline
    \end{tabular}
  \else
  % Side by side possible, figure out if adjustments are needed.
    \ifdim\PS@sampleoutwidth>\PS@sampleidealwidth% Sample out too large
      \setlength{\PS@sampleinwidth}{2\PS@sampleidealwidth}
      \addtolength{\PS@sampleinwidth}{-\PS@sampleoutwidth}
    \else
      \ifdim\PS@sampleinwidth>\PS@sampleidealwidth% Sample in too large
         \setlength{\PS@sampleoutwidth}{2\PS@sampleidealwidth}
         \addtolength{\PS@sampleoutwidth}{-\PS@sampleinwidth}
      \else% Ideal case: neither sample in nor sammple out too large
         \setlength{\PS@sampleinwidth}{\PS@sampleidealwidth}
         \setlength{\PS@sampleoutwidth}{\PS@sampleidealwidth}
      \fi
    \fi
    \par
    \noindent
    \begin{tabular}{|l|l|}
      \multicolumn{1}{l}{\textsf{\textbf{#1}}} &
      \multicolumn{1}{l}{\textsf{\textbf{#3}}} \\
      \hline
      \parbox[t]{\PS@sampleinwidth}{\vspace{-0.3cm}\usebox{\PS@sampleinbox}}
      &
      \parbox[t]{\PS@sampleoutwidth}{\vspace{-0.3cm}\usebox{\PS@sampleoutbox}}
      \\
      \hline
    \end{tabular}
  \fi
  \par
}

% Remaining part of file is headers, not tested with plasTeX
% and should not be used in plastex mode
\ifplastex\else

\AtBeginDocument{
  %% Set up headers
  \fancypagestyle{problem}{
    \fancyhf{} % Clear old junk
    \fancyhead[C]{\ifnum\value{page}>2\usebox{\PS@headerbox}\else\fi}
    \if@footer
    \fancyfoot[L]{
      \emph{
        \ifnum\value{page}>2\@contestshortname{}\else\fi
	\ifdefined\@problem
          \unless\ifdefined\@problema
            \if@problemnumbers Problem \problemnumber:{} \fi
            \@problem
          \fi
	\fi
	\ifdefined\@problema
          \if@problemnumbers Problema \problemnumber:{} \fi
          \@problema
	\fi
        \ifx\@licenseblurb\@empty\relax\else
        \\\@licenseblurb
        \fi
      }
    }
    \fancyfoot[R]{
      \emph{
       \ifnum\value{page}>2\it{\thepage}\else\fi
      }
    }
    \fi
  }
  \renewcommand{\headrulewidth}{0pt}
  \pagestyle{problem}

}

\fi
