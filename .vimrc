syntax enable
let g:DoxygenToolkit_authorName = "Michael Pfeifer"
" misc settings {
set modelines=1
set scrolloff=100
set confirm
set modeline
set wildmenu
set hlsearch
set showmatch
set incsearch
set number
set relativenumber
inoremap jj <Esc>
" }
" tab formatting {
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set shiftround
" }
" remove annoying files {
set nobackup
set noswapfile
set noundofile
set nowritebackup
" }
" fold block comments {
set foldnestmax=1
set foldlevelstart=1
set foldmethod=syntax
set foldenable
"autocmd VimEnter,BufRead * :g/^\/\*/foldc
autocmd VimEnter,BufRead * normal gg
" set space to open and close folds
nnoremap <space> za
" }
" cursor wraps lines {
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
" delete trailing whitespace {
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
" diff unsaved changes {
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
" }
" disable arrow keys {
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
" }
" vim:foldmethod=marker:foldmarker={,}:foldlevel=0:
