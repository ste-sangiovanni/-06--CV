\ProvidesClass{cv}[2024/11/20 v1.0 Customized CV class]

\LoadClass[10pt,a4paper]{article} 

% Packages
\usepackage[parfill]{parskip} 
\usepackage{array}
\usepackage{ifthen}
\usepackage{hyperref}
\usepackage{graphicx} 
\usepackage[dvipsnames]{xcolor} 
\usepackage{tabularx}
\usepackage{fontawesome} 

% Define custom colors
%\definecolor{RoyalPurple}{rgb}{0.47, 0.32, 0.66}

\definecolor{RoyalPurple}{rgb}{0.0, 0.0, 1.0} % Pure blue

% Set hyperlink appearance
\hypersetup{
    colorlinks=true,
    linkcolor=RoyalPurple,
    urlcolor=RoyalPurple,
    pdftitle={Stefano Sangiovanni CV},
    pdfauthor={Stefano Sangiovanni}
}

\pagestyle{empty}

% Header customization
\def\namesize{\Large} 
\def\addressskip{\smallskip}
\def\nameskip{\bigskip}

% Header content definition
\newcommand{\printheader}{
  \begin{center}
    \textbf{\namesize\@name}\\
    \smallskip
    \@role \hspace{0.04em} \textbullet \hspace{0.04em} \@location \\ 
    \faEnvelope \hspace{0.3em} \href{mailto:\@mailto}{\@mailto} \hspace{0.04em} \textbullet \hspace{0.04em} % Dot separator
    \faGithub \hspace{0.3em} \href{\@github}{Github} \hspace{0.04em} \textbullet \hspace{0.04em} % Dot separator
    Updated: \today
  \end{center}
\vspace{0.3em}
}

% Header fields definitions
\def\name#1{\def\@name{#1}}
\def\location#1{\def\@location{#1}}
\def\mailto#1{\def\@mailto{#1}}
\def\github#1{\def\@github{#1}}
\def\role#1{\def\@role{#1}}

% Automatically insert header when document begins
\let\ori@document=\document
\renewcommand{\document}{
  \ori@document
  \printheader
}

% Command for section subtitles 
\newcommand{\subtitle}[1]{%
  \noindent  \textcolor{RoyalPurple}{\textbf{#1}} \noindent
}

% Section formatting
\newenvironment{rSection}[1]{
  \vspace{0.5em}
  \noindent \textcolor{RoyalPurple}{\textbf{\MakeUppercase{#1}}} \\[-0.3em]
  \hrule\vspace{0.5em}
  \begin{list}{}{\setlength{\leftmargin}{1.5em}}
  \item[]
}{
  \end{list}
  \vspace{0.4em}
}

% General subsection formatting
\newenvironment{rSubsection}[4]{
  \textbf{#1} \hfill {#2} \\
  \textit{#3} \hfill \textit{#4} 
  \begin{list}{$\cdot$}{\leftmargin=1em \itemsep=-0.5em}
}{
  \end{list}
  \vspace{0.2em}
}

% Training subsection environment
\newenvironment{rTrainingSubsection}[3]{
  \noindent \textbf{#1} \hfill {#2} \\
  \noindent {#3}
}{
  \vspace{0.2em}
}

% environment for Teaching Section 
\newenvironment{rTeachingSection}[3]{
  \noindent \textbf{#1} \hfill {#2} \\ 
  \noindent \textit{#3} 
}

% Environment presentations 
\newenvironment{rPresSection}[2]{
  \noindent
  \begin{tabularx}{\textwidth}{@{}lX@{}} 
    \textbf{#1} & #2 \\ 
  \end{tabularx}
}

% Env for working papers
\newenvironment{rWPSection}[1]{
  \noindent {#1}
}

% Environment for professional experience
\newenvironment{rExperienceSection}[3]{
  \noindent \textbf{#1} \hfill \textit{#2} \\ 
  \noindent \textit{#3} \\ 
}{
  \vspace{0.4em} 
}


% Skill table formatting
\newenvironment{skillsTable}{
  \begin{tabular}{ @{} >{\bfseries}l @{\hspace{6ex}} l }
}{
  \end{tabular}
}

% Footer
\newcommand{\footer}[1]{
  \vfill
  \begin{center}
    \small #1
  \end{center}
}

\endinput
