"" QUICK FIX AND BEHAVIORS:
"" ----------------------------------------------------------------------------

set clipboard^=unnamed,unnamedplus
set termguicolors encoding=UTF-8

set path+=**
set path-=**/node_modules/**

set timeoutlen=200
set mouse=a
set nocompatible

set hidden confirm showmode
set autoread

if has("nvim")
    set laststatus=3
endif


"" WINDOWS BUFFERS TABS AND STATUS LINE SETTINGS:
"" ----------------------------------------------------------------------------

set splitbelow splitright
au CursorHold * checktime

" custom syntax hightlight for some files
au BufWinEnter *.txt set ft=help
if !has("nvim")
    au BufWinEnter *.ino set ft=cpp
endif


"" EDITOR INTERFACE SETTINGS:
"" ----------------------------------------------------------------------------

set number relativenumber
set cursorline

set wildmenu
set colorcolumn=80

colorscheme pablo
set fcs=eob:\ 

" customizing NETRW interface
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'
