" Automatically install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Add your bundles here
Plug 'SirVer/ultisnips'
"Plug 'Xuyuanp/nerdtree-git-plugin' " seems like this does not do much...
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'nvie/vim-flake8'
Plug 'oblitum/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fmauch/YCM-Generator'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown'
Plug 'taketwo/vim-ros'
Plug 'tpope/vim-surround'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-fugitive' " come back to this later
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

call plug#end()


let g:vimwiki_list = [{'path':'~/owncloud/vimwiki', 'path_html':'~/owncloud/vimwiki/export/html/'}]


" YouCompleteMe config
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_seed_identifiers_with_syntax = 1
" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>
map <Leader>gt :YcmCompleter GetType<CR>
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0

" Clang-format
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

" NERDTree
nmap <Leader>t :NERDTreeToggle<CR>

"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

" Yankstack

" vim-flake8
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=0
"autocmd BufWritePost *.py call Flake8()

call yankstack#setup()
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
