function! FuckOffOldPartials()
  call GetRidOfPartialsWithLocals()
  call GetRidOfPartialsWithoutLocals()
  
endfunction

function! GetRidOfPartialsWithLocals()
  if search(':partial.*:locals') != 0
    :%s/:partial => \(\(['"]\)[^\2]*\2, \):locals => {\(.*\)}/\1\3/
  end
endfunction

function! GetRidOfPartialsWithoutLocals()
  if search(':partial ') != 0
    :%s/render \zs:partial => \ze\(.*:collection\)\@!//
  end
endfunction


