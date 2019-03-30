\documentclass[cn]{elegantbook}

% pandoc版本大于1.15时需要\tightlist
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

\usepackage{ulem}
\usepackage[yyyymmdd,hhmmss]{datetime}

$if(listings)$
\newcommand{\passthrough}[1]{#1}
\lstset{
	frame=shadowbox,
	backgroundcolor=\color[rgb]{0.97,0.97,0.97},
	tabsize=4,
	breaklines=tr,
	showstringspaces=false,
}
\renewcommand{\lstlistingname}{代码}
$endif$

$if(lhs)$
\lstnewenvironment{code}{\lstset{language=Haskell,basicstyle=\small\ttfamily}}{}
$endif$

$if(highlighting-macros)$
$highlighting-macros$
$endif$
$if(verbatim-in-note)$
\usepackage{fancyvrb}
$endif$

$if(tables)$
\usepackage{longtable,booktabs}
$endif$

$if(title)$
\title{$title$}
$endif$
$if(subtitle)$
\subtitle{$subtitle$}
$endif$
$if(author)$
\author{$for(author)$$author$$sep$ \and $endfor$}
$endif$
\date{\today}

$for(header-includes)$
$header-includes$
$endfor$


$if(equote)$
\equote{$equote$}
$else$
\equote{使用pandoc-template编译}
$endif$

$if(logo)$
\logo{$logo$}
$else$
\logo{logo.png}
$endif$

$if(cover)$
\cover{$cover$}
$else$
\cover{cover.jpg}
$endif$


\begin{document}
\frontmatter

\maketitle

$if(copyright)$
\newpage
%~\vfill
\thispagestyle{empty}

\noindent Copyright \copyright\ \the\year\  $if(author)$$for(author)$$author$$sep$ \and $endfor$$endif$\\ % Copyright notice

\noindent \textsc{Published by \LaTeX}\\ % Publisher
$if(homepage)$
\noindent \textsc{$homepage$}\\ % URL
$endif$

\noindent Licensed under the Creative Commons Attribution-NonCommercial 3.0 Unported License (the ``License''). You may not use this file except in compliance with the License. You may obtain a copy of the License at \url{http://creativecommons.org/licenses/by-nc/3.0}. Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \textsc{``as is'' basis, without warranties or conditions of any kind}, either express or implied. See the License for the specific language governing permissions and limitations under the License.\\ % License information

\noindent \textit{最后编译日期, \today\ \currenttime } % Printing/edition date
$endif$

\tableofcontents

$if(lot)$
\listoftables
\addcontentsline{toc}{chapter}{表格列表}
$endif$
$if(lof)$
\listoffigures
\addcontentsline{toc}{chapter}{插图列表}
$endif$

\clearpage
\thispagestyle{empty}

$for(include-before)$
$include-before$
$endfor$

\mainmatter
\hypersetup{pageanchor=true}

$body$

\backmatter

$if(natbib)$
$if(biblio-files)$
$if(biblio-title)$
$if(book-class)$
\renewcommand\bibname{$biblio-title$}
$else$
\renewcommand\refname{$biblio-title$}
$endif$
$endif$
\bibliography{$biblio-files$}

$endif$
$endif$
$if(biblatex)$
\printbibliography$if(biblio-title)$[title=$biblio-title$]$endif$

$endif$

$for(include-after)$
$include-after$
$endfor$

\end{document}
