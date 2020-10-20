" Settings

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set laststatus=2
set number
set noshowmode
set wildmenu
set wildmode=list:longest,full
set splitbelow
set splitright
set cursorline
set showcmd
set showmatch
set lazyredraw
set incsearch
set hlsearch
set bs=2
set mouse=a
set timeoutlen=1000 ttimeoutlen=0
set noswapfile

colorscheme gruvbox


" Remapping Leader Character

let mapleader=","


" Vim Wiki Settings

set nocompatible

" Plugins

call plug#begin('~/.vim/plugged')
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'elixir-editors/vim-elixir'
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
  Plug 'vimwiki/vimwiki'
  Plug 'posva/vim-vue'
  Plug 'tpope/vim-rails'
  Plug 'w0rp/ale'
call plug#end()

execute pathogen#infect()
filetype plugin indent on
filetype plugin on
syntax enable
syntax on
syntax sync fromstart


" Key Mapping

map ; :Files<CR>
map <C-\> :NERDTree<CR>
" Clears the search highlight
nnoremap <leader><space> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Rg
nnoremap <leader>vc :VimwikiAll2HTML
nnoremap <leader>vb :Vimwiki2HTMLBrowse
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Remapping deletes without copy
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

if !has('gui_running')
    set t_Co=256
endif

" Setting colors for lightline

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" WARP ALE LINTING
let g:ale_enabled=1
highlight clear ALEError
highlight clear ALEWarning
highlight clear ALEErrorSign
highlight clear ALEWarningSign

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \    fzf#vim#with_preview('right:50%'),
  \   )

set rtp+=/usr/local/opt/fzf
