% Latex Class for a Report
% by Remon van Gaalen

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Report}

% Options
\DeclareOption{coverpage}{\def\@coverpage}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

% Font
\RequirePackage[sfdefault, light]{inter}
\renewcommand{\bfseries}{\intermedium}
\def\lighttitlestyle{\interextralight}

% Core Packages
\RequirePackage{comment}
\RequirePackage[a4paper, margin=0.75in]{geometry}
\RequirePackage[pdfusetitle,hidelinks]{hyperref}
\RequirePackage{todonotes}
\RequirePackage[dvipsnames, table]{xcolor}

% Additional Symbols
\RequirePackage{amsmath, amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage[scaled=1.1, cmintegrals]{newtxsf}
\RequirePackage{textcomp}
\RequirePackage{xspace}

% Figures and Tables
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage[margin=0cm,font={color=template_text,small,sl},labelfont={color=template_text,bf,sl},tableposition=top,singlelinecheck=false,hypcap]{caption}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{pdfpages}
\RequirePackage{siunitx}
\RequirePackage[labelfont={color=template_text,bf},textfont=it,singlelinecheck=false, font={color=template_text,footnotesize},justification=raggedright]{subcaption}
\RequirePackage{tabularx}

% Other
\RequirePackage{appendix}
\RequirePackage{datetime}
\RequirePackage{listings, color}
\RequirePackage{natbib}

% Backend
\RequirePackage[export]{adjustbox}
\RequirePackage[noabbrev,nameinlink,]{cleveref}
\RequirePackage{emptypage}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{fancyvrb}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\RequirePackage{tikz}
\RequirePackage{wrapfig}
\RequirePackage{xpatch}



\newcommand*\subtitle[1]{\def\@subtitle{#1}}
\newcommand*\affiliation[1]{\def\@affiliation{#1}}
\newcommand*\logo[1]{\def\@logo{#1}}
\newcommand*\address[1]{\def\@address{#1}}
\newcommand*\authorEmail[1]{\def\@authorEmail{#1}}

\definecolor{blue}{HTML}{003473}
\definecolor{text_color}{HTML}{434655}
\definecolor{lightgrey}{HTML}{A8AABC}

\hypersetup{colorlinks, allcolors=., linkcolor=., citecolor=., urlcolor=.}
\setlength{\parindent}{0cm} % turn off indenting

\renewcommand{\maketitle}{
  \thispagestyle{empty}
  \begin{center}
    \lighttitlestyle\fontsize{25}{35}\color{blue}\selectfont\@title \\
    \ifdefvoid{\@subtitle}{}{\lighttitlestyle\fontsize{22}{24}\color{lightgrey}\selectfont\@subtitle \\}

    \vspace{2cm}

    \lighttitlestyle\fontsize{16}{20}\color{blue}\selectfont\@author \\
    \lighttitlestyle\fontsize{12}{16}\color{text_color}\selectfont\@affiliation \\
    \lighttitlestyle\fontsize{12}{16}\color{text_color}\selectfont\@authorEmail \\

    \vspace{1cm}
    
    \ifdefvoid{\@logo}{}{
    \begin{tikzpicture}[remember picture, overlay]
    \node[above=8mm] at (current page.south) {
      \includegraphics[width=0.5\linewidth]{\@logo}
    };
    \end{tikzpicture}
    }

    \ifdefvoid{\@address}{}{
      \begin{tikzpicture}[remember picture, overlay]
        \node[above=10mm] at (current page.south) {
          \lighttitlestyle\fontsize{10}{12}\color{lightgrey}\selectfont\@address
        }
      \end{tikzpicture}
    }

  \end{center}

  \ifdefvoid{\@coverpage}{}{\newpage}
}

% Setup Headers
\if@twoside
  \fancyhf{}
  \fancyhead[LE,RO]{\thepage}
  \fancyhead[RE]{\nouppercase{\leftmark}}
  \fancyhead[RO]{\nouppercase{\rightmark}}
\else
  \fancyhf{}
  \fancyhead[R]{\thepage}
  \fancyhead[L]{\nouppercase{\rightmark}}
\fi

\fancypagestyle{plain}{
  \fancyhead{}
  \fancyfoot[R]{\thepage}
}
\pagestyle{fancy}


% Avoid errors in bibliography by defining commands such as \aap
% Copied from AASTEX package
\makeatletter

\let\jnl@style=\sf

\def\ref@jnl#1{{\jnl@style#1}}% 
\newcommand\aj{\ref@jnl{AJ }}%          % Astronomical Journal 
\newcommand\araa{\ref@jnl{ARA\&A }}%    % Annual Review of Astron and Astrophys 
\newcommand\apj{\ref@jnl{ApJ }}%        % Astrophysical Journal 
\newcommand\apjl{\ref@jnl{ApJL }}       % Astrophysical Journal, Letters 
\newcommand\apjs{\ref@jnl{ApJS }}%      % Astrophysical Journal, Supplement 
\newcommand\ao{\ref@jnl{ApOpt }}%       % Applied Optics 
\newcommand\apss{\ref@jnl{Ap\&SS }}%    % Astrophysics and Space Science 
\newcommand\aap{\ref@jnl{A\&A }}%       % Astronomy and Astrophysics 
\newcommand\aapr{\ref@jnl{A\&A~Rv }}%   % Astronomy and Astrophysics Reviews 
\newcommand\aaps{\ref@jnl{A\&AS }}%     % Astronomy and Astrophysics, Supplement 
\newcommand\azh{\ref@jnl{AZh }}%        % Astronomicheskii Zhurnal 
\newcommand\baas{\ref@jnl{BAAS }}%      % Bulletin of the AAS 
\newcommand\icarus{\ref@jnl{Icarus }}%  % Icarus
\newcommand\jaavso{\ref@jnl{JAAVSO }}   % The Journal of the American Association of Variable Star Observers
\newcommand\jrasc{\ref@jnl{JRASC }}%    % Journal of the RAS of Canada 
\newcommand\memras{\ref@jnl{MmRAS }}%   % Memoirs of the RAS 
\newcommand\mnras{\ref@jnl{MNRAS }}%    % Monthly Notices of the RAS 
\newcommand\pra{\ref@jnl{PhRvA }}%      % Physical Review A: General Physics 
\newcommand\prb{\ref@jnl{PhRvB }}%      % Physical Review B: Solid State 
\newcommand\prc{\ref@jnl{PhRvC }}%      % Physical Review C 
\newcommand\prd{\ref@jnl{PhRvD }}%      % Physical Review D 
\newcommand\pre{\ref@jnl{PhRvE }}%      % Physical Review E 
\newcommand\prl{\ref@jnl{PhRvL }}%      % Physical Review Letters 
\newcommand\pasp{\ref@jnl{PASP }}%      % Publications of the ASP 
\newcommand\pasj{\ref@jnl{PASJ }}%      % Publications of the ASJ 
\newcommand\qjras{\ref@jnl{QJRAS }}%    % Quarterly Journal of the RAS 
\newcommand\skytel{\ref@jnl{S\&T }}%    % Sky and Telescope 
\newcommand\solphys{\ref@jnl{SoPh }}%   % Solar Physics 
\newcommand\sovast{\ref@jnl{Soviet~Ast. }}% % Soviet Astronomy 
\newcommand\ssr{\ref@jnl{SSRv }}%       % Space Science Reviews 
\newcommand\zap{\ref@jnl{ZA }}%         % Zeitschrift fuer Astrophysik 
\newcommand\nat{\ref@jnl{Nature }}%     % Nature 
\newcommand\iaucirc{\ref@jnl{IAUC }}%   % IAU Cirulars 
\newcommand\aplett{\ref@jnl{Astrophys.~Lett. }}% % Astrophysics Letters 
\newcommand\apspr{\ref@jnl{Astrophys.~Space~Phys.~Res. }}% % Astrophysics Space Physics Research 
\newcommand\bain{\ref@jnl{BAN }}%       % Bulletin Astronomical Institute of the Netherlands 
\newcommand\fcp{\ref@jnl{FCPh }}%       % Fundamental Cosmic Physics 
\newcommand\gca{\ref@jnl{GeoCoA }}%     % Geochimica Cosmochimica Acta 
\newcommand\grl{\ref@jnl{Geophys.~Res.~Lett. }}% % Geophysics Research Letters 
\newcommand\jcp{\ref@jnl{JChPh }}%      % Journal of Chemical Physics 
\newcommand\jgr{\ref@jnl{J.~Geophys.~Res. }}% % Journal of Geophysics Research 
\newcommand\jqsrt{\ref@jnl{JQSRT }}%    % Journal of Quantitiative Spectroscopy and Radiative Trasfer 
\newcommand\memsai{\ref@jnl{MmSAI }}%   % Mem. Societa Astronomica Italiana 
\newcommand\nphysa{\ref@jnl{NuPhA }}%   % Nuclear Physics A 
\newcommand\physrep{\ref@jnl{PhR }}%    % Physics Reports 
\newcommand\physscr{\ref@jnl{PhyS }}%   % Physica Scripta 
\newcommand\planss{\ref@jnl{Planet.~Space~Sci. }}% % Planetary Space Science 
\newcommand\procspie{\ref@jnl{Proc.~SPIE }}% % Proceedings of the SPIE 

\newcommand\actaa{\ref@jnl{AcA }}%      % Acta Astronomica
\newcommand\caa{\ref@jnl{ChA\&A }}%     % Chinese Astronomy and Astrophysics
\newcommand\cjaa{\ref@jnl{ChJA\&A }}%   % Chinese Journal of Astronomy and Astrophysics
\newcommand\jcap{\ref@jnl{JCAP }}%      % Journal of Cosmology and Astroparticle Physics
\newcommand\na{\ref@jnl{NewA }}%        % New Astronomy
\newcommand\nar{\ref@jnl{NewAR }}%      % New Astronomy Review
\newcommand\pasa{\ref@jnl{PASA }}%      % Publications of the Astron. Soc. of Australia
\newcommand\rmxaa{\ref@jnl{RMxAA }}%    % Revista Mexicana de Astronomia y Astrofisica

%% added feb 9, 2016
\newcommand\maps{\ref@jnl{M\&PS }}%     % Meteoritics and Planetary Science
\newcommand\aas{\ref@jnl{AAS Meeting Abstracts }}% % American Astronomical Society Meeting Abstracts
\newcommand\dps{\ref@jnl{AAS/DPS Meeting Abstracts }}% % American Astronomical Society/Division for Planetary Sciences Meeting Abstracts
\let\astap=\aap 
\let\apjlett=\apjl 
\let\apjsupp=\apjs 
\let\applopt=\ao 

\makeatother
