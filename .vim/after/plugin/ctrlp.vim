let g:ctrlp_root_markers = ['source_local.sh', '.ctrlp.stop']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|node_modules|devel|build|.git)',
  \ 'file': '\v\.(exe|so|dll)$|.pyc$',
  \ }
let g:ctrlp_show_hidden = 1
map <C-n> :CtrlPBufTag<CR>
