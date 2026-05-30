%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Academic CV class
% Customized for Stefano Sangiovanni
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{cv}[2026/05/28 v2.1 Academic CV class]

\LoadClass[10pt,a4paper]{article}

%----------------------------------------------------------------------------------------
% PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[
  left=0.55in,
  right=0.55in,
  top=0.55in,
  bottom=0.55in
]{geometry}

\RequirePackage[parfill]{parskip}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{fontawesome5}
\RequirePackage{ifthen}

%----------------------------------------------------------------------------------------
% COLORS
%----------------------------------------------------------------------------------------

\definecolor{CVAccent}{HTML}{2B2D8F}
\definecolor{CVText}{HTML}{111111}
\definecolor{CVGray}{HTML}{555555}

%----------------------------------------------------------------------------------------
% GENERAL STYLE
%----------------------------------------------------------------------------------------

\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.25em}
\renewcommand{\arraystretch}{1.05}

\hypersetup{
    colorlinks=true,
    linkcolor=CVAccent,
    urlcolor=CVAccent,
    citecolor=CVAccent,
    pdftitle={Stefano Sangiovanni CV},
    pdfauthor={Stefano Sangiovanni}
}

%----------------------------------------------------------------------------------------
% HEADER FIELDS
%----------------------------------------------------------------------------------------

\def\name#1{\def\@name{#1}}
\def\role#1{\def\@role{#1}}
\def\location#1{\def\@location{#1}}
\def\mailto#1{\def\@mailto{#1}}
\def\website#1{\def\@website{#1}}
\def\websitetext#1{\def\@websitetext{#1}}
\def\linkedin#1{\def\@linkedin{#1}}
\def\linkedintext#1{\def\@linkedintext{#1}}

% Defaults
\def\@websitetext{Website}
\def\@linkedintext{LinkedIn}

%----------------------------------------------------------------------------------------
% HEADER
%----------------------------------------------------------------------------------------

\newcommand{\printheader}{
  \begin{center}
    {\LARGE \textbf{\@name}}\\[0.25em]
    {\normalsize \@role}\hspace{0.35em}\textbullet\hspace{0.35em}\@location\\[0.25em]
    {\small
      \faEnvelope\hspace{0.25em}\href{mailto:\@mailto}{\@mailto}
      \hspace{0.35em}\textbullet\hspace{0.35em}
      \faGlobe\hspace{0.25em}\href{\@website}{\@websitetext}
      \hspace{0.35em}\textbullet\hspace{0.35em}
      \faLinkedin\hspace{0.25em}\href{\@linkedin}{\@linkedintext}
    }\\[0.15em]
    {\footnotesize \textcolor{CVGray}{Updated: \today}}
  \end{center}
  \vspace{0.45em}
}

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document
  \printheader
}

