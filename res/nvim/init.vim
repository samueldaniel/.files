nnoremap <Leader>w <C-W>
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug '~/.fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
Plug 'w0rp/ale'
" automatically executes `filetype plugin indent on` and `syntax enable`
call plug#end()
colorscheme antares
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '/home/fox/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources = {'_': ['ale']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>
" number lines
set number
" always display the status line
set laststatus=2
" always display tab line
set showtabline=2
" Number of pixel lines inserted between characters.
set linespace=3
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
" zt, zb leave 7 lines of space above or below
set scrolloff=7
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" do not overwrite register on paste
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
" there are some drawbacks. see link above
xnoremap p "_dP"
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
" FZF
nnoremap <C-f> :FZF<CR>
" NERDTREE
" map ctrl e to toggle the NERDTree drawer
nnoremap <C-e> :NERDTreeToggle<CR>
" always show hidden files in NERDTree
let NERDTreeShowHidden=1
" Close buffers with nerdtree easily
nnoremap <leader>q :bp<cr>:bd #<cr>
" make NERDTree ignore
let NERDTreeIgnore = ['\.pyc$']
" enable using the mouse if terminal emulator supports it
set mouse=a
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set visualbell                  " don't beep
set noerrorbells                " don't beep
set cursorline                  " underline the current line, for quick orientation
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
" vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
