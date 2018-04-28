" VIMRC POUR REGLER UNE INSTALLATION DE VIM
" Attention, il n'est pas compatible en l'état avec tous les
" systèmes d'exploitations, certaines choses dans 'Comportement de Vim'
" et le Comportement de l'écran' doivent être réglé suivant l'OS
" (attention aussi à l'émulateur de terminal utilisé)
"
"" Ne pas oublier d'importer les vimfiles !
" """"""""""" " Comportement Général " """"""""""" "

" PlugManager --------------------- {{{
"
call plug#begin()
    Plug 'https://github.com/scrooloose/nerdtree.git'
    Plug 'https://github.com/Raimondi/delimitMate.git'
    Plug 'https://github.com/ntpeters/vim-better-whitespace.git'
    Plug 'https://github.com/godlygeek/tabular.git'
    Plug 'https://github.com/chrisbra/Colorizer.git'
    Plug 'https://github.com/tomasiser/vim-code-dark.git'
    Plug 'https://github.com/luochen1990/rainbow.git'
    Plug 'https://github.com/leissa/vim-acme'
    Plug 'https://github.com/rust-lang/rust.vim'
    Plug 'https://github.com/neovimhaskell/haskell-vim.git'
    Plug 'https://github.com/mattn/emmet-vim'
    Plug 'https://github.com/gko/vim-coloresque'
call plug#end()
""}}}

" Comportement de Vim -------------- {{{
set nocompatible "incompatible avec vi
set nohidden "ne cache pas un document quand un autre est ouvert
set shellslash "slash compatible unix
set writebackup " active les backup, mais le les supprime pas
set encoding=utf-8 "encode par defaut en utf-8
set fileencodings= "detecte l'encodage par defaut d'un fichier
set tabstop=4 "tabulation de 4 caractères
set shiftwidth=4 "indentation de 4 caractères
set expandtab
set showcmd
"set autochdir "travail dans le fichier courant
"set textwidth=79 "textwidth à 80 pour la prog
set relativenumber "relative number
let mapleader="," " définit <leader>
let maplocalleader=";" " définit <localleader>
filetype plugin on "active les plugins dépendant des types de fichiers
filetype indent on "active l'indentation relative a un type de fichier
filetype plugin indent on "active le plugin et l'intend à un type de fichier
filetype on "active la detection générale des types
" }}}

" A régler pour le terminal ------- {{{
"set t_Co:256 "à mettre pour un terminal à 256 couleurs
" pour un term en guicolors
"set termguicolors
"let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
"let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"


" }}}
"
" Réglage du Terminal interne {{{
tnoremap <Esc> <C-\><C-n>

" }}}

" Statusline -------------- {{{
" Réglages remachinés par vim-airline
" affiche la barre de status, même si il y a une seule fenêtre
set laststatus=2
"nomfichier - typefichier - longueurfichier %= longeurfichierenpourcent - ligne/caractere
set statusline=%f
set statusline+=\ -\ 
set statusline+=%y
set statusline+=\ -\ 
set statusline+=Length:
set statusline+=%L
set statusline+=%=
set statusline+=%p
set statusline+=p
set statusline+=\ -\ 
set statusline+=%l
set statusline+=/
set statusline+=%c
" }}}

" Comportement de l'écran ----------- {{{
syntax on "syntaxe
syntax enable
set title "affiche le titre
set number "affiche le nombre de ligne
set ruler "affiche la position du curseur
set wrap "crée une ligne virtuelle quand la ligne est trop longue
set mouse= "desactive l'utilisation de la souris
set scrolloff=3 "laisse 3 lignes quand on scroll
set virtualedit=block "cases virtuelles

"A regler pour nux ou suivant le terminal
colorscheme codedark

highlight ColorColumn ctermbg=1
call matchadd('ColorColumn', '\%81v', 100)

" "voir la colonne 80
" if (exists('+colorcolumn'))
"     set colorcolumn=80
"     highlight ColorColumn ctermbg=7 guibg=#4F2629
" endif
" "
" }}}

" Comportement des recherches ------------- {{{
set ignorecase "ignorer la case pour les recherches
set smartcase "si il y a une case dans la recherche, la case n'est pas ignor?e
set incsearch "commence la recherche avant la fin
set hlsearch "surligne la recherche
" }}}

" Bells --------------------- {{{
set visualbell "flash l'?cran pendant une bells
set noerrorbells "desactive les bells sonores
" }}}

" Comportement d'Edition -------------- {{{
set backspace=indent,eol,start "permet d'effacer les indentations, les fin de lignes et les starts avec
" le backspace
set cpoptions+=$ "mode c interactif
" }}}

" Comportement du Command Mode ----------- {{{
set wildmenu "autocomplétions des commandes
set wildignore=*.o,*#,*~,*.dll,*.so,*.a "ignore les fichiers inutiles dans le wildmenu
set wildmode=full "tout le wildmenu
" }}}

