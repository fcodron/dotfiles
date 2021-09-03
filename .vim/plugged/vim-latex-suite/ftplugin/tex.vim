" Set options for Latex Suite

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
"format and line breaks
set fo=tcq
set textwidth=78
"Alt-keys mapping
set winaltkeys=no
"remapping the Alt keys to Ctrl
imap <C-l> <Plug>Tex_LeftRight
imap <C-i> <Plug>Tex_InsertItemOnThisLine
imap <M-r> <Esc>aref<F7>
imap <buffer> <F6> <Esc>a\item
" remap for easy \
inoremap ù \
inoremap º ù
"Annoying <enter> after itemize ou enum...
set noshowcmd
" replace `char par ; as leader
let g:Tex_Leader=';'

" Compilation rules
" compilation and dvi search
let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -src-specials $*'
let g:Tex_UseEditorSettingInDVIViewer = 1

" compile to pdf using latexmk + lua 
"( latexmkrc defaults to lualatex)
" let g:Tex_CompileRule_pdf = 'latexmk -pvc "$*"'
let g:Tex_CompileRule_pdf = 'latexmk -lualatex="lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style" "$*"'
"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style "$*"'

" set pdf viewer (mac)
if has ('osx')
    let g:Tex_ViewRule_pdf = 'skim'
endif
