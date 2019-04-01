set nocompatible " 오리지날 VI와 호환하지 않음
filetype off

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-python/python-syntax'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'othree/html5.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/syntastic'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/seoul256.vim'

call plug#end()

filetype indent on " syntax highlight following file type
filetype plugin on
filetype plugin indent on


let mapleader = ","

" seoul256 (dark):
" "   Range:   233 (darkest) ~ 239 (lightest)
" "   Default: 237
let g:seoul256_background = 240
colo seoul256


set t_Co=256

" folding
set foldmethod=syntax
set foldnestmax=100
set nofoldenable
set foldlevel=0

set number
set nolist " 
set textwidth=80
set ruler
set number

" indent
set autoindent  " 자동 들여쓰기
set cindent " C 프로그래밍용 자동 들여쓰기
set smartindent " 스마트한 들여쓰기

" auto match
set showmatch " 매칭되는 괄호를 보여줌
set wmnu " tab 자동완성시 가능한 목록을 보여줌

" 파일/디렉토리명 자동완성 할 때 무시할 패턴
set wildignore=*.o,*.bak,.*.swap,*.pyc
set wildmenu " command-line 자동 완성 기능

" 화면 넘어가는 경우 한 라인을 여러줄로 표시
" set wrap
set linebreak       " 라인을 끊을 때 단어 단위로 자릅니다.
set showbreak=+++\  " 윗 줄과 연결되는 줄은 '+++ ' 로 시작되어 알아볼 수 있게 합니다.


" Tab setting
set softtabstop=4
set expandtab " 탭대신 스페이스
set ts=4 " Tab size
set shiftwidth=4 " 자동 들여쓰기 4칸


" file encoding
scriptencoding utf-8
set encoding=utf-8


" Searching
set nowrapscan " 
set hlsearch " 검색어 강조, set hls 도 가능
set ignorecase
set smartcase " 대소문자 있으면 구분
set incsearch " 키워드 입력시 점진적 검색


set title
set mouse=a
set backspace=eol,start,indent "  줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로
set history=1000 "  vi 편집기록 기억갯수 .viminfo에 기록

" 마지막으로 수정된 곳에 커서를 위치함
" au BufReadPost *
" \ if line("'\"") > 0 && line("'\"") <= line("$") |
" \ exe "norm g`\"" |
" \ endif

set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\


" 구문 강조 사용
if has("syntax")
 syntax on
endif


" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" customize keymapping
map <Leader>c<space> <plug>NERDComToggleComment
map <Leader>cc <plug>NERDComComment


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['c', 'cpp', 'py'],'passive_filetypes': [] }
noremap <C-e>j :SyntasticCheck<CR>
noremap <C-e>f :SyntasticToggleMode<CR>


" vim-cpp-enhanced-highlight 관련 세팅
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let c_no_curly_error=1


" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'        " follow colorscheme
set laststatus=2 " turn on bottom bar

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }


" html5.vim configure
" Disable event-handler attributes support:
let g:html5_event_handler_attributes_complete = 0
" Disable RDFa attributes support:
let g:html5_rdfa_attributes_complete = 0
" Disable microdata attributes support:
let g:html5_microdata_attributes_complete = 0
" Disable WAI-ARIA attribute support:
let g:html5_aria_attributes_complete = 0


" python syntax highlight
let g:python_highlight_all = 1


" Easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" vim-indent_guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237






" nerdTree mapping
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" mapping about BUFFER
noremap <silent><C-left> :bprev<CR>
noremap <silent><C-h> :bprev<CR>
noremap <silent><C-right> :bnext<CR>
noremap <silent><C-l> :bnext<CR>

nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>l

" save file
nnoremap <F2> :w
inoremap <silent><C-w> <ESC>:w<CR>
nnoremap <silent><C-w> :w<CR>

nnoremap <silent><C-t> :wq<CR>

" esc mapping
inoremap <leader>qw <ESC>

" move in insert mode
inoremap <silent><C-h> <LEFT>
inoremap <silent><C-j> <DOWN>
inoremap <silent><C-k> <UP>
inoremap <silent><C-l> <RIGHT>

" Personal mapping
inoremap {<CR> {<CR>}<ESC>ko
set langmap=ㅁㅠㅊㅇㄷㄹㅎㅗㅓㅑㅏㅣㅡㅜㅐㅔㅂㄱㄴㅅㅕㅍㅈㅌㅛㅋ;abcdefghijklmnopqrstuvwxyz
nmap :start a/*************************************************<CR><BS>************************************************<CR>******************** Yuseok *********************<CR>******************** 190000 *********************<CR>*************************************************/<ESC>:include
nmap :main oint main() {<CR><CR><CR><CR><CR><CR><CR>return 0;<ESC>
nmap :include o#include <stdio.h><CR>#include <stdlib.h><CR><ESC>:main
nmap :comment o/**************************************************<CR><BS>*************************************************<CR>**************************************************/<CR><ESC>
nmap :change *cgn
nmap :html i<!DOCTYPE html><CR><html><CR><backspace><head><CR><CR><!-- metadata goes in the head --><CR><title></title><CR><CR><backspace></head><CR><body><CR><CR><!-- content goes in the body --><CR><CR></body><CR></html><ESC>
