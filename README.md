# save-next-file.vim

SaveNextFile creates a new file with a new, higher, numeric suffix.

Imagine you're working on a file and you want to quickly save a new copy.
This plugin will take the filename and generate a new name.

The old file will remain unchanged from the last, manual, save.
The new file will contain the, previously, unsaved changes.

Note: Existing files will be skipped.

After saving, the current buffer switches to the new file.
The old file remains unchanged on disk.

This plugin works with both Vim and Neovim.

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'flatcap/vim-save-next-file'
```

Using Vim's native packages:

```sh
git clone https://github.com/flatcap/vim-save-next-file \
  ~/.vim/pack/plugins/start/vim-save-next-file
```

## Examples

| Before    | After      |
| :-------- | :--------- |
| file      | file2      |
| file99    | file100    |
| file.cpp  | file2.cpp  |
| file3.cpp | file4.cpp  |

## Mapping

Map `<Plug>SaveNextFile` to a key of your choice, for example:

    nmap <silent> <F9> <Plug>SaveNextFile

## License

Copyright &copy; 2014-2026 Richard Russon (flatcap).
Distributed under the GPLv3 <http://fsf.org/>

## See also

- [flatcap.org](https://flatcap.org)
- [GitHub](https://github.com/flatcap/vim-save-next-file)

