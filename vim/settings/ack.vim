let g:ackprg="ack -H --nocolor --nogroup --column"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
