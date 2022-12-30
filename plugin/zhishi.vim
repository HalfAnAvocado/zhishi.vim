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

command! ZhishiOpenIndex call zhishi#OpenIndex()

command! ZhishiCreateNewNote call zhishi#CreateNewNote()

command! -nargs=* ZhishiOpenNote call fzf#vim#grep('rg --column --line-number --no-heading --no-messages --with-filename --color=always --smart-case -- ' . shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--reverse --prompt "Open Note: "'}), 0)
command! ZhishiOpenNoteByTitle :ZhishiOpenNote ^title:

command! -nargs=* ZhishiInsertLink call fzf#vim#grep('rg --column --line-number --no-heading --no-messages --with-filename --color=always --smart-case -- ' . shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--reverse --prompt "Insert Link: "', 'sink': function('zhishi#InsertLink')}), 0)
command! ZhishiInsertLinkByTitle :ZhishiInsertLink ^title:
