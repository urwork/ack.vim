if exists('g:loaded_ack') || &cp
  finish
endif

if !exists("g:ack_default_options")
  let g:ack_default_options = " -s -H --nopager --nocolor --nogroup --column"
endif

" Location of the ack utility
if !exists("g:ackprg")
  if executable('ack-grep')
    let g:ackprg = "ack-grep"
  elseif executable('ack')
    let g:ackprg = "ack"
  else
    finish
  endif
  let g:ackprg .= g:ack_default_options
endif

if !exists("g:ack_apply_qmappings")
  let g:ack_apply_qmappings = !exists("g:ack_qhandler")
endif

if !exists("g:ack_apply_lmappings")
  let g:ack_apply_lmappings = !exists("g:ack_lhandler")
endif

let s:ack_mappings = {
      \ "t": "<C-W><CR><C-W>T",
      \ "T": "<C-W><CR><C-W>TgT<C-W>j",
      \ "o": "<CR>",
      \ "O": "<CR><C-W>p<C-W>c",
      \ "go": "<CR><C-W>p",
      \ "h": "<C-W><CR><C-W>K",
      \ "H": "<C-W><CR><C-W>K<C-W>b",
      \ "v": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t",
      \ "gv": "<C-W><CR><C-W>H<C-W>b<C-W>J" }

if exists("g:ack_mappings")
  let g:ack_mappings = extend(s:ack_mappings, g:ack_mappings)
else
  let g:ack_mappings = s:ack_mappings
endif

if !exists("g:ack_qhandler")
  let g:ack_qhandler = "botright copen"
endif

if !exists("g:ack_lhandler")
  let g:ack_lhandler = "botright lopen"
endif

if !exists("g:ackhighlight")
  let g:ackhighlight = 0
endif

if !exists("g:ack_autoclose")
  let g:ack_autoclose = 0
endif

if !exists("g:ack_autofold_results")
  let g:ack_autofold_results = 0
endif

if !exists("g:ack_use_cword_for_empty_search")
  let g:ack_use_cword_for_empty_search = 1
endif

command! -bang -nargs=* -complete=file AG           call ack#AG('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=file AGAdd        call ack#AG('grepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file AGFromSearch call ack#AGFromSearch('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LAG          call ack#AG('lgrep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LAGAdd       call ack#AG('lgrepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file AGFile       call ack#AG('grep<bang> -g', <q-args>)
command! -bang -nargs=* -complete=help AGHelp       call ack#AGHelp('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=help LAGHelp      call ack#AGHelp('lgrep<bang>', <q-args>)
command! -bang -nargs=*                AGWindow     call ack#AGWindow('grep<bang>', <q-args>)
command! -bang -nargs=*                LAGWindow    call ack#AGWindow('lgrep<bang>', <q-args>)

let g:loaded_ack = 1

" vim:set et sw=2 ts=2 tw=78 fdm=marker
