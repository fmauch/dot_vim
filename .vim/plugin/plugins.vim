" Automatically install vim-plug if not present
if has('nvim')
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.config/nvim/plugged')
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.vim/plugged')
endif



"Add your bundles here
Plug 'SirVer/ultisnips'
"Plug 'Xuyuanp/nerdtree-git-plugin' " seems like this does not do much...
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'ntpeters/vim-better-whitespace'
Plug 'oblitum/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fmauch/YCM-Generator', {'branch': 'develop'}
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown'
Plug 'taketwo/vim-ros'
Plug 'tpope/vim-surround'
Plug 'tell-k/vim-autopep8'
"Plug 'tpope/vim-fugitive' " come back to this later
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/DoxygenToolkit.vim'
if has('nvim') || (v:version > 800)
  Plug 'neomake/neomake'
else
  Plug 'vim-syntastic/syntastic'
endif
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'lervag/vimtex'

call plug#end()


let g:vimwiki_list = [{'path':'~/Nextcloud/vimwiki', 'path_html':'~/Nextcloud/vimwiki/export/html/'}]


" YouCompleteMe config
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_seed_identifiers_with_syntax = 1
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
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
let g:tagbar_autoclose = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
set runtimepath+=~/.vim/snippet_repos/vim_snippets
set runtimepath+=~/.vim/snippet_repos/vim_snippets_ros
"let g:UltiSnipsSnippetsDir="~/.vim/snippet_repos/vim_snippets"
"let g:UltiSnipsSnippetDirectories="[~/.vim/snippet_repos/vim_snippets_ros]"

" NERDTree
function! ToggleNERDTreeFind()
    if g:NERDTree.IsOpen()
        execute ':NERDTreeClose'
    else
        execute ':NERDTreeFind'
    endif
endfunction
nmap <Leader>t :call ToggleNERDTreeFind()<CR>

"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

" Yankstack
call yankstack#setup()
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Syntastic
map <F7> :SyntasticCheck<CR>

" Autopep8
let g:autopep8_max_line_length=99
let g:autopep8_aggressive=2
let g:autopep8_indent_size=4
autocmd FileType python set equalprg=autopep8\ -


" DoxygenToolkit
let g:DoxygenToolkit_briefTag_pre="\\brief "
let g:DoxygenToolkit_paramTag_pre="\\param "
let g:DoxygenToolkit_returnTag="\\returns "
let g:DoxygenToolkit_fileTag="\\file "
let g:DoxygenToolkit_authorTag="\\author "
let g:DoxygenToolkit_dateTag="\\date "
let g:DoxygenToolkit_versionTag="\\version "
let g:DoxygenToolkit_classTag="\\class "
let g:DoxygenToolkit_blockTag="\\name "
let g:DoxygenToolkit_startCommentTag="/*! "
let g:DoxygenToolkit_startCommentBlock="/* "

" Notes directory
:let g:notes_directories = ['~/Documents/Notes']

if has('nvim')
  call neomake#configure#automake('w')
endif
