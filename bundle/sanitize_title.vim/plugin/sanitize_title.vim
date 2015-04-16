" Made by Pavel Vodrážka by editing diacritics.vim plugin (http://vim.wikia.com/wiki/Remove_diacritical_signs_from_characters).
" Sanitize titles of webpages to be used as URLs (in specified range of lines).
" Convert to lowercase.
" Remove diacritical signs from characters.
" Remove offending characters.
" Replace spaces with dashes.
function! s:SanitizeTitles(line1, line2)
  let diacs = 'áčďéěíňóřšťúůýž'  " lowercase diacritical signs
  let repls = 'acdeeinorstuuyz'  " corresponding replacements
  let text1 = join(getline(a:line1, a:line2), "\n")
  let text2 = tolower(text1)
  let text3 = tr(text2, diacs, repls)
  let text4 = substitute(text3, "[().,;:?!]", "", "g")
  let text5 = substitute(text4, "\\s\\+", "-", "g")
  call setline(a:line1, split(text5, "\n"))
endfunction
command! -range=% SanitizeTitles call s:SanitizeTitles(<line1>, <line2>)
