" MIT License
" 
" Copyright (c) 2022 Marvin Elsen <contact@marvin-elsen.com>
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

function! zhishi#OpenIndex()
    execute 'cd' fnameescape(g:zhishi_directory)
    execute 'edit' fnameescape(g:zhishi_directory . g:zhishi_index_file . '.' . g:zhishi_file_ending)
endfunction

function! zhishi#CreateNewNote()
    let noteName = g:zhishi_directory . strftime('%Y%m%d%H%M%S') . '.' . g:zhishi_file_ending
    execute 'cd' fnameescape(g:zhishi_directory)
    execute 'edit' fnameescape(noteName)
    execute '0read' fnameescape(g:zhishi_directory . g:zhishi_template_file . '.' . g:zhishi_file_ending)
    call zhishi#UpdateMetadata()
endfunction

function! zhishi#UpdateMetadata()
    let save_pos = getpos(".")

    " Update last modified timestamp to current date
    :%s/^modified:\s\+\zs.*/\=strftime('%Y-%m-%d')/e

    " Replace <NOW> placeholder in template note with current date
    :%s/<NOW>/\=strftime('%Y-%m-%d')/e

    " Replace title <ID> in note file with filename
    " Replaces hyphens (-) and underscores (_) and converts to Title Case
    " Example: long-filename_with-symbols.md => Long Filename With Symbols
    :%s/^id:\s\+\zs.*/\=substitute(substitute(expand('%:t:r'),
                \ '[-_]', ' ', 'g'), '\<\(\w\)\(\w*\)\>', '\u\1\L\2', 'g')/e

    call setpos('.', save_pos)
endfunction

function! zhishi#InsertLink(file)
    let filename = split(fnameescape(a:file), ':')
    let id = filename[0]
    let link = '[[' . id . ']]'
    execute 'normal! a' . link
endfunction
