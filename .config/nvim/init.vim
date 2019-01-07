call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Shougo/neosnippet-snippets'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/gnupg.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'heavenshell/vim-pydocstring'
Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'
"Plug 'neomake/neomake'
"Plug 'tell-k/vim-autopep8'
Plug 'joshdick/onedark.vim'
Plug 'w0rp/ale'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

Plug 'tpope/vim-surround'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-match-highlight'
Plug 'autozimu/LanguageClient-neovim', {
	\ 'branch': 'next',
	\ 'do': 'bash install.sh',
	\ }
call plug#end()


set noshowmode

" --- Keys ---
:imap jk <Esc>
:nmap <C-b> :Buffers <CR>
:nmap <F9> :VimtexView <CR>
:inoremap <A-h> <C-o>h
:inoremap <A-j> <C-o>j
:inoremap <A-k> <C-o>k
:inoremap <A-l> <C-o>l
" --- General Settings ---
set colorcolumn=80
set ruler
set number
set showcmd
set incsearch
set hlsearch
" enable syntax highlighting
syntax on

if (has("termguicolors"))
	set termguicolors
endif


colorscheme onedark
set background=dark

" set tabs as spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab

" ident when moving to the next line while writing code
set autoindent


" set time out lenght for escape
set timeoutlen=1000 ttimeoutlen=0

" set indent Line
set list lcs=tab:\|\ 

" Enable Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"autosave when focus lost
:au FocusLost * :wa

"Spellchecking
"au BufNewFile,BufRead,BufEnter *.tex setlocal spell spelllang=de_de
au BufNewFile,BufRead,BufEnter *.rst setlocal spell spelllang=de_de

"Relative Line Numbers
set number relativenumber

"Latexsupport
let g:tex_flavor = 'latex'

" ---Pymode---
set filetype=plugin-on
set filetype=ident-on
let g:pymode=1


" --- Syntastic ---
let g:syntastic_python_checkers = ['pylint']


" --- Neomake ---
"call neomake#configure#automake('nw', 750)

" --- Ultisnips ----
"let g:UltiSnipsExpandTrigger = "<c-l>"
"let g:UltiSnipsJumpForwardTrigger = "<Tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"


" --- Airline Settings ---
set laststatus=2
let g:airline_theme='base16_spacemacs'
let g:airline_powerline_fonts=1

" --- Vim-Javascript ---
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_ngdoc=1
let g:javascript_plugin_flow=1

" --- Python-Mode ---
let g:pymode_python = 'python3'
let g:pymode_lint = 0

" --- delimitMate ---
let g:delimitMate_expand_cr=1

set hidden
let g:LanguageClient_serverCommands = {
	\ 'python': ['/usr/bin/pyls'],
	\ 'css': ['/usr/bin/css-languageserver', '--stdio'],
	\ 'sass': ['/usr/bin/css-languageserver', '--stdio'],
	\ 'less': ['/usr/bin/css-languageserver', '--stdio'],
	\ 'html': ['/usr/bin/html-languageserver', '--stdio'],
	\ 'javascript': ['/usr/bin/javascript-typescript-stdio']
 	\}
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" --- NCM2 ---
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Snip Support
" " Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
let g:ncm2#complete_length = [[1,3],[7,2]]

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0


" ---Vimtex---
let g:vimtex_view_method='mupdf'
let g:vimtex_compiler_progname='nvr'

" ---Vim-Go---
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1


" ---vim-polyglot---
let g:polyglot_disabled = ['latex']
let g:jsx_ext_required = 1

" ---fzf-vim---
nnoremap <Space> :GFiles<CR>

" ---ale---
let g:ale_sign_error = "E"
let g:ale_sign_warning = "W"
let g:ale_echo_msg_format = '%linter% says %s'

