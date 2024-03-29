let g:coc_disable_startup_warning = 1

" Credits to ThePrimeagen for most of the content
syntax on

" No sound when go to end of line
set noerrorbells

" tab is four spaces long  
set tabstop=4 softtabstop=4

set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set cmdheight=2
set updatetime=50
set shortmess+=c
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/vimfiles/plugged')
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tweekmonster/gofmt.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'flazz/vim-colorschemes'
    Plug 'savq/melange'
    Plug 'OmniSharp/omnisharp-vim'
    
    " Install plugins via:
    " Follow instructions (curl download) of GitHub repo vim-plug (Minimalist Vim Plugin Manager)
    " Then reload this rc in vim:
    "    :source %
    " Then call plugin installer function via:
    "    :PlugInstall
    " Install OmniSharp Server via:
    "    :OmniSharpInstall
call plug#end()

" Enable full colors in terminal
set termguicolors
" Enable warm color scheme provided by savq/melange plugin
colorscheme melange 

if(executable('rg'))
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" quickly insert new line in normal mode with [<space and ]<space>
nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>
