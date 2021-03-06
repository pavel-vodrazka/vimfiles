scriptencoding utf-8
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
set nobackup
set writebackup
"set guifont=Lucida\ Console:h10:cDEFAULT
if has("gui_win32")
  set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cDEFAULT
elseif has("gui_gtk2")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif
if has("win32")
  set printfont=DejaVu_Sans_Mono_for_Powerline:h10:cDEFAULT
elseif has("unix")
  set printfont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif
if has("gui_running") || &term == "xterm-256color" || &term == "screen" || &term == "screen-256color"
	set t_Co=256
	colorscheme Chasing_Logic
else
	colorscheme default
endif
set number
set wildmenu
set wildmode=list:longest,full

"use utf-8 by default
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,ucs-2le,latin1,cp1250,cp852
set fileencodings=utf-8

"always show status line
set laststatus=2

"show encoding in status line http://vim.wikia.com/wiki/Show_fileencoding_and_bomb_in_the_status_line
if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" Pathogen {{{
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in ‘runtimepath’
syntax on
filetype plugin indent on
" }}}


"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

" Personal mappings {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
noremap ěě @
noremap ?? @
noremap ššš #
noremap čč $
noremap řř %
noremap žž ^
noremap ýý &
noremap áá *
noremap íí (
noremap éé )
noremap úú {
noremap ůů :
inoremap ěě @
inoremap ššš #
inoremap čč $
inoremap řř %
inoremap žž ^
inoremap ýý &
inoremap áá *
inoremap íí (
inoremap éé )
inoremap úú {
inoremap ůů ;
inoremap §§ '
" uložení aktuálně editovaného souboru
map <F2> :w<CR>
" skok na předchozí chybové hlášení
map <F3> :cp<CR>
" skok na následující chybové hlášení
map <F4> :cn<CR>
" uložení aktuálně editovaného souboru a spuštění překladu
map <F9> :w<CR>:make<CR>
" výpis všech chybových hlášení překladače
map <F10> :cl<CR><CR>
" otevření netrw
map <F11> :Explore<CR>
" otevření NERDtree
map <F12> :NERDTree<CR>

"http://vim.wikia.com/wiki/Converting_tabs_to_spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd FileType make setlocal noexpandtab
inoremap <S-Tab> <C-V><Tab>

" }}}

" Vimscript file settings {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

let WMGraphviz_viewer="miktex-texworks.exe"
autocmd BufWritePost *.dot,*.gv !dot -Tpdf -o%:r.pdf %
autocmd BufWritePost *.dot,*.gv !dot -Tsvg -o%:r.svg %

" Shareboard settings {{{
let g:shareboard_use_default_mapping = 1
if has("win32")
  let g:shareboard_path="c:\\Python27\\Scripts\\shareboard"
elseif has("unix")
  let g:shareboard_path="/c/Python27/Scripts/shareboard"
endif
let g:shareboard_command = "pandoc -f markdown+smart+yaml_metadata_block -t html -m -s"
" }}}

" Use xmllint to indent xml files {{{
au FileType xml exe ":silent %!xmllint --format --recover - 2>nul"
" }}}

" {{{ c.vim settings
if has("win32")
  let g:C_CCompiler = "gcc.exe"
  let $CC = "gcc.exe"
elseif has("unix")
  let g:C_CCompiler = "gcc"
  let $CC = "gcc"
endif
let g:C_CFlags = "-std=gnu11 -Wall -g -O0 -c"
let g:C_LFlags = "-std=gnu11 -Wall -g -O0"
" }}}

" {{{ airline settings
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
" }}}

" {{{ rainbow settings
let g:rainbow_active = 1
" }}}

" {{{ syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = 1
"}}}

" {{{ Calendar settings
let g:calendar_navi_label = 'Minulý,Tento,Příští'
let g:calendar_mruler = 'Led,Úno,Bře,Dub,Kvě,Čvn,Čnc,Srp,Zář,Říj,Lis,Pro'
let g:calendar_wruler = 'Ne Po Út St Čt Pá So'
let g:calendar_monday = 1
let g:calendar_weeknm = 5
let g:calendar_focus_today = 1
" }}}

" {{{ lilypond
filetype off
set runtimepath+=C:\\Program\ Files\ (x86)\\LilyPond\\usr\\share\\lilypond\\current\\vim
filetype on
syntax on
" }}}

"{{{ LatexBox
	filetype plugin on
	set shellslash
	filetype indent on
	let g:LatexBox_latexmk_options = '-pdflua'
    let g:LatexBox_viewer = 'SumatraPDF'
	let g:LatexBox_latexmk_preview_continuously = 1
    let g:LatexBox_quickfix = 1
    let g:LatexBox_show_warnings = 1
" }}}

" {{{ vimtex
let g:vimtex_compiler_engines = {
    \ '_'                : '-pdf',
    \ 'pdflatex'         : '-pdf',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \ 'pdflua'           : '-pdflua',
    \}

let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 0,
    \ 'compiler' : '',
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \ '-verbose',
    \ '-file-line-error',
    \ '-synctex=1',
    \ '-interaction=nonstopmode',
    \ ],
    \}
" }}}

" {{{ Nvim-r
let R_pdfviewer="sumatraPDF.exe"
" }}}
