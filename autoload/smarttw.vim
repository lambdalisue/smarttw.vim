function! smarttw#enable() abort
  silent! unlet! b:smarttw
  call s:enter()
endfunction

function! smarttw#disable() abort
  silent! unlet! b:smarttw
  setlocal colorcolumn=
  augroup smarttw
    autocmd!
  augroup END
endfunction

function! s:enter(...) abort
  if get(b:, 'smarttw')
    return
  endif
  setlocal colorcolumn=
  augroup smarttw
    autocmd!
    autocmd InsertEnter * call s:leave()
  augroup END
endfunction

function! s:leave() abort
  if get(b:, 'smarttw')
    return
  endif
  if &textwidth
    execute printf('setlocal colorcolumn=%d', &textwidth - 1)
  endif
  augroup smarttw
    autocmd!
    autocmd InsertLeave * call s:enter()
  augroup END
endfunction
