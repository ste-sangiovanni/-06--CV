\ProvidesClass{cv}[2024/11/20 v1.0 Customized CV class]

\LoadClass[10pt,a4paper]{article} % Set font size and paper type

% Packages
\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array}
\usepackage{ifthen}
\usepackage{hyperref}
\usepackage{graphicx} % For GitHub logo
\usepackage[dvipsnames]{xcolor} % Allow colors including RoyalPurple
\usepackage{tabularx}
\usepackage{fontawesome} % For FontAwesome icons (optional)

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

% Page style
\pagestyle{empty}

% Header customization
\def\namesize{\Large} % Name size
\def\addressskip{\smallskip}
\def\nameskip{\bigskip}

% Header content definition
\newcommand{\printheader}{
  \begin{center}
    \textbf{\namesize\@name}\\
    \smallskip
    \@location \\
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

% New environment for Teaching Section (Guest Lectures + Tutoring without bullet points)
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

\newenvironment{rWPSection}[1]{
  \noindent {#1}
}

% Environment for professional experience
\newenvironment{rExperienceSection}[3]{
  \noindent \textbf{#1} \hfill \textit{#2} \\ % Role and dates
  \noindent \textit{#3} \\ % Organization or additional details
}{
  \vspace{0.4em} % Space after each entry
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
