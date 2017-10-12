set nocompatible
filetype off

colorscheme default

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'
" https://github.com/vim-airline/vim-airline
" Plugin 'vim-airline/vim-airline'
" https://github.com/tpope/vim-commentary
Plugin 'tpope/vim-commentary'
" https://github.com/kien/ctrlp.vim
Plugin 'ctrlpvim/ctrlp.vim'
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'
" https://github.com/gioele/vim-autoswap
Plugin 'gioele/vim-autoswap'
" https://github.com/kien/rainbow_parentheses.vim
Plugin 'kien/rainbow_parentheses.vim'
" https://github.com/ntpeters/vim-better-whitespace
Plugin 'ntpeters/vim-better-whitespace'
" https://github.com/jiangmiao/auto-pairs
Plugin 'jiangmiao/auto-pairs'
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'
" https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'
" https://github.com/MarcWeber/vim-addon-mw-utils
Plugin 'MarcWeber/vim-addon-mw-utils'
" https://github.com/tomtom/tlib_vim
Plugin 'tomtom/tlib_vim'
" https://github.com/garbas/vim-snipmate (depends on tlib and addon mw utils)
Plugin 'garbas/vim-snipmate'
" https://github.com/honza/vim-snippets (optional of vim-snipmate)
Plugin 'honza/vim-snippets'
" Plugin 'Valloric/YouCompleteMe'
" https://github.com/j5shi/ctrlp_bdelete.vim
Plugin 'j5shi/ctrlp_bdelete.vim'
" https://github.com/chriskempson/base16-vim
Plugin 'chriskempson/base16-vim'
" https://github.com/bkad/CamelCaseMotion
Plugin 'bkad/CamelCaseMotion'
" https://github.com/guns/xterm-color-table.vim
Plugin 'guns/xterm-color-table.vim'
" https://github.com/vim-scripts/xml.vim
Plugin 'vim-scripts/xml.vim'
" https://github.com/junegunn/goyo.vim
Plugin 'junegunn/goyo.vim'
" flake8
" Plugin 'nvie/vim-flake8'
" All of your Plugins must be added before the following line
call vundle#end()            " required

" autocmd BufWritePost *.py call Flake8()

" syntax highlighting
syntax on
" enable filetype detection
filetype on
" enable loading settings for specific types of files
" ~/.vim/ftplugin/python.vim
filetype plugin on
" enable loading indent settings for filetypes
" ~/.vim/indent/python.vim
filetype indent on

" Spell checking
" set spell spelllang=en_us

" zt, zb leave 7 lines of space above or below
set scrolloff=7

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" do not overwrite register on paste
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
" there are some drawbacks. see link above
xnoremap p "_dP"

" Set line numbers
set number

" colors!
if filereadable(expand("~/.vimrc_background"))
   let base16colorspace=256
   source ~/.vimrc_background
endif
" enable xterm colors
set term=xterm-256color
" highlight PmenuSel ctermfg=black ctermbg=cyan
" highlight Pmenu ctermfg=green ctermbg=black

" rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" put swp files in one place
set directory=~/.vim/tmp

" indentation settings
" how many columns a tab counts for
set tabstop=4

" use spaces instead of tabs
set expandtab

" control how many columns text is indented with the reindent operations (<<
" and >>)
set shiftwidth=4

" control how many columns vim uses when you hit Tab in insert mode
set softtabstop=4

" copy the indentation from the previous line when starting a new line
set autoindent

" automatically inserts one extra level of indentation in some cases
" don't use if filetype indent is ON
" set smartindent

" Copy the structure of the existing lines indent when autoindenting a new
" line
set copyindent

" cursor will briefly jump to the matching brace when you insert one
set showmatch

" case insensitive searching
" use \C to force case sensitive
set ignorecase
" automatically switch to case sensitive search if you type a capital letter
set smartcase
" highlight all search hits
set hlsearch
" start searching when you type the first character of the search string. As
" you type in more characters, the search is refined.
set incsearch

" map ctrl e to toggle the NERDTree drawer
nnoremap <C-e> :NERDTreeToggle<CR>
" always show hidden files in NERDTree
let NERDTreeShowHidden=1
" Close buffers with nerdtree easily
nnoremap <leader>q :bp<cr>:bd #<cr>
" make NERDTree ignore
let NERDTreeIgnore = ['\.pyc$']

" always display the status line
set laststatus=2
" always display tab line
set showtabline=2

" enable using the mouse if terminal emulator supports it
set mouse=a
if has("mouse_sgr")
   set ttymouse=sgr
else
   set ttymouse=xterm2
end

set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set visualbell                  " don't beep
set noerrorbells                " don't beep
set cursorline                  " underline the current line, for quick orientation

" Source .vimrc whenever it is successfully written, removing old mappings on
" this event (because otherwise writing it over and over causes lag to build)
augroup vimrc
  au!
  au BufWritePost $MYVIMRC :source $MYVIMRC
augroup END

" encoding garbage
set encoding=utf-8

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom
set splitbelow
set splitright

" Resizing splits (these are the vim defaults)
" Max out the height of the current split
" <C-W> _
" Max out the width of the current split
" <C-W> |
" Normalize all split sizes, which is very handy when resizing terminal
" <C-W> =
" Swap top/bottom or left/right split
" <C-W><R>
" Break out current window into a new tabview
" <C-W><T>
" Close every window in the current tabview but the current one
" <C-W><o>

" red column
if exists('+colorcolumn')
  set colorcolumn=121
  highlight ColorColumn ctermbg=red
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>121v.\+', -1)
endif

" whitespace highlighting
highlight ExtraWhitespace ctermbg=red

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Filter out binary files
set wildignore+=*.o,*.obj,*.os,*.lo,*.Plo,.*.pyc,*.gdca,*.gcno,git,depend.*,*.built,CMakeFiles
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|depend.*|*.built|CMakeFiles|bsp_zynq-linux-cortexa9|working)$',
  \ 'file': '\v(\.(exe|a|so|dll|o|os|lo|Plo|obj|pyc|gcno|html).*$)|(.*_main$)',
  \ }
let g:ctrlp_working_path_mode = 'r'
"let g:ctrlp_by_filename = 1
let g:ctrlp_root_markers = ['.arkyd_root']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0

" Ctrl P buffer delete
call ctrlp_bdelete#init()

" Gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 1
nnoremap <leader>gg :GitGutterLineHighlightsToggle<CR>

" Map leader key
let mapleader = ","

augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

" Auto-complete
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_filetype_whitelist = { 'c': 1, 'cpp': 1, 'python': 1, 'bash': 1 }
" set completeopt-=preview
" nnoremap <leader>d :YcmCompleter GoTo<CR>

" airline config
" automatically populate g:airline_symbols with pretty symbols
" let g:airline_powerline_fonts = 1
" display all buffers when only 1 tab open
" let g:airline#extensions#tabline#enabled = 1
" only show filename
" let g:airline#extensions#tabline#fnamemod = ':t'

" BUFFER MGMT STUFF
" hide buffers instead of closing them when opening a new one
set hidden
" use tab and shift + tab to cycle thru buffers
" nnoremap <S-Tab> :bnext<CR>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
" nmap <leader>T :enew<cr>

" " Move to the next buffer
nmap <leader>l :bnext<CR>

" " Move to the previous buffer
nmap <leader>h :bprevious<CR>

" " Close the current buffer and move to the previous one
" " This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" CamelCaseMotion mappings
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

set rtp+=$HOME/.files/.colony/powerline/powerline/bindings/vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
