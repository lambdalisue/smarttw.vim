if exists('g:smarttw_loaded')
  finish
endif
let g:smarttw_loaded = 1

if get(g:, 'smarttw_startup', 1)
  call smarttw#enable()
endif
