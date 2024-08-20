% Latex Style for a Formal Letter
% by Remon van Gaalen (@vgaalen)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Letter}[2024/07/15 v0.1]

\DeclareOption{stackingAddress}{\def\@stackingAddress}
%\DeclareOption{timestamp}{\def\@timestamp}
\DeclareOption{rightGreeting}{\def\@rightGreeting}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
%\LoadClass[notitlepage]{article}
%\LoadClass{article}
\LoadClass{minimal}

\RequirePackage[a4paper, margin=0.75in]{geometry}
%\geometry{a4paper, margin=0.75in}

\RequirePackage{hyperref}
\RequirePackage{comment}
\RequirePackage{todonotes}
\RequirePackage[dvipsnames, table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{datetime}
\RequirePackage{tcolorbox}
\RequirePackage{ragged2e}
\RequirePackage{fontawesome5}
\RequirePackage{etoolbox}

% Set the font
\RequirePackage[sfdefault, light]{inter}
\RequirePackage[T1]{fontenc}

\newcommand*\authorName[1]{\def\@authorName{#1}}
\newcommand*\authorAddress[1]{\def\@authorAddress{#1}}
%\newcommand*\authorStreet[1]{\def\@authorStreet{#1}}
%\newcommand*\authorCity[1]{\def\@authorCity{#1}}
%\newcommand*\authorCountry[1]{\def\@authorCity{#1}}
\newcommand*\authorTel[1]{\def\@authorTel{#1}}
\newcommand*\authorEmail[1]{\def\@authorEmail{#1}}

\newcommand*\recipientName[1]{\def\@recipientName{#1}}
\newcommand*\recipientAddress[1]{\def\@recipientAddress{#1}}

\newcommand*\closing[1]{\def\@closing{#1}}

\newcommand*{\makeopening}{%
    \ifdefvoid{\@stackingAddress}{
      \begin{minipage}[t]{8.6cm}
        \begin{flushleft}
        \RaggedRight
        \@recipientName \\
        \ifdefvoid{\@recipientAddress}{}{\@recipientAddress \vspace{0.25cm} \\} 
        %\ifdefvoid{\@title}{}{\@title \vspace{0.25cm} \\}
        \justifying
        \end{flushleft}
        \vspace{0.25cm}
      \end{minipage}
      \begin{minipage}[t]{8.6cm}
        \begin{flushright}
        \RaggedLeft
        \hfill \@authorName \\
        \vspace{0.25cm}
        \ifdefvoid{\@authorAddress}{}{\hfill \@authorAddress \vspace{0.25cm} \\}
        \ifdefvoid{\@authorTel}{}{\hfill \href{tel:\@authorTel}{\faPhone \, \@authorTel} \\}
        \ifdefvoid{\@authorEmail}{}{\hfill \href{mailto:\@authorEmail}{\faEnvelope[regular] \, \@authorEmail} \\}
        \vspace{0.25cm}
        \hfill \today
        \vspace{0.5cm}
        \justifying
        \end{flushright}
      \end{minipage}
    }{
      \begin{flushright}
      \RaggedLeft
      \hfill \@authorName \\
      \ifdefvoid{\@authorAddress}{}{\hfill \@authorAddress}
      \vspace{0.25cm} \\
      \ifdefvoid{\@authorTel}{}{\hfill \href{tel:\@authorTel}{\faPhone \, \@authorTel} \\}
      \ifdefvoid{\@authorEmail}{}{\hfill \href{mailto:\@authorEmail}{\faEnvelope[regular] \, \@authorEmail}}
      \vspace{0.25cm} \\
      \hfill \today
      \justifying
      \end{flushright}

      \vspace{0.25cm}
      \@recipientName \\
      \ifdefvoid{\@recipientAddress}{}{\@recipientAddress}
      \vspace{0.25cm} \\
      %\ifdefvoid{\@title}{}{\@title \vspace{0.25cm} \\}
      \vspace{0.25cm} \\ 
    }
}

\newcommand*\makeclosing{
  \ifdefvoid{\@rightGreeting}{
    \vspace{0.5cm}
    \@closing
    \vspace{0.5cm} \\
    \noindent
    \@authorName
  }{
    \begin{flushright}
    \RaggedLeft
    \vspace{0.5cm}
    \hfill \@closing
    \vspace{0.5cm} \\
    \noindent
    \hfill \@authorName
    \end{flushright}
  }
}

% Miscellaneous Settings
\setlength{\parindent}{0cm} % turn off indenting
\pagenumbering{gobble} % turn off page numbering
