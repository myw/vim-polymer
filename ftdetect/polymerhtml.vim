au BufNewFile,BufRead *polymer*htm* setf polymerhtml

fun! s:SelectPolymerFiletype()
  let n = 1
  while n < 50 && n <= line("$")
    " check for signs of Polymer: polymer.html
    if getline(n) =~ 'polymer/polymer\S*.html\|webcomponentsjs/webcomponents'
      set ft=polymerhtml
      return
    endif
    let n = n + 1
  endwhile
endfun
au BufNewFile,BufRead *.html,*.htm call s:SelectPolymerFiletype()

" vim: set et fenc=utf-8 ff=unix sts=2 sw=2 ts=2 :
