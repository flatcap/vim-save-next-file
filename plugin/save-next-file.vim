" save-next-file.vim - Increase the file's suffix number and save it
" Author:       Rich Russon (flatcap) <rich@flatcap.org>
" Website:      https://flatcap.org
" Copyright:    2014-2015 Richard Russon
" License:      GPLv3 <http://fsf.org/>
" Version:      1.0

" Before        After
" ------------------------
" file          file2
" file99        file100
" file.cpp      file2.cpp
" file3.cpp     file4.cpp

if exists("g:loaded_save_next_file") || &cp || v:version < 700
	finish
endif
let g:loaded_save_next_file = 1

function! s:get_number(str)
	return substitute (a:str, '^.*[^0-9]', '', '')
endfunction

function! s:SaveNextFile()
	let file   = expand('%')
	let suffix = ''
	let number = s:get_number(file)

	if (empty(number))
		let stem   = expand('%:r')
		let suffix = expand('%:e')
		let newnum = 2

		if (!empty (suffix))
			let suffix = '.'.suffix
			let number = s:get_number (stem)
			if (!empty (number))
				let stem   = strpart(stem, 0, len(stem)-len(number))
				let newnum = number+1
			endif
		endif
	else
		let stem   = strpart(file, 0, len(file)-len(number))
		let newnum = number+1
	endif
	execute 'saveas '.stem.newnum.suffix
endfunction

nnoremap <silent> <Plug>SaveNextFile :call <SID>SaveNextFile()<CR>

" vim:set noet ts=8 sw=8:
