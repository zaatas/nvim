
vim.cmd([[
  let g:neoterm_size = ""
  let g:neoterm_autoinsert = '1'
  let g:neoterm_autoscroll = '1'
  let g:neoterm_default_mod = 'vertical'

  cnoreabbrev ntv vertical   Tnew<CR>
  cnoreabbrev nts belowright Tnew<CR>

  cnoreabbrev ntn Tnext <CR>
  cnoreabbrev ntp Tprevious <CR>

  function! IsNumber(isnum)
    let rtn = 1
    let ntest = a:isnum =~ '[^0-9]' ? "NO" : "YES"
    if ntest == 'NO'
       let rtn = 0
    endif
    return rtn
  endfunction

  " refactor these some day
  command! -nargs=1 TCLEAR call TermClear(<f-args>)
  function! TermClear( terminal )
    let cmd = ""
    if IsNumber(a:terminal)
      let cmd = a:terminal . 'Tclear'
    else
      echo 'Enter valid Termenal'
      return
    endif

    exe cmd
    return
  endfunction
  cnoreabbrev tclear TCLEAR

  command! -nargs=1 TCLOSE call TermClose(<f-args>)
  function! TermClose( terminal )
    let cmd = ""
    let t = a:terminal

    if t == 'all'
       let cmd = 'TcloseAll'
    else
       let cmd = t . 'Tclose'
    endif

    exe cmd
    return
  endfunction
  cnoreabbrev tclose TCLOSE

  command! -nargs=1 TKILL call TermKill(<f-args>)
  function! TermKill( terminal )
    let cmd = ""
    let t = a:terminal

    if t == 'all'
       let cmd = 'TcloseAll!'
    else
       let cmd = 'Tclose!'
    endif

    exe cmd
    return
  endfunction
  cnoreabbrev tkill TKILL

  command! -nargs=1 TOPEN call TermOpen(<f-args>)
  function! TermOpen( terminal )
    let cmd = a:terminal . 'Topen'
    exe cmd
    return
  endfunction
  cnoreabbrev topen TOPEN

  command! -nargs=* TCMD call TermCmd(<f-args>)
  function! TermCmd( terminal, ... )
    let cmd = ""
    let t = a:terminal
    let c = join(a:000)

    let ntest = t =~ '[^0-9]' ? "NO" : "YES"
    if ntest == 'NO'
       let c = t . " " . c
       let t = ""
    endif

    let cmd = t . "T " . c
    ""echo cmd
    exe cmd
    return
  endfunction
  cnoreabbrev tc TCMD

  command! -nargs=* TELIXIR call TermElixir(<f-args>)
  function! TermCmd( terminal )
    let cmd = ""
    let t = a:terminal

    let ntest = t =~ '[^0-9]' ? "NO" : "YES"
    if ntest == 'NO'
       let t = ""
    endif

    let cmd = 'TREPLSetTerm ' . t . ' | ' . t . 'T iex -S mix'
    echo cmd
    exe cmd

  return
  endfunction
  cnoreabbrev telixir TCMD
]])
