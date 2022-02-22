call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'chaoren/vim-wordmotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-clang'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'sbdchd/neoformat'
Plug 'cstrahan/vim-capnp'
Plug 'ekalinin/Dockerfile.vim'
" automatically executes `filetype plugin indent on` and `syntax enable`
call plug#end()
" allows loading local executing local rc files
set exrc
" disallows the use of :autocmd, shell and write commands in local rc files
set secure
let g:python_host_prog = '$HOME/.pyenv/versions/nvim-python2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/nvim-python3/bin/python'
nnoremap <Leader>w <C-W>
colorscheme antares
set colorcolumn=121
let g:deoplete#enable_at_startup = 1
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\}
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'
let g:ale_linters = {
	\ 'cpp': ['clang'],
	\ 'c': ['clang'],
	\ 'python': ['prospector'],
	\}
let g:neoformat_cpp_clangformat = {
	\ 'exe': 'clang-format',
	\ 'replace': 1,
	\ 'args': ['--style=file']
	\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_cmake = []
let g:neoformat_python_black = {
	\ 'exe': 'black',
	\ 'replace': 1,
	\ 'args': ['-l 120', '-t py38']
	\}
let g:neoformat_enabled_python = ['black']
let g:neoformat_verbose = 0
"augroup fmt
"	autocmd!
"	autocmd BufWritePre * undojoin | Neoformat
"augroup END
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap ts :tabs<CR>
set virtualedit=all
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
" don't show the current mode (`-- INSERT --`) - it is useless with lightline installed
set noshowmode
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
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>
nnoremap <C-b> :Buffers<CR>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(10)
  let width = &columns
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
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
" Required for operations modifying multiple buffers like rename.
set hidden

"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"
"let g:LanguageClient_serverCommands = {
"    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
"    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
"    \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
"    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
"    \ }
"
"let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
"let g:LanguageClient_settingsPath = '/home/sam/.config/nvim/settings.json'
" https://github.com/autozimu/LanguageClient-neovim/issues/379 LSP snippet is not supported
"let g:LanguageClient_hasSnippetSupport = 0
" better-whitespace settings
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'nightly_fox'


" Per:
" Different syntax highlighting within regions of a file
" http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
" Important changes:
" * Add keepend, otherwise nested C++/Jinja doesn't work!
" * Add containedin=ALL, so also highlighted in C comments and strings.
" * Remove the textSnipHl section (since want to include the delimiters
"   for Jinja).
"
" ...and using syntax from:
" http://www.vim.org/scripts/script.php?script_id=1856

function! TextEnableCodeSnip(filetype,start,end) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ keepend
  \ containedin=ALL
  \ contains=@'.group
endfunction


" Jinja template highlighting
" Default delimiters are {{ }}, {% %}, and {# #}, per:
" http://jinja.pocoo.org/docs/templates/
au BufNewFile,BufRead */templates/* call TextEnableCodeSnip('jinja', '{{', '}}')
au BufNewFile,BufRead */templates/* call TextEnableCodeSnip('jinja', '{%', '%}')
au BufNewFile,BufRead */templates/* call TextEnableCodeSnip('jinja', '{#', '#}')
autocmd BufRead,BufNewFile *.template setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
