"required by Vundle
set nocompatible
filetype off
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugins: :PluginList :PluginInstall 
Plugin 'html5.vim'
Plugin 'surround.vim'
Plugin 'closetag.vim'
Plugin 'tibabit/vim-templates'
"Plugin 'nerdtree-ack.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-colors-solarized'

"END VUNDLE
call vundle#end()            " required
filetype plugin indent on    " required

"general settings
set number
set relativenumber
set foldenable
set foldmethod=manual
set autoindent
set cindent
set backup
set nowrap
set sidescroll=1
set laststatus=2
set showmode
set exrc
set autoread
set showmatch
set hlsearch
set incsearch

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set clipboard=unnamed

"Special stuff
syntax enable
set background=dark
colorscheme palenight
syn on se title
set backspace=indent,eol,start

"braces auto indent/add match
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

"bind F8 to (_)
map! #8 ()OD
"bind F9 to {_}
map! #9 {}OD
"bind F10 to [_]
map! <F10> []OD

"rebind capslock to esc on every vim init
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

"mouse compat
set mouse=a

"auto make/loadview
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent loadview

"let g:powerline_pycmd = 'py3'
let g:airline_theme = "palenight"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
