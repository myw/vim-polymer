" Vim syntax fragment file
" Language:    Polymer HTML (included CSS)
" Maintainer:  Misha Wolfson <http://myw.github.io/>
" Authors:     Ben Davis <https://stackoverflow.com/cv/bendavis>,
"              Misha Wolfson <http://myw.github.io/>
" URL:         https://github.com/myw/vim-polymer
" Last Change: 2016-08-29

" Only meant to be included from within syntax/polymerhtml.vim

" ShadowDOM selectors
syn match shadowDomSelector "\s\+\(/deep/\|:host\|::shadow\|::content\)\s\+"

" Custom Elements
syn match customElement "\(^\|\s\)\zs\([a-z]\+-\)\+[a-z]\+\ze"

" CSS3 Custom properties
syn match cssCustomProp contained "\(^\|;\|\s\)\@<=--[a-zA-Z_][a-zA-Z0-9_-]*\>\(\s*:\s*{\)\@!"
syn match cssVendorProp contained "\(^\|;\|\s\)\@<=-[a-zA-Z_][a-zA-Z0-9_-]*\>"

" Polymer CSS mixins
syn match cssMixinName contained "\(^\|;\|\s\)\@<=--[a-zA-Z_][a-zA-Z0-9_-]*\>\(\s*:\s*{\)\@="
syn region cssMixinDefinition
    \ contained transparent fold
    \ matchgroup=cssBraces start="\(^\|;\|\s\)--[a-zA-Z_][a-zA-Z0-9_-]*\>:\s*\zs{" end="}"
    \ contains=cssDefinition,cssMixinName,cssAttrRegion,cssComment,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssHacks,cssNoise,cssMixinDefinition,cssMixinName,cssApplyRegion,cssApplyName,"cssValue.*",css.*Prop

syn region cssApplyRegion contained matchgroup=cssApplyName start="\(^\|\s\)@apply\s*(" end=")" oneline keepend

" Redefine cssAttrRegion to exclude mixin regions
syn clear cssDefinition
syn region cssDefinition
    \ transparent fold
    \ matchgroup=cssBraces start='{' end='}'
    \ contains=cssAttrRegion,cssComment,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssHacks,cssNoise,cssMixinDefinition,cssMixinName,cssApplyRegion,cssApplyName,"cssValue.*",css.*Prop

syn clear cssAttrRegion
syn region cssAttrRegion
    \ contained start=/:\(\s*{\)\@!/ end=/\ze\(;\|)\|}\)/
    \ contains=cssColor,cssImportant,cssValue,cssFunction,cssString,cssURL,cssComment,cssUnicodeEscape,cssVendor,cssError,cssAttrComma,cssNoise,cssString.*,"cssValue.*",css.*Attr

hi link polymerElement cssTagName
hi link customElement cssTagName
hi link cssMixinName cssClassName
hi link cssCustomProp cssProp
hi link cssVendorProp cssProp
hi link cssApplyName cssFunctionName
hi link cssApplyRegion cssFunction
hi link shadowDomSelector Special
