# vim-save-next-file.vim

SaveNextFile creates a new file with a new, higher, numeric suffix.

Imagine you're working on a file and you want to quickly save a new copy.
This plugin will take the filename and generate a new name.

The old file will remain unchanged from the last, manual, save.
The new file will contain the, previously, unsaved changes.

## Examples

| Before    | After      |
| ----------|----------- |
| file      | file2      |
| file99    | file100    |
| file.cpp  | file2.cpp  |
| file3.cpp | file4.cpp  |

## Mapping

    nmap <silent> <F9> <Plug>SaveNextFile

## License

Copyright (c) Richard Russon (flatcap).
Distributed under the same terms as Vim itself.
See `:help license`.

## See also

- [flatcap.org](https://flatcap.org)
- [GitHub](https://github.com/flatcap/vim-save-next-file)

