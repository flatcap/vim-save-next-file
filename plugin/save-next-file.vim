" save-next-file.vim - Increase the file's suffix number and save it
" Author:       Rich Russon (flatcap) <rich@flatcap.org>
" Website:      https://flatcap.org
" Copyright:    2014-2026 Richard Russon
" License:      GPLv3 <http://fsf.org/>
" Version:      1.2

if exists('g:loaded_save_next_file') || &cp || v:version < 700
	finish
endif
let g:loaded_save_next_file = 1

" Before        After
" ------------------------
" file          file2
" file99        file100
" file.cpp      file2.cpp
" file3.cpp     file4.cpp

function! s:get_number(str) abort
	return substitute(a:str, '^.*[^0-9]', '', '')
endfunction

function! s:SaveNextFile() abort
	let file = expand('%')
	if empty(file)
		echohl ErrorMsg
		echo 'SaveNextFile: buffer has no filename'
		echohl None
		return
	endif
	let suffix = ''
	let number = s:get_number(file)

	if empty(number)
		let stem = expand('%:r')
		let suffix = expand('%:e')
		let newnum = 2

		if !empty(suffix)
			let suffix = '.' . suffix
			let number = s:get_number(stem)
			if !empty(number)
				let stem = strpart(stem, 0, len(stem) - len(number))
				let newnum = number + 1
			endif
		endif
	else
		let stem = strpart(file, 0, len(file) - len(number))
		let newnum = number + 1
	endif

	let filename = stem . newnum . suffix
	let max = newnum + 10000
	while filereadable(filename) && newnum < max
		let newnum = newnum + 1
		let filename = stem . newnum . suffix
	endwhile
	if newnum >= max
		echohl ErrorMsg
		echo 'SaveNextFile: could not find an available filename'
		echohl None
		return
	endif

	execute 'saveas ' . fnameescape(filename)
endfunction

nnoremap <silent> <Plug>SaveNextFile :call <SID>SaveNextFile()<CR>
