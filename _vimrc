set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
"set guifont=Lucida\ Console:h10:cDEFAULT
set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cDEFAULT
set t_Co=256
colorscheme ansi_blows
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
" skok na následujíící chybové hlášení
map <F4> :cn<CR>
" uložení aktuálně editovaného souboru a spuštění překladu
map <F9> :w<CR>:make<CR>
" výpis všech chybových hlášení překladače
map <F10> :cl<CR><CR>
" otevření netrw
map <F11> :Explore<CR>
" otevření NERDtree
map <F12> :NERDTree<CR>


" }}}

" Vimscript file settings {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

let WMGraphviz_viewer="miktex-texworks.exe"
" Shareboard settings {{{
let g:shareboard_use_default_mapping = 1
if has("win32")
	let g:shareboard_path="c:\\Python27\\Scripts\\shareboard"
endif
" }}}

" Use xmllint to indent xml files {{{
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
" }}}

" {{{ c.vim settings
let g:C_CCompiler = "clang.exe"
"let g:C_CCompiler = "c:/MinGW/bin/gcc.exe"
let g:C_CFlags = "-std=gnu11 -Wall -g -O3 -c"
let g:C_LFlags = "-std=gnu11 -Wall -g -O3"
let $CC = "clang.exe"
" }}}

" {{{ airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}

" {{{ rainbow settings
let g:rainbow_active = 1
" }}}
