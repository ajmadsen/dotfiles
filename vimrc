set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has('win32')
    set rtp+=~/vimfiles/bundle/Vundle.vim
    let path='~/vimfiles/bundle'
else
    set rtp+=~/.vim/bundle/Vundle.vim
    let path='~/.vim/bundle'
endif
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" sensible defaults
Plugin 'tpope/vim-sensible'

" fuzzy file match
Plugin 'ctrlpvim/ctrlp.vim'

" hilight move options
Plugin 'easymotion/vim-easymotion'

" file browser
Plugin 'scrooloose/nerdtree'

" git integration
Plugin 'tpope/vim-fugitive'

" surround text
Plugin 'tpope/vim-surround'

" repeat arbitrary commands
Plugin 'tpope/vim-repeat'

" easier commenting
Plugin 'scrooloose/nerdcommenter'

" tags!
Plugin 'majutsushi/tagbar'

" syntax hilighting
Plugin 'vim-syntastic/syntastic'

" tab completion
"Plugin 'ervandew/supertab'

" completion
"Plugin 'Shougo/neocomplete.vim'
Plugin 'Valloric/YouCompleteMe'

" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" delimiters
Plugin 'jiangmiao/auto-pairs'

Plugin 'rdnetto/YCM-Generator'

" fast html
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}

""" languages
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-git'
Plugin 'othree/html5.vim'
Plugin 'petRUShka/vim-opencl'
Plugin 'saltstack/salt-vim'

" show trailing whitespace
Plugin 'bronson/vim-trailing-whitespace'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" color schemes
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required

" set look-and-feel
if has('gui_running')
    if has('gui_win32')
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
    endif

    set guioptions-=m " remove menu
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right-hand scrollbar
    set guioptions-=L " remove left-hand scrollbar
endif

" windows-specific options
if has('win32')
    behave xterm
endif

" colorscheme
color solarized
set background=light

" general options
set encoding=utf-8
set number " enable line numbers
set colorcolumn=80
set nowrap

" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" searching
set ignorecase
set smartcase
set hlsearch
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" filetype-specific options
"autocmd!
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType makefile setlocal noet " make sure we use tabs
"autocmd BufNewFile,BufRead *.sls set filetype=yaml

autocmd FileType sls inoremap <buffer> <leader>jt {%  %}<Esc>hhi
autocmd FileType sls inoremap <buffer> <leader>ji {{  }}<Esc>hhi

" airline options
let g:airline#extensions#tabline#enabled = 1 " nice tablines
let g:airline_powerline_fonts = 1 " enable powerline symbols

" neovim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" rebind snippet commands
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" extra ycm options
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" allow modelines
set modeline
set modelines=5

" key bindings
let mapleader=','
map <leader>f :NERDTreeFocus<CR>
map <leader>tb :TagbarOpenAutoClose<CR>
map <leader>gs :Gstatus<CR>
map <leader>s :source $MYVIMRC<CR>
map <leader>pi :source $MYVIMRC<CR>:PluginInstall<CR>
map <leader>gi :GoImport 
map <leader>gr :GoRename 
map <leader>gf :GoFmt<CR>:GoImports<CR>
map <leader>k :nohl<CR>
map <leader>e :lopen<CR>
