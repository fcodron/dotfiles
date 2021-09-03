" ---- Plugin managment ----

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    echo "Installing VimPlug..."
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Start VimPlug 
call plug#begin(expand('~/.vim/plugged'))

" Latex Suite
Plug 'gerw/vim-latex-suite'

"Python syntax
Plug 'vim-python/python-syntax'

" airline status bar
Plug 'vim-airline/vim-airline'

" Color themes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'therubymug/vim-pyte'
Plug 'NLKNguyen/papercolor-theme'

" Vim - surround (tags, parentheses...)
Plug 'tpope/vim-surround'
" comment with gc/gcc
Plug 'tpope/vim-commentary'

" Explore undo tree
Plug 'mbbill/undotree'

call plug#end()

" ==== UI config ====
" Enable file types (already set by vim-plug ?)
filetype plugin indent on

set cursorline  " highlight current line
"highlight column 80
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif
set laststatus=2
set showcmd "command info on last line (but airline)
set wildmenu " command-line auto complete <Tab>

"parenthesis show match () [] {}
set showmatch

" ==== leader, shortcuts ====
" set leader to , not \
let mapleader=","
"Alt-n next buffer
set winaltkeys=no
noremap <M-n> :bn!<cr>
" <F4> list of buffers
nnoremap <F4> :buffers<CR>:buffer<Space>

" Mac-specific:
if has('macOS')
"remap Cmd-U, Cmd-D to Ctrl-U, Ctrl-D
    map <D-u> <C-u>
    map <D-d> <C-d>
    set fileformats+=mac
endif

" move vertically by visual line (for wrapped lines)
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>

" undo tree shortcut
nnoremap <leader>u :UndotreeToggle<CR>

" toggle line number
nnoremap <leader>n :set number!<CR>

" ====  Colors ==========

syntax enable   " enable syntax highlighting
" keep cursor away from borders
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

if has('gui_running')
   colorscheme solarized
"    colorscheme pyte
"else
"   colorscheme nord
endif
" switch dark / light theme (solarized, gruvbox)
call togglebg#map("<F6>")
" plugin : <F8> to shift color themes

" === edition ===
" copy / paste uses system clipboard
set clipboard=unnamed
" tabs and spaces
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab " expand tabs into spaces

" indent when moving to the next line while writing code
set autoindent
set backspace=indent,eol,start
set smarttab

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" comments abreviations
iabbrev mcl %--------------------------------------
iabbrev fcl !--------------------------------------

" ====== File Encoding =======
" sets defaults for working with utf-8
if has("multi_byte")
    " keep default term encoding
   if &termencoding == ""
      let &termencoding = &encoding
   endif
   " utf-8 used internally
   set encoding=utf-8
   " default file encoding
   setglobal fileencoding=utf-8
   "setglobal bomb
   " list of encodings to check at opening
   set fileencodings=ucs-bom,utf-8,latin1
endif

" ===== searches =======
" NerdTree file browser
" map <F2> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set complete-=i " don't look for all files
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
" incremental search (as chars are entered)
set incsearch 
" highlight matches
set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Filetype-specific (to move to ftplugins?)
" ====== Latex ======
" .tex files latex not plain tex
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $* "Latex-Suite autocomplete (<F9>)

" ====== HTML =======
" html tags in lowercase
let g:html_tag_case = "lower"
autocmd FileType html,xhtml setl omnifunc=htmlcomplete#CompleteTags
"auto close tags
"autocmd FileType html inoremap <lt>/ </<C-X><C-O> 

" ===== Python ====
let python_highlight_all = 1
"let let g:pymode_python = 'python3'

" ===== MarkDown ====
let g:vim_markdown_initial_foldlevel=1

"let g:SuperTabDefaultCompletionType = "context"

" ===== statusbar =======
" tweak of airline status bar (solarized theme
" ! does not work with nord heme (_modified values)
"let g:airline_theme_patch_func = 'AirlineThemePatch'
"function! AirlineThemePatch(palette)
" blue normal mode
"  let a:palette.normal.airline_a = [ '#ffffff', '#268bd2', 255, 33 ]
" orange color if modified buffer
"  let a:palette.normal_modified.airline_c =  ['#cb4b16', '#eee8d5', 166, 254, '']
"  let a:palette.insert_modified.airline_c =  ['#cb4b16', '#eee8d5', 166, 254, '']
"  let a:palette.visual_modified.airline_c =  ['#cb4b16', '#eee8d5', 166, 254, '']
"endfunction

