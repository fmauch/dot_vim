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

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction


"Add your bundles here
Plug 'Chiel92/vim-autoformat'
Plug 'Rykka/riv.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'de-vri-es/vim-urscript'
Plug 'dense-analysis/ale'
Plug 'flazz/vim-colorschemes'
Plug 'fmauch/vim_snippets'
Plug 'fmauch/vim_snippets_ros'
Plug 'godlygeek/tabular'
Plug 'gu-fan/InstantRst'
Plug 'honza/vim-snippets'
Plug 'iberianpig/tig-explorer.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pearofducks/ansible-vim'
Plug 'phenomenes/ansible-snippets'
Plug 'rbgrouleff/bclose.vim' " dependency for tig-explorer
Plug 'richq/vim-cmake-completion'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'taketwo/vim-ros'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vimwiki/vimwiki'

source ~/.vim/plugin/coc.vim

if executable('latex')
  Plug 'lervag/vimtex'
  " Setup okular to work with vimtex correctly
  if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
  endif
  let g:vimtex_view_general_viewer = 'okular'
  let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
  let g:vimtex_view_general_options_latexmk = '--unique'
endif

if executable('cargo')
  Plug 'euclio/vim-markdown-composer', {'do': 'cargo build --release', 'for': 'markdown'}
endif
" Testing area
" End Testing area

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

let g:ale_echo_msg_format = '%linter% says %s'
let b:ale_linters = {'cpp': ['clangtidy', 'cppcheck']}
let b:ale_fixers = {'cpp': ['clangtidy']}

" vimwiki
let private_wiki = {}
let private_wiki.path = '~/.vimwiki_private/'
let private_wiki.path_html = '~/.vimwiki_private/export/html/'
let work_wiki = {}
let work_wiki.path = '~/.vimwiki_work/'
let work_wiki.path_html = '~/.vimwiki_work/export/html/'
let g:vimwiki_list = [work_wiki, private_wiki]


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
let g:formatters_java = ['clangformat']


" fzf.vim
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
let g:fzf_layout = { 'down': '50%' }

map <C-n> :BTags<CR>
map <C-s> :Rg<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>bc :BCommits<CR>
map <C-p> :Files<CR>

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

let g:tex_flavor = 'latex'


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

"let g:ros_build_system = 'catkin-tools'
