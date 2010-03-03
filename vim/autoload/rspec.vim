"whack something similar to these in your ~/.vimrc to run specs related to
"current file with ,s, and to jump from spec to code and vice-versa with ,j
" map <Leader>s :!spec -f n <C-R>=SpecFileName() <CR> <CR>
" map <Leader>j :vs <C-R>=SpecOrCodeToggle() <CR> <CR>


" finds the spec related to the current file (or the current file if it is a
" spec)
function! SpecFileName()
  let filename = getreg("%")
  if filename =~ 'spec/.*_spec\.rb$'
    return filename
  elseif filename =~ 'app/.*\.rb$'
    let filename = substitute(filename, 'app/', "spec/","")
    return substitute(filename, '.rb$', "_spec.rb","")
  elseif filename =~ 'lib/.*\.rb$'
    let filename = substitute(filename, 'lib/', "spec/lib/","")
    return substitute(filename, '.rb$', "_spec.rb","")
  else
    return ""
  endif
endfunction

" works out code file related to spec, and vice versa
function! SpecOrCodeToggle()
  let filename = getreg("%")
  if filename =~ 'spec/lib/.*_spec\.rb$'
    let filename = substitute(filename, 'spec/lib', "lib/","")
    return substitute(filename, '_spec.rb$', ".rb","")
  elseif filename =~ 'spec/.*_spec\.rb$'
    let filename = substitute(filename, 'spec/', "app/","")
    return substitute(filename, '_spec.rb$', ".rb","")
    return filename
  elseif filename =~ 'app/.*\.rb$'
    let filename = substitute(filename, 'app/', "spec/","")
    return substitute(filename, '.rb$', "_spec.rb","")
  elseif filename =~ 'lib/.*\.rb$'
    let filename = substitute(filename, 'lib/', "spec/lib/","")
    return substitute(filename, '.rb$', "_spec.rb","")
  else
    return ""
  endif
endfunction
