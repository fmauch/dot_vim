" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Add your bundles here
Plugin 'SirVer/ultisnips'
Plugin 'Xuyuanp/nerdtree-git-plugin' " seems like this does not do much...
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'majutsushi/tagbar'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'nvie/vim-flake8'
Plugin 'oblitum/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rdnetto/YCM-Generator'
Plugin 'rhysd/vim-clang-format'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'suan/vim-instant-markdown'
Plugin 'taketwo/vim-ros'
Plugin 'tell-k/vim-autopep8'
Plugin 'tpope/vim-fugitive' " come back to this later
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

if iCanHazVundle == 0
  echo "Installing Vundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif

call vundle#end()
"must be last
filetype plugin indent on " load filetype plugins/indent settings
colorscheme solarized
syntax on                      " enable syntax

" Setting up Vundle - the vim plugin bundler end
