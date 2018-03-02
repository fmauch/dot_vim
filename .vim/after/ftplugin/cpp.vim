" Copy definition of a function in C++
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
  " Find end of function declaration
  call search(';$')
  exe 'normal mb'
  " Find beginning of function TODO: This may lead to errors?
  call search('(', 'b')
  call search('template', 'b', line('.') - 1)
  " Copy function definition
  exe 'normal ^ma'
  exe 'normal `a'
  exe 'normal "ay`b`'
  let s:defline = substitute(@a, '\n', '', '')
endfunction

function! s:ImplementDefinition()
  exe 'normal o'
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
  exe "normal o{\<CR>}\<ESC>kk"
  " Format it
  call clang_format#replace(line('.') - 2,line('.'))
  call search('{')
endfunction
