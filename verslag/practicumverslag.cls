%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                                    																	%%%
%%%   Class bestand voor practica van Numerieke Modellering en Benadering   												%%%
%%%                                                                    																	%%%
%%%                                                                    																	%%%
%%%   17 april 2016                                                  																	%%%
%%%   Versie 1.0                                                      																	%%%
%%%                                                                    																	%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{practicumverslag}[2016/04/17 v1.0 practicumverslag document class]
\def\thetitle{}
\def\thepagelimit{100}
\DeclareOption{een}{%
  \def\thetitle{Practicum 1}%
  \def\thepagelimit{15}}
\DeclareOption{twee}{%
  \def\thetitle{Practicum 2}%
  \def\thepagelimit{10}}
\ProcessOptions
\LoadClass[10pt,a4paper]{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage[dutch]{babel}
\RequirePackage[colorlinks,linkcolor=black,citecolor=black,urlcolor=black]{hyperref}
\RequirePackage{url}
\RequirePackage{color}
\RequirePackage{everypage}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\geometry{margin=3cm}

\def\members#1{\def\themembers{#1}}
\def\maketitlepage{%
  \begin{titlepage}%
    \begin{center}%
      \@makelogo%
      \vfill%
      {\Huge Numerieke Modellering en Benadering}\\[0.75cm]%
      {\huge\bf \thetitle}%
      \vfill%
      {\Large\sc \themembers\\}%
      \vspace{80mm}%
      {\large Academiejaar 2015-2016}%
    \end{center}%
  \end{titlepage}%
}
\def\@makelogo{%
  \hfil%
  \begin{minipage}{0.2\textwidth}%
    \centering%
    \includegraphics[height=\sedes@height]{sedes}%
  \end{minipage}%
  \begin{minipage}{0.7\textwidth}%
    {\huge\sf KU~Leuven}\\[10pt]%
    {\LARGE\sf Faculteit Ingenieurswetenschappen}%
  \end{minipage}%
  \hfil%
}
\def\sedes@height{3.4cm}
\def\pagelimittext{PAGE LIMIT}
\def\pagelimitfontsize{2cm}
\def\pagelimitscale{5}
\newcommand\sc@wm@inbox[1]{%
  \setbox\@tempboxa\vbox to \z@{%
    \vskip -1in \moveleft 1in \vbox{%
      \hbox to \z@{%
        #1\hss}%
    }%
    \vss%
  }
  \dp\@tempboxa\z@
  \box\@tempboxa%
}
\newcommand\sc@wm@printtext[1]{%
  \setlength{\@tempdimb}{.5\paperwidth}%
  \setlength{\@tempdimc}{-.5\paperheight}%
  \setlength{\unitlength}{1pt}%
  \put(\strip@pt\@tempdimb,\strip@pt\@tempdimc){%
    \makebox(0,0){%
      \rotatebox{45}{\scalebox{\pagelimitscale}{%
        \textcolor[gray]{0.7}%
          {\fontsize{\pagelimitfontsize}{1.2\pagelimitfontsize}\selectfont{\pagelimittext}}%
      }}%
    }%
  }%
}
\AddEverypageHook{%
  \ifnum\thepage>\thepagelimit%
    \sc@wm@inbox{\sc@wm@printtext}
  \fi
}
\def\makeappendix{%
  \appendix%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}%
}
\endinput
