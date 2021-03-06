syntax enable
let g:DoxygenToolkit_authorName = "Michael Pfeifer"
" Misc settings {
set modelines=1
set scrolloff=100
set confirm
set modeline
set wildmenu
set hlsearch
set showmatch
set incsearch
set ignorecase
set nowrap
colo ron
inoremap jj <Esc>
highlight Comment cterm=bold
command! Wq wq
cmap w!! w !sudo tee %
" }
" Tab formatting {
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set shiftround
" }
" Remove annoying files {
set nobackup
set noswapfile
set noundofile
set nowritebackup
" }
" Fold block comments {
set foldnestmax=1
set foldlevelstart=1
set foldmethod=syntax
set foldenable
"autocmd VimEnter,BufRead * :g/^\/\*/foldc
autocmd VimEnter,BufRead * normal gg
" set space to open and close folds
nnoremap <space> za
" }
" Cursor wraps lines {
set backspace=indent,eol,start whichwrap+=<,>,[,]
" }
" 80 character red bar {
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%82v.\+/
" } 
" C-S saves {
noremap <C-S> :w<CR>
vnoremap <C-S> <C-C>:w<CR>
inoremap <C-S> <C-O>:w<CR>
" }
" Delete trailing whitespace {
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.sql :call DeleteTrailingWS()
" }
" Diff unsaved changes {
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
" }
" Disable arrow keys {
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
" }
" Line numbers {
set number
set relativenumber
:command NoLines set nonumber | set norelativenumber
:command Lines set number | set relativenumber
" }
" vim:foldmethod=marker:foldmarker={,}:foldlevel=0:
