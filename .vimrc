" vim custom config

"execute pathogen#infect()
filetype plugin indent on 

call plug#begin('~/.vim/plugged')
"Colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'jonathanfilip/vim-lucius'
Plug 'jnurmine/Zenburn'

"file navigation
Plug 'scrooloose/nerdtree'

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'jtratner/vim-flavored-markdown'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'
" Git Gutter
Plug 'airblade/vim-gitgutter'
" Git Integration
" Plugin 'tpope/vim-fugitive'
call plug#end()

" color scheme settings
" colorscheme ron
colorscheme zenburn
" colorscheme lucius
" LuciusBlack
" colorscheme solarized
set background=dark " account for dark background of terminal

" set font/size
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 14
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h14:cANSI:qDRAFT
  endif
endif

" force 256 colors in terminal
if !has("gui_running")
  set t_Co=256
endif

" show status line 
set laststatus=2

" lightline config
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" syntax highlighting
syntax enable

" TAB settings
" number of vial spaces per TAB
set tabstop=4
" number of speces in tab when editing
set softtabstop=4
" tabs are spaces
set expandtab
" show line numbers
set number
" highlight matching [{()}]
set showmatch
" set ruler

" Disable backup and swap files because they cause more problems than they solve
set nobackup
set noswapfile

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Clean whitespace in a file (coverts tabs to spaces and deletes any trailing whitespace)
map <Leader>cw :%s/[ <tab>]*$//<CR>:retab!<CR>:noh<CR>

" Disable F1 for help screen
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" PHP settings
autocmd FileType php set tabstop=2|set shiftwidth=2
autocmd FileType php set commentstring=//\ %s

" JS settings
augroup js, css
        au!
        au BufNewFile,BufRead *.js,*.css setlocal tabstop=2
        au BufNewFile,BufRead *.js,*.css setlocal softtabstop=2
        au BufNewFile,BufRead *.js,*.css setlocal shiftwidth=2
augroup END

" GitHub flavored markdown via vim-flavored-markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown textwidth=100
" au BufRead,BufNewFile *.md setlocal textwidth=100
augroup END

" Nerd Tree stuff
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerd Tree window size
let g:NERDTreeWinSize=60

" Ctrl+n to open Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" EditorConfig options
" Avoid loading EditorConfig for remote files over ssh
let g:EditorConfig_exclude_patterns = ['scp://.*']
" Override project specific editor cofig rules
" let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']

