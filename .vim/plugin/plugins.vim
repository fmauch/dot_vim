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
Plug 'Chiel92/vim-autoformat'
Plug 'Rykka/riv.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'de-vri-es/vim-urscript'
Plug 'flazz/vim-colorschemes'
Plug 'fmauch/YCM-Generator', {'branch': 'develop'}
Plug 'fmauch/vim_snippets'
Plug 'fmauch/vim_snippets_ros'
Plug 'godlygeek/tabular'
Plug 'gu-fan/InstantRst'
Plug 'honza/vim-snippets'
Plug 'iberianpig/tig-explorer.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'ntpeters/vim-better-whitespace'
Plug 'oblitum/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pearofducks/ansible-vim'
Plug 'phenomenes/ansible-snippets'
Plug 'rbgrouleff/bclose.vim' " dependency for tig-explorer
Plug 'richq/vim-cmake-completion'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown'
Plug 'taketwo/vim-ros', {'branch': 'py3'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vimwiki/vimwiki'
" Testing area
" End Testing area
if has('nvim') || (v:version > 800)
  Plug 'neomake/neomake'
else
  Plug 'vim-syntastic/syntastic'
endif
Plug 'KabbAmine/zeavim.vim', {'on': [
			\	'Zeavim', 'Docset',
			\	'<Plug>Zeavim',
			\	'<Plug>ZVVisSelection',
			\	'<Plug>ZVKeyDocset',
			\	'<Plug>ZVMotion'
			\ ]}

if filereadable(glob('~/.vim_plugins_local'))
  source ~/.vim_plugins_local
endif
call plug#end()

" vimwiki
let private_wiki = {}
let private_wiki.path = '~/.vimwiki_private/'
let private_wiki.path_html = '~/.vimwiki_private/export/html/'
let work_wiki = {}
let work_wiki.path = '~/.vimwiki_work/'
let work_wiki.path_html = '~/.vimwiki_work/export/html/'
let g:vimwiki_list = [work_wiki, private_wiki]


" YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>
map <Leader>gt :YcmCompleter GetType<CR>
map <Leader>F :YcmCompleter FixIt<CR>
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0

nmap <Leader>C :Autoformat<CR>
vmap <Leader>C :Autoformat<CR>

" CTRLP
let g:ctrlp_root_markers = ['source_local.sh', 'setup_local.sh', '.ctrlp.stop']
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
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
:let g:notes_directories = ['~/.vim-notes']

if has('nvim')
  call neomake#configure#automake('rw', 500)
  let g:neomake_python_enabled_makers = ['pylint']
  augroup my_neomake_signs
      au!
      autocmd ColorScheme *
          \ hi NeomakeErrorSign ctermfg = red |
          \ hi NeomakeWarningSign ctermfg = yellow
  augroup END
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
nmap <C-w>1 <Plug>AirlineSelectTab1
nmap <C-w>2 <Plug>AirlineSelectTab2
nmap <C-w>3 <Plug>AirlineSelectTab3
nmap <C-w>4 <Plug>AirlineSelectTab4
nmap <C-w>5 <Plug>AirlineSelectTab5
nmap <C-w>6 <Plug>AirlineSelectTab6
nmap <C-w>7 <Plug>AirlineSelectTab7
nmap <C-w>8 <Plug>AirlineSelectTab8
nmap <C-w>9 <Plug>AirlineSelectTab9


" Setup okular to work with vimtex correctly
if has('nvim')
  let g:vimtex_compiler_progname = 'nvr'
endif
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

function! s:colorscheme_customize() abort
  call Base16hi("MatchParen", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold,italic", "")
  :hi SpellBad ctermfg=NONE ctermbg=NONE cterm=underline
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:colorscheme_customize()
augroup END

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Setup Zeal plugin
let g:zv_file_types = {
                \    'yaml.ansible'             : 'ansible',
                \ }


noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>

let g:instant_markdown_autostart = 1

" Tabular remaps
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a, :Tabularize /,\zs<CR>
  vmap <Leader>a, :Tabularize /,\zs<CR>
  nmap <Leader>a<< :Tabularize /<<<CR>
  vmap <Leader>a<< :Tabularize /<<<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" open tig with Project root path
nnoremap <Leader>T :TigOpenProjectRootDir<CR>

nmap <Leader>M :Make<CR>

let g:ros_build_system = 'catkin-tools'
