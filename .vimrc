set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
"Plugin 'Valloric/YouCompleteMe' " I use a fork currently
Plugin 'SirVer/ultisnips'
Plugin 'Xuyuanp/nerdtree-git-plugin' " seems like this does not do much...
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'majutsushi/tagbar'
Plugin 'oblitum/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rdnetto/YCM-Generator'
Plugin 'rhysd/vim-clang-format'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'suan/vim-instant-markdown'
Plugin 'taketwo/vim-ros'
Plugin 'tpope/vim-fugitive' " come back to this later
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set expandtab
set shiftwidth=2
set softtabstop=2
set relativenumber
set number
set hlsearch " highlight all matches
set incsearch " search on each character
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set ignorecase    " with combination of smartcase!
set smartcase     " /hello will match HeLlO and hello, /hEllo will only match hEllo 


syntax enable
let g:vimwiki_list = [{'path':'~/owncloud/vimwiki', 'path_html':'~/owncloud/vimwiki/export/html/'}]


" YouCompleteMe config
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_seed_identifiers_with_syntax = 1
" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>
map <Leader>gt :YcmCompleter GetType<CR>


let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0


let g:clang_format#command = 'clang-format-3.8'
let g:clang_format#detect_style_file = 1
nmap <Leader>C :ClangFormat<CR>

" NERDCommenter
map <C-d> :call NERDComment(0,"toggle")<CR>

" CTRLP
let g:ctrlp_root_markers = ['source_local.sh', '.ctrlp.stop']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|node_modules|devel|build|.git)',
  \ 'file': '\v\.(exe|so|dll)$|.pyc$',
  \ }
let g:ctrlp_show_hidden = 1
map <C-n> :CtrlPBufTag<CR>

" Tagbar
nmap <C-t> :TagbarToggle<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" access global clipboard through ctrl-shift-c/v
imap <C-S-v> <Esc>"+p
vmap <C-S-c> "+y

" NERDTree
nmap <Leader>t :NERDTreeToggle<CR>

"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1


" vim-flake8
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
autocmd BufWritePost *.py call Flake8()

" Misc editing options
" Highlight trailing spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
" Switch on spelling
setlocal spell spelllang=en_us
:hi SpellBad ctermfg=red ctermbg=gray cterm=underline
" Move display lines in wrapped text
set virtualedit=
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>

set runtimepath+=~/dotfiles/vim_snippets
autocmd BufNewFile, BufRead *.launch setfiletype xml
set wildmode=longest,list,full
set wildmenu


nmap <F5> :CopyDefinition<CR>
nmap <F6> :ImplementDefinition<CR>
command! CopyDefinition :call s:GetDefinitionInfo()
command! ImplementDefinition :call s:ImplementDefinition()
function! s:GetDefinitionInfo()
  exe 'normal ma'
  " Get class
  call search('^\s*\<class\>', 'b')
  exe 'normal ^w"ayw'
  let s:class = @a
  let l:ns = search('^\s*\<namespace\>', 'b')
  " Get namespace
  if l:ns != 0
    exe 'normal ^w"ayw'
    let s:namespace = @a
  else
    let s:namespace = ''
  endif
  " Go back to definition
  exe 'normal `a'
  exe 'normal "aY'
  let s:defline = substitute(@a, ';\n', '', '')
endfunction
 
function! s:ImplementDefinition()
  call append('.', s:defline)
  exe 'normal j'
  " Remove keywords
  s/\<virtual\>\s*//e
  s/\<static\>\s*//e
  if s:namespace == ''
    let l:classString = s:class . "::"
  else
    let l:classString = s:namespace . "::" . s:class . "::"
  endif
  " Remove default parameters
  s/\s\{-}=\s\{-}[^,)]\{1,}//e
  " Add class qualifier
  exe 'normal ^f(bi' . l:classString
  " Add brackets
  exe "normal $o{\<CR>\<TAB>\<CR>}\<CR>\<ESC>kkkk"
  " Fix indentation
  exe 'normal =4j^'
endfunction