" Templates --------------- {{{
augroup template_tex
	autocmd!
	"Ajoute un template sur linux, faut que je vois pour le rendre
	"interropérable
	"autocmd BufNewFile *.tex 0r ~/.vim/templates/tex.tex
augroup END
" }}}

" Comportement GUI ---------- {{{
"Plusieur choix...
"set guifont=liberation_mono:h12:b:cANSI
"set guifont=Lucida_Console:h12:cANSI
"set guifont=Consolas:h12:cANSI
"set guifont=Hack:h12:b:cANSI
"set guifont=DejaVu_Sans_Mono:h12:b:cANSI
set guifont=Meslo_LG_S_DZ:h12:b:cANSI

"set antialias "seulement sur mac os en terminal ?
" }}}

" """"""""""""
" PLUGINS
" """"""""""""
" Better White Space ---------- {{{
" Permet de supprimer les espces en trop sur les lignes
nnoremap <leader>fws :StripWhitespace<CR>
" }}}

" Tabular ------------- {{{
" Permet d'aligner facilement des tableaux
"let g:tabular_loaded = 1
" Commandes :
" - :Tabularize <regex> permet d'aligner des lignes.
"   ex: :Tabularize /, va aligner plusieurs lignes à un espace
" - :Tabularize /,/r1c1l10 -> aligne d'un caractère à droite, un au centre, et
"   10 à droite (rcl)
" - :Tabularize /^[^,]*/\zs,/r1c1l10 est une autre commande valable
" }}}

" Rainbow Toggle -------------- {{{
let g:rainbow_active = 1

let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
" }}}

" """"""""""""
" MAPPING
" """"""""""""
" Mapping Général ----------- {{{

"quitte un mode avec ,,
noremap ,, <esc>
inoremap ,, <esc>
inoremap <esc> <nop>
"

"ouvre et source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" copier/coller en dehors de vim
noremap <c-c> "+y
noremap <c-p> "+gP

" H = 0 et L = $
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

" ligne virtuelles se comportent comme des lignes normales
nnoremap k gk
nnoremap j gj

" supprime l'appel automatique au mode "Ex"
nnoremap Q <nop>
" supprime ZZ, ZQ etc.
noremap ZZ <nop>
noremap ZQ <nop>


" }}}

" Latex (et un peu .txt) ------------ {{{
let g:tex_flavor = "latex"
"autogroup pour les .tex et .txt, ce sont les même car le contenu est similaire.
augroup tex_txt_options
	autocmd!
	autocmd BufNewFile,BufRead *.tex setlocal textwidth =105
	autocmd BufNewFile,BufRead *.txt setlocal textwidth =105
	autocmd BufNewFile,BufRead *.tex iabbrev aps pas
	autocmd BufNewFile,BufRead *.tex iabbrev uen une
	autocmd BufNewFile,BufRead *.tex iabbrev ets est
	autocmd BufNewFile,BufRead *.txt iabbrev aps pas
	autocmd BufNewFile,BufRead *.txt iabbrev uen une
	autocmd BufNewFile,BufRead *.txt iabbrev ets est
augroup END

"augroup pour les balises tex.
augroup tex_map
	autocmd!
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>tit \title{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>dat \date{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>aut \author{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>S \section{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>sS \subsection{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>ssS \subsubsection{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>P \paragraph{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>sP \subparagraph{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>par \part{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>chap \chapter{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>app \appendix<Esc>o

	autocmd BufNewFile,BufRead *.tex inoremap <localleader>itm \begin{itemize}<Esc>o\item<Esc>o\end{itemize}<Esc>k$a
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>enm \begin{enumerate}<Esc>o\item<Esc>o\end{enumerate}<Esc>k$a
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>des \begin{description}<Esc>o\item[]<Esc>o\end{description}<Esc>k$i

	autocmd BufNewFile,BufRead *.tex inoremap <localleader>qote \begin{quote}<Esc>o\item<Esc>o\end{quote}<Esc>ka
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>qota \begin{quotation}<Esc>o\item<Esc>o\end{quotation}<Esc>ka
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>vers \begin{verse}<Esc>o<Esc>o\end{verse}<Esc>ka

	autocmd BufNewFile,BufRead *.tex inoremap <localleader>fig \begin[]{figure}<Esc>o<Esc>o\end{figure}<Esc>ka
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>lsfig \listoffigures
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>lstabl \listoftables
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>tabl \begin[]{table}<Esc>o<Esc>o\end{table}<Esc>ka

	autocmd BufNewFile,BufRead *.tex inoremap <localleader>cent \begin{center}<Esc>o<Esc>o\end{center}<Esc>ka
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>flet \begin{flushleft}<Esc>o<Esc>o\end{flushleft}<Esc>ka
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>frit \begin{flushright}<Esc>o<Esc>o\end{flushright}<Esc>ka

	autocmd BufNewFile,BufRead *.tex inoremap <localleader>verb \begin{verbatim}<Esc>o<Esc>o\end{verbatim}<Esc>ka
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>verb* \begin{verbatim*}<Esc>o<Esc>o\end{verbatim*}<Esc>ka
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>dmat \begin{displaymath}<Esc>o<Esc>o\end{displaymath}<Esc>ka
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>tabb \begin{tabbing}<Esc>o<Esc>o\end{tabbing}<Esc>a

	" Tabular, ne marche pas pour l'instant
	"autocmd BufNewFile,BufRead *.tex inoremap <localleader>tabu \begin{tabular}[]{}<Esc>o<Esc>o\end{tabular}<Esc>kk0f{;a

	autocmd BufNewFile,BufRead *.tex inoremap <localleader>em \emph{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>rm \textrm{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>sf \textsf{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>md \textbf{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>bf \textbf{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>up \textup{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>tt \texttt{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>it \textit{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>sl \textsl{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>st \textsc{}<left>

	autocmd BufNewFile,BufRead *.tex inoremap <localleader>fn \footnote{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>mp \marginpar{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>nl \\<Esc>o

	autocmd BufNewFile,BufRead *.tex inoremap <localleader>mt \maketitle
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>tof \tableofcontents
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>pstyle \pagestyle{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>labl \label{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>ref \ref{}<left>
	autocmd BufNewFile,BufRead *.tex inoremap <localleader>pref \pref{}<left>
	"guillemets français
	autocmd BufNewFile,BufRead *.tex inoremap << «
	autocmd BufNewFile,BufRead *.tex inoremap >> »
augroup END
" }}}

" Spellfr ---------------- {{{
"met la correction en français. A voir...
"ne marche pas vraiment comme je veux...

"augroup autocorrect_markdown
"	autocmd!
"	autocmd BufNewFile,BufRead *.markdown setlocal spell
"	autocmd BufNewFile,BufRead *.markdown setlocal spelllang=fr
"	autocmd BufNewFile,BufRead *.markdown nnoremap <buffer> <localleader>sspel :setlocal spell!<CR>
"augroup END
"set spellsuggest:10
" }}}

" HTML --------------- {{{
" ne wrap pas sur les fichiers html
" et supprime une taille max
augroup html
	autocmd!
	autocmd BufNewFile,BufRead *.html setlocal nowrap
	autocmd BufNewFile,BufRead *.html setlocal textwidth=0
augroup END

" }}}

" C/C++ ---------------- {{{
augroup C_Cpp
	autocmd!
	autocmd FileType c nnoremap <buffer> <localleader>co I//<Esc>
	autocmd FileType cpp nnoremap <buffer> <localleader>co I//<Esc>
	autocmd FileType c vnoremap <buffer> <localleader>co I//<Esc>
	autocmd FileType cpp vnoremap <buffer> <localleader>co I//<Esc>
	autocmd FileType c nnoremap <buffer> <localleader>htoc g_xo{<Esc>o}<Esc>
	autocmd FileType cpp nnoremap <buffer> <localleader>htoc g_xo{<Esc>o}<Esc>
	"a continuer : mapping pour transformer une déclaration en définition
	"enlève le ; final et ajoute { } à la ligne mais dans le mode visual
	"peut être qu'il y a des plugins qui font ça mieux que moi...
augroup END
" }}}

" VIM --------------- {{{
augroup vim_autocmd
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Haskell ---------- {{{
"
" Utilisation du plugin haskell-vim"

augroup haskell
	autocmd!
	"expandtab transforme les tabulations en espace
	autocmd FileType haskell setlocal expandtab
augroup END

let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1

let g:rainbow_active = 1 "réactive Rainbow

" }}}

" Markdown ----------- {{{

"Utilisation du plugin markdown folding
"Utilisation du plugin markdown
augroup markdown
	autocmd!
	autocmd BufNewFile,BufRead *.markdown setlocal textwidth=100
	autocmd BufNewFile,BufRead *.markdown setlocal expandtab
	autocmd BufNewFile,BufRead *.markdown setlocal tabstop=4
	autocmd BufNewFile,BufRead *.markdown setlocal shiftwidth=4

	"guillemets français
	autocmd BufNewFile,BufRead *.markdown inoremap << «
	autocmd BufNewFile,BufRead *.markdown inoremap >> »
augroup END
" }}}

" Assembleur -------- {{{

augroup nasm
    autocmd!
    autocmd FileType asm setlocal ft=nasm
augroup END

" }}}o

" Python -------- {{{
augroup python
    autocmd!
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=99
    autocmd FileType python setlocal tabstop=4
    autocmd FileType python setlocal softtabstop=4
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal textwidth=79
    autocmd FileType python setlocal expandtab
    autocmd FileType python setlocal autoindent
    autocmd FileType python setlocal fileformat=unix
augroup END
" }}}o
