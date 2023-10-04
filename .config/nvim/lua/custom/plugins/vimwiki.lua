return {
  'vimwiki/vimwiki',
  init = function()
    vim.g.vimwiki_list = {
      {
        path = '~/.vimwiki_private/',
        path_html = '~/.vimwiki_private/export/html/',
        syntax = 'markdown',
        ext = '.md',
      },
      {
        path = '~/.vimwiki_work/',
        path_html = '~/.vimwiki_work/export/html/',
        syntax = 'markdown',
        ext = '.md',
      }
    }
    vim.g.vimwiki_global_ext = 0
  end,
}
