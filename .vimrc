" --- first install vim-plug ---
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" --- then :PlugInstall 

:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:colorscheme desert
:set completeopt-=preview " For No Previews

set encoding=UTF-8

" vim-plug call
call plug#begin()

	Plug 'machakann/vim-sandwich'
	Plug 'https://github.com/preservim/nerdtree' " NerdTree
	Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

call plug#end()

" vim-sandwich macros
" saiw( makes foo to (foo)
" sdb or sd( makes (foo) to foo.
" sdb searches a set of surrounding automatically makes (foo) to foo.
" srb" or sr(" makes (foo) to "foo"

"NERDTree setup and keyboard shortcuts
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Airline setup
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='deus'



