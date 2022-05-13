%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%
%%%%%%%%	Clase U-Memoria
%%%%%%%%	Primer Autor	: 	Nikolas Tapia M.
%%%%%%%%	Modificaciones	: Marcelo Becerra A.
%%%%%%%%  	Contactos		: ntapia@dim.uchile.cl, 
%%%%%%%%					  marcelo.becerra@ug.uchile.cl
%%%%%%%%	Version: 1.0.0 (no oficial)
%%%%%%%%	Fecha: 08-10-2022
%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{umemoria}[2021/09/23 v1.6 Clase LaTeX para estandarizacion de Memorias U. de Chile]

%% Definicion de Condicionales
\newif\if@swapnum
\newif\if@contnum
\newif\if@en
\@swapnumfalse
\@contnumtrue
\@enfalse

%% Declaracion de Opciones
\DeclareOption{leftnum}{\@swapnumtrue}
\DeclareOption{rightnum}{\@swapnumfalse}
\DeclareOption{contnum}{\@contnumtrue}
\DeclareOption{english}{\@entrue}
\DeclareOption{nocontnum}{\@contnumfalse}
\DeclareOption{uprightd}{\AtEndOfPackage{\DeclareMathSymbol{d}{\mathalpha}{operators}{`d}}}
\DeclareOption{uprighte}{\AtEndOfPackage{\DeclareMathSymbol{e}{\mathalpha}{operators}{`e}}}
\DeclareOption{uprighti}{\AtEndOfPackage{\DeclareMathSymbol{i}{\mathalpha}{operators}{`i}}}
\DeclareOption{upright}{\ExecuteOptions{uprightd,uprighte,uprighti}}

%% Pasar Opciones a clase Book
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt,letterpaper,oneside]{book}

%% Packages necesarios
% \RequirePackage[utf8]{inputenc} %Encoding % comment with LUA
\RequirePackage[top=2cm, left=3cm, bottom=2cm, right=2cm, paper=letterpaper]{geometry} % Margenes
\RequirePackage{amsmath, amssymb, amsthm, graphicx} % Varios

%% Caption antes de la tabla
\RequirePackage{caption}
\captionsetup[table]{position=above}

%% Agregar palabra para anexos
\RequirePackage[titletoc]{appendix}





\if@en
	\RequirePackage{babel}
\else
	\RequirePackage[spanish, es-nolists, es-lcroman]{babel} % Lenguaje
\fi
\RequirePackage[pdfpagelabels,hidelinks]{hyperref} % Links y numeracion del PDF
\RequirePackage{listings} % Codigo Fuente			
\RequirePackage{pgffor} % foreach

%% Lenguaje
\addto\captionsspanish{\renewcommand\tablename{Tabla}}
\addto\captionsspanish{\renewcommand\contentsname{Tabla de Contenido}}
%% Agregar la bibliografía al índice
\let\oldbib\bibliography
\renewcommand{\bibliography}[1]{%
	\oldbib{#1}%
	\if@en
		\addcontentsline{toc}{chapter}{\protect\numberline{}Bibliography}%
	\else
		\addcontentsline{toc}{chapter}{\protect\numberline{}Bibliograf\'ia}%
	\fi
}
\addto\captionsspanish{\renewcommand\listtablename{Índice de Tablas}}
\addto\captionsspanish{\renewcommand\listfigurename{Índice de Ilustraciones}}

%% Interlineado
\setlength{\parskip}{2ex} %interlineado doble

%% Renovar enumerate e itemize
\let\oldenum\enumerate
\let\oldendenum\endenumerate
\renewenvironment{enumerate}{\oldenum\setlength{\parskip}{\smallskipamount}}{\oldendenum}
\let\olditem\itemize
\let\oldenditem\enditemize
\renewenvironment{itemize}{\olditem\setlength{\parskip}{\smallskipamount}}{\oldenditem}

%% Entornos nuevos
\newenvironment{abstract}{%
\clearpage
\if@en
	\chapter*{Abstract}
\else
	\chapter*{Resumen}
\fi
}{\vfill\null}

\newenvironment{resumen}{%
\chapter*{Resumen}
}{\vfill\null}

\newenvironment{dedicatoria}{\clearpage\null\vspace{\stretch{1}}\begin{flushright}\itshape}{\end{flushright}\vspace{\stretch{2}}\null}
\let\thanks\undefined

\newenvironment{thanks}{
	\clearpage
	\if@en
		\chapter*{Acknowledgments}
	\else
		\chapter*{Agradecimientos}
	\fi
	
}
{\vfill\null}

%% Teoremas, proofs, etc
\renewenvironment{proof}[1][\proofname] {\par\pushQED{\qed}\normalfont\topsep6\p@\@plus6\p@\relax\trivlist\item[\hskip\labelsep\scshape\footnotesize#1\@addpunct{.}]\ignorespaces}{\popQED\endtrivlist\@endpefalse}

\newtheoremstyle{miestilo}{\baselineskip}{3pt}{\itshape}{}{\bfseries}{}{.5em}{}
\newtheoremstyle{miobs}{\baselineskip}{3pt}{}{}{\bfseries}{}{.5em}{}
\if@swapnum
	\swapnumbers
\fi
\theoremstyle{miestilo}
\newtheorem{defn}{Definición}[chapter]
\if@contnum
	\if@en
		\newtheorem{teo}[defn]{Theorem}
		\newtheorem{cor}[defn]{Corollary}
		\newtheorem{lema}[defn]{Lemma}
		\newtheorem{prop}[defn]{Proposition}
	\else
		\newtheorem{teo}[defn]{Teorema}
		\newtheorem{cor}[defn]{Corolario}
		\newtheorem{lema}[defn]{Lema}
		\newtheorem{prop}[defn]{Proposición}
	\fi
\else
	\if@en
		\newtheorem{teo}{Theorem}[chapter]
		\newtheorem{cor}{Corollary}[chapter]
		\newtheorem{lema}{Lemma}[chapter]
		\newtheorem{prop}{Proposition}[chapter]
	\else
		\newtheorem{teo}{Teorema}[chapter]
		\newtheorem{cor}{Corolario}[chapter]
		\newtheorem{lema}{Lema}[chapter]
		\newtheorem{prop}{Proposición}[chapter]
	\fi
\fi
\theoremstyle{miobs}

\if@en
	\newtheorem*{ej}{Example}
	\newtheorem*{obs}{Observation}
\else
	\newtheorem*{ej}{Ejemplo}
	\newtheorem*{obs}{Observación}
\fi

%% Comandos para la portada
\global\def\@universidad{Universidad de Chile}
\newcommand{\setuniversidad}[1]{\def\@carrera{#1}}
\let\universidad\setuniversidad
\let\setuniversidad\relax

\global\def\@facultad{Facultad de Ciencias Físicas y Matemáticas}
\newcommand{\setfacultad}[1]{\def\@carrera{#1}}
\let\facultad\setfacultad
\let\setfacultad\relax

\global\def\@lugar{Santiago de Chile}
\newcommand{\setlugar}[1]{\def\@lugar{#1}}
\let\lugar\setlugar
\let\setlugar\relax

\global\let\@carrera\@empty
\newcommand{\setcarrera}[1]{\def\@carrera{#1}}
\let\carrera\setcarrera
\let\setcarrera\relax

\global\let\@grado\@empty
\newcommand{\setgrado}[1]{\def\@grado{#1}}
\let\grado\setgrado
\let\setgrado\relax

\global\let\@memoria\@empty
\newcommand{\setmemoria}[1]{\def\@memoria{#1}}
\let\memoria\setmemoria
\let\setmemoria\relax

\global\let\@tesis\@empty
\newcommand{\settesis}[1]{\def\@tesis{#1}}
\let\tesis\settesis
\let\settesis\relax

\global\let\@cotutela\@empty
\newcommand{\setcotutela}[1]{\def\@cotutela{#1}}
\let\cotutela\setcotutela
\let\setcotutela\relax

\global\let\@guia\@empty
\newcommand{\setguia}[1]{\def\@guia{#1}}
\let\guia\setguia
\let\setguia\relax

\global\let\@coguia\@empty
\newcommand{\setcoguia}[1]{\def\@coguia{#1}}
\let\coguia\setcoguia
\let\setcoguia\relax

\global\let\@depto\@empty
\newcommand{\setdepto}[1]{\def\@depto{#1}}
\let\depto\setdepto
\let\setdepto\relax

\global\let\@comision\@empty
\newcommand{\setcomision}[1]{\def\@comision{#1}}
\let\comision\setcomision
\let\setcomision\relax

\global\let\@auspicio\@empty
\newcommand{\setauspicio}[1]{\def\@auspicio{#1}}
\let\auspicio\setauspicio
\let\setauspicio\relax

\global\def\@anho{\the\year{}}
\newcommand{\setanho}[1]{\def\@anho{#1}}
\let\anho\setanho
\let\setanho\relax

%%Portada
\renewcommand{\maketitle}{
	\begin{titlepage}
		\begin{minipage}{1.6cm}
			\includegraphics[scale=.12]{media/imagenes/institucion/escudoU2014.pdf}
		\end{minipage}
		\begin{minipage}[t]{12cm}
			\MakeUppercase\@universidad\\\MakeUppercase\@facultad\\\MakeUppercase\@depto
		\end{minipage}

		\vspace{2cm}
		\centering
			\MakeUppercase\@title

		\vspace{1cm}
		\if\@tesis\@empty\else
			TESIS PARA OPTAR AL GRADO DE\\\MakeUppercase\@tesis
			\if\@cotutela\@empty\else
				\\\bigskip EN COTUTELA CON \MakeUppercase\@cotutela
			\fi
		\fi
		\if\@memoria\@empty\else
			\if\@tesis\@empty\else
				\\\bigskip
			\fi
			 MEMORIA PARA OPTAR AL TÍTULO DE\\\MakeUppercase\@memoria
		\fi

		\vspace{1cm}
			\MakeUppercase\@author

		\vspace{2cm}
			\foreach \x [count=\xi] in \@guia {
				PROFESOR GUÍA\ifnum\xi>1 \ \xi \fi:\\ \MakeUppercase\x\\
			}

		\vspace{1cm}
			\foreach \x [count=\xi] in \@coguia {
				PROFESOR CO-GUÍA\ifnum\xi>1 \ \xi \fi:\\ \MakeUppercase\x\\
			}

		\vspace{1cm}
			MIEMBROS DE LA COMISIÓN:\\
			\foreach \x in \@comision { \MakeUppercase\x\\ }

		\if\@auspicio\@empty\else
		\vfill
			\normalfont
			Este trabajo ha sido parcialmente financiado por \@auspicio
		\fi

		\vfill
			\MakeUppercase\@lugar\\ \MakeUppercase\@anho
	\end{titlepage}
	
	%% Configuración de hyperref
	%%  (... tenemos en título, autor, etc., acá)
	\hypersetup{
		pdfauthor = {\@author},
		pdftitle = {\@title}
	}
}

%%Estilo del frontmatter
\newcommand{\ps@front}{
	\renewcommand{\thepage}{\roman{page}}
	\renewcommand{\@oddhead}{}
	\renewcommand{\@evenhead}{}
	\renewcommand{\@oddfoot}{\hfill\thepage\hfill}
	\renewcommand{\@evenfoot}{\hfill\thepage\hfill}
}

\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{
	\pagestyle{front}
	\oldfrontmatter
}
\let\oldfrontmatter\relax

%% Evitar problemas con tildes
\RequirePackage{etoolbox}
\makeatletter
\appto{\appendices}{\def\Hy@chapapp{Appendix}}
\makeatother

%% Miscelaneos
% \newcommand{\G}{\mathcal{G}}
% \newcommand{\C}{\mathbb{C}}
\newcommand{\A}{\mathcal{A}}
\newcommand{\D}{\mathbb{D}}
\newcommand{\E}{\mathbb{E}}
\newcommand{\F}{\mathcal{F}}
\renewcommand{\H}{\mathcal{H}}
\newcommand{\K}{\mathcal{K}}
\renewcommand{\L}{\mathcal{L}}
\newcommand{\M}{\mathcal{M}}
\newcommand{\N}{\mathbb{N}}
\renewcommand{\M}{\mathcal{M}}
\renewcommand{\P}{\mathbb{P}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\renewcommand{\S}{\mathcal{S}}
\newcommand{\T}{\mathcal{T}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\1}{\mathbf{1}}
\let\epsilon\varepsilon

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Marcelo Modifications %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% for better compatibility use LuaLatex or XeTex

\RequirePackage{minted}
\usepackage{luainputenc}
% \RequirePackage[T1]{fontenc}  %comment if use lua or xe
% \RequirePackage[utf8]{inputenc} % comment if use lua or xe
\RequirePackage{lipsum} % to create lorem ipsum texts
\RequirePackage[acronym, toc]{glossaries} % to make glossaries and acronyms
% \RequirePackage[fixlanguage]{babelbib} %
\RequirePackage[backend=biber]{biblatex}
\RequirePackage{csquotes}
\RequirePackage{url} 
\RequirePackage{import} % to import things ?
\RequirePackage{hyperref} % 
\RequirePackage{graphicx} % to use images
\RequirePackage{newfloat} % to float (move, center) images
\RequirePackage{fontspec} % For use a custom font Use only with XeTex or LuaTex
\RequirePackage{minted}
\RequirePackage[dvipsnames]{xcolor}


\definecolor{bg}{rgb}{0.95, 0.95, 0.95}
\definecolor{bg2}{RGB}{200, 200, 200}


% \renewcommand{\listingname}{Sección de Código}
\SetupFloatingEnvironment{listing}{name=Codigo}
\SetupFloatingEnvironment{listing}{listname=Lista de Código}
\renewcommand\listingscaption{Sección de Código}

\renewcommand{\theFancyVerbLine}{
  \sffamily\textcolor[rgb]{0.5,0.5,0.5}{\scriptsize\arabic{FancyVerbLine}}}

  % frame=lines,
\usemintedstyle{friendly}

\setmonofont{Fira Code}[
	Contextuals=Alternate  % Activate the calt feature
  ]

%	SET code style for the document
\setminted[python]{
  mathescape,
  breaklines,
  breakanywhere,
  linenos,
  numbersep=5pt,
  autogobble,
  frame=leftline,
  framesep=2mm,
  fontsize=\footnotesize,
  bgcolor=bg}

%	set a custom style
  \newminted{py}{
    mathescape,
	breaklines,
	breakanywhere,
    linenos,
    numbersep=5pt,
    gobble=2,
    frame=leftline,
    framesep=2mm,
	fontsize=\footnotesize,
    bgcolor=bg2}
  
% EXAMPLE
% \begin{listing}[H]
% 	\mint{python}/(car (cons 1 '(2)))/
% 	\caption{Example of a listing.}
% 	\label{lst:example}
%   \end{listing}
  
%   \begin{pycode}
% 	"""
% 	Defined as $\pi=\lim_{n\to\infty}\frac{P_n}{d}$ where $P$ is the perimeter
% 	of an $n$-sided regular polygon circumscribing a
% 	circle of diameter $d$.
% 	"""
% 	def message_processing(self, t_chat, message, label=None, question=None ):
% 		messages = []
% 		if label is None:
% 			if message == '/start':
% 			messages = [ {"text": 'Hola ...',
% 			 "keyboard": {}},...]
% 			elif message == '/preguntasFrecuentes': ...
% 			elif message == '/asistente': ... 
% 		Else: ...
% 			elif label == 'Process': ...
% 			elif label == 'Category': ...
% 			elif label == 'Question': ...
% 			elif label == 'Helper':  ...
		
% 		for msg in messages:
% 			self.send_message(msg['text'],
% 			 t_chat["id"], msg['keyboard'])
	
	
%   \end{pycode}