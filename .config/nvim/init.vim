let mapleader=" "

call plug#begin(system('echo -n "$XDG_CONFIG_HOME/nvim/plugged"'))
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()

colorscheme catppuccin-mocha
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set number relativenumber
syntax on
filetype plugin on
highlight ColorColumn ctermbg=238
set splitbelow splitright
set tw=80
set expandtab
set shiftwidth=2

" toggle color column
nnoremap <leader>z :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>

" disable auto commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" spell check
map <leader>o :setlocal spell! spelllang=de_de<CR>

" nerd tree settings
map <leader>q :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has ('nvim')
	let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
else
	let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
endif

" nav shortcuts

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" alias replace all with S
nnoremap S :%s//g<Left><Left>

" run compile script on file
map <leader>c :w! \| !compile-file "<c-r>%"<CR>

" preview file
map <leader>p :!preview-file <c-r>%<CR><CR>

" remove clutter when closing .tex file
autocmd VimLeave *.tex !texclear %

" tabbing
map <Tab> :-tabnext<CR>
map <S-Tab> :+tabnext<CR>
map <C-x> :tabclose<CR>
map <C-t> :tabnew<CR>
