" Vim syntax file
" Language:    Polymer HTML
" Maintainer:  Misha Wolfson <http://myw.github.io/>
" Authors:     Ben Davis <https://stackoverflow.com/cv/bendavis>,
"              Misha Wolfson <http://myw.github.io/>
" URL:         https://github.com/myw/vim-polymer
" Last Change: 2016-08-29

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'polymerhtml'
endif

runtime! syntax/html.vim
unlet b:current_syntax

runtime! syntax/polymerelements.vim
runtime! syntax/polymercss.vim

" Less strict highlighting on element attributes
syn match htmlArg contained "\<[-a-zA-Z0-9]\+[ $=>]"me=e-1

syn region polymerBoundVarRegion matchgroup=Delimiter start="{{" end="}}" keepend
syn sync match polymerBoundVarRegionSync grouphere polymerBoundVarRegion "^\s*{{\s*$"
syn sync match polymerBoundVarRegionSync grouphere NONE "^\s*}}\s*$"

syn region polymerOneWayBoundVarRegion matchgroup=Delimiter start="\[\[" end="\]\]" keepend
syn sync match polymerOneWayBoundVarRegionSync grouphere polymerOneWayBoundVarRegion "^\s*\[\[\s*$"
syn sync match polymerOneWayBoundVarRegionSync grouphere NONE "^\s*\]\]\s*$"

syn cluster htmlPreproc add=polymerBoundVarRegion
syn cluster htmlPreproc add=polymerOneWayBoundVarRegion
hi link polymerBoundVarRegion Special
hi link polymerOneWayBoundVarRegion Special

let b:current_syntax = 'polymerhtml'

if main_syntax == 'polymerhtml'
  unlet main_syntax
endif

" vim: set et fenc=utf-8 ff=unix sts=2 sw=2 ts=2 :