%----------------------------------------------------------------------------------------
% SECTION FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSection}[1]{
  \vspace{0.15em}
  \noindent
  {\large\textcolor{CVAccent}{\textbf{#1}}}
  \par\vspace{-0.75em}
  \noindent\textcolor{CVAccent}{\rule{\textwidth}{0.5pt}}
  \par\vspace{0.25em}
}{
  \vspace{0.35em}
}

\newcommand{\subtitle}[1]{%
  \par\vspace{0.25em}%
  \noindent{\textcolor{CVAccent}{\textbf{\small #1}}}%
  \par\vspace{0.05em}%
}

%----------------------------------------------------------------------------------------
% INTERNAL ENTRY HELPERS
%----------------------------------------------------------------------------------------

\newcommand{\cvTwoCol}[2]{%
  \noindent
  \begin{minipage}[t]{0.72\textwidth}
    #1
  \end{minipage}%
  \hfill
  \begin{minipage}[t]{0.25\textwidth}
    \raggedleft #2
  \end{minipage}
  \par
}

\newcommand{\cvDateCol}[2]{%
  \noindent
  \begin{minipage}[t]{5.8em}
    \textbf{#1}
  \end{minipage}%
  \hspace{0.5em}
  \begin{minipage}[t]{\dimexpr\textwidth-6.3em\relax}
    #2
  \end{minipage}
  \par
}

\newcommand{\cvYearCol}[2]{%
  \noindent
  \begin{minipage}[t]{3.2em}
    \textbf{#1}
  \end{minipage}%
  \hspace{0.5em}
  \begin{minipage}[t]{\dimexpr\textwidth-3.7em\relax}
    #2
  \end{minipage}
  \par
}

%----------------------------------------------------------------------------------------
% ENTRY ENVIRONMENTS
%----------------------------------------------------------------------------------------

% Main entry with bullet points
\newenvironment{cvEntry}[4]{
  \cvTwoCol{\textbf{#1}}{#2}
  \cvTwoCol{\textit{#3}}{\textit{#4}}
  \vspace{-0.45em}
  \begin{itemize}[
    leftmargin=1.2em,
    itemsep=0.05em,
    parsep=0em,
    topsep=0.15em
  ]
}{
  \end{itemize}
  \vspace{0.25em}
}

% Main entry with plain description, no bullets
\newenvironment{cvEntryNoBullets}[4]{
  \cvTwoCol{\textbf{#1}}{#2}
  \cvTwoCol{\textit{#3}}{\textit{#4}}
  \vspace{-0.15em}
}{
  \normalsize
  \par\vspace{0.3em}
}

% Simple two-line entry without bullet points
\newenvironment{cvSimpleEntry}[4]{
  \cvTwoCol{\textbf{#1}}{#2}
  \cvTwoCol{\textit{#3}}{\textit{#4}}
  \vspace{0.35em}
}{}

% Teaching entry with description
\newenvironment{teachingEntry}[4]{
  \cvTwoCol{\textbf{#1}}{#2}
  \cvTwoCol{#3}{\textit{#4}}
  \vspace{-0.15em}
  \small
}{
  \normalsize
  \par\vspace{0.3em}
}

% Publication / manuscript entry, no indent
\newenvironment{pubEntry}{
  \par\vspace{0.12em}%
  \begingroup
  \setlength{\parindent}{0pt}%
  \setlength{\leftskip}{0pt}%
  \noindent\ignorespaces
}{
  \unskip\par
  \endgroup
  \vspace{0.12em}%
}

% Presentation entry
\newenvironment{presentationEntry}[2]{
  \cvYearCol{#1}{#2}
  \vspace{0.55em}
}{}

% Dated entry: awards, memberships, short items
\newenvironment{datedEntry}[2]{
  \cvDateCol{#1}{#2}
  \vspace{0.15em}
}{}

% Training entry
\newenvironment{trainingEntry}[3]{
  \noindent
  \begin{minipage}[t]{\dimexpr\textwidth-3.4cm\relax}
    \raggedright\textbf{#1}
  \end{minipage}%
  \hfill
  \begin{minipage}[t]{3.0cm}
    \raggedleft #2
  \end{minipage}
  \par\vspace{0.05em}
  {\small #3}
  \par\vspace{0.45em}
}{}

% Professional experience entry
\newenvironment{experienceEntry}[3]{
  \cvTwoCol{\textbf{#1}}{#2}
  \textit{#3}
  \par\vspace{-0.15em}
  \small
}{
  \normalsize
  \par\vspace{0.35em}
}

% Skills table
\newenvironment{skillsTable}{
  \begin{tabular}{@{}>{\bfseries}p{5.2cm}p{\dimexpr\textwidth-2.2cm\relax}@{}}
}{
  \end{tabular}
}

% Academic references
\newenvironment{referenceEntry}[5]{
  \noindent
  \begin{minipage}[t]{0.25\textwidth}
    \raggedleft\textbf{#1}
  \end{minipage}%
  \hspace{0.45em}%
  \begin{minipage}[t]{1.2em}
    \centering
    \vspace{#5}
    {\small\textcolor{CVGray}{\faIcon{university}}}\\[0.15em]
    {\small\textcolor{CVGray}{\faIcon{envelope}}}
  \end{minipage}%
  \hspace{0.55em}%
  {\color{CVGray}\vrule width 0.4pt}%
  \hspace{0.8em}%
  \begin{minipage}[t]{0.62\textwidth}
    #2\\
    #3\\
    \href{mailto:#4}{#4}
  \end{minipage}
  \par\vspace{0.95em}
}{}

\endinput