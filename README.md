# :memo: Zhishi.vim｜知識.vim

Zhishi.vim is a minimalist Vim plugin to handle personal knowledge management (PKM). It can be used to create a simple personal wiki, Zettelkasten or digital notebook. The main goal of this plugin and its main difference to other competitors is that it tries to [KISS](https://en.wikipedia.org/wiki/KISS_principle).

Zhishi is the Chinese word for knowledge: 知識【zhī shì】

## Installation

Use the minimalist vim plugin manager [vim-plug](https://github.com/junegunn/vim-plug) to install zhishi.vim:

```vim
call plug#begin()

" ...

Plug 'elsenm/zhishi.vim'

" ...

call plug#end()
```
Make sure to also install any missing [dependencies](#dependencies).

### Dependencies

- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [ripgrep (rg)](https://github.com/BurntSushi/ripgrep)

## Usage

The following global variables **have to** be configured in your `.vimrc` file:
```vim
let g:zhishi_directory = "~/zettelkasten/"
let g:zhishi_index_file = "index"
let g:zhishi_template_file = ".template"
let g:zhishi_file_ending = "wiki"
```
The template file defined in `g:zhishi_template_file` **needs** to reside in the directory defined in `g:zhishi_directory` and have the file ending defined in `g:zhishi_file_ending`. In the example above its location and full name would be: `~/zettelkasten/.template.wiki`. The same applies to the index file defined in `g:zhishi_index_file`.

The following shows an example configuration of shortcuts covering all of the available commands:

```vim
nnoremap <leader>ni :ZhishiOpenIndex<CR>
nnoremap <leader>nn :ZhishiCreateNewNote<CR>
nnoremap <leader>nl :ZhishiInsertLink<CR>
nnoremap <leader>nL :ZhishiInsertLinkByTitle<CR>
nnoremap <Leader>no :ZhishiOpenNote<CR>
nnoremap <Leader>nO :ZhishiOpenNoteByTitle<CR>
```
**Note:** Default shortcuts are not configured by the plugin.

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
