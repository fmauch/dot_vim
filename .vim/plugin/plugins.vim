if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Add your bundles here
Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin' " seems like this does not do much...
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'nvie/vim-flake8'
Plug 'oblitum/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rdnetto/YCM-Generator'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown'
Plug 'taketwo/vim-ros'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-fugitive' " come back to this later
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

call plug#end()
