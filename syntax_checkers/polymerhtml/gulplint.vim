if exists('g:loaded_syntastic_polymerhtml_gulplint_checker')
  finish
endif
let g:loaded_syntastic_polymerhtml_gulplint_checker = 1

let s:save_cpo = &cpo
set cpo&vim


function! SyntaxCheckers_polymerhtml_gulplint_GetLocList() dict
  let makeprg = self.makeprgBuild({
    \   'args': 'lint --file',
    \ })

  let errorformat = ' line %l col %c %m,%P%f'

  let env = {}

  return SyntasticMake({
    \   'makeprg': makeprg,
    \   'errorformat': errorformat,
    \   'env': env,
    \ })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
  \   'filetype': 'polymerhtml',
  \   'name': 'gulplint',
  \   'exec': 'gulp',
  \ })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et fenc=utf-8 ff=unix sts=2 sw=2 ts=2 :

