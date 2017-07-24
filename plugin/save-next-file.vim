" save-next-file.vim - Increase the file's suffix number and save it
" Author:       Rich Russon (flatcap) <rich@flatcap.org>
" Website:      https://flatcap.org
" Copyright:    2014-2017 Richard Russon
" License:      GPLv3 <http://fsf.org/>
" Version:      1.1

if (exists ('g:loaded_save_next_file') || &cp || (v:version < 700))
	finish
endif
let g:loaded_save_next_file = 1

" Before        After
" ------------------------
" file          file2
" file99        file100
" file.cpp      file2.cpp
" file3.cpp     file4.cpp

function! s:get_number (str)
	return substitute (a:str, '^.*[^0-9]', '', '')
endfunction

function! s:SaveNextFile()
	let l:file   = expand ('%')
	let l:suffix = ''
	let l:number = s:get_number (l:file)

	if (empty (l:number))
		let l:stem   = expand ('%:r')
		let l:suffix = expand ('%:e')
		let l:newnum = 2

		if (!empty (l:suffix))
			let l:suffix = '.' . l:suffix
			let l:number = s:get_number (l:stem)
			if (!empty (l:number))
				let l:stem   = strpart (l:stem, 0, len (l:stem) - len (l:number))
				let l:newnum = l:number + 1
			endif
		endif
	else
		let l:stem   = strpart (l:file, 0, len (l:file) - len (l:number))
		let l:newnum = l:number + 1
	endif
	
	let l:filename = l:stem . l:newnum . l:suffix
	while (filereadable(l:filename))
		let l:newnum = l:newnum + 1
		let l:filename = l:stem . l:newnum . l:suffix
	endwhile

	execute 'saveas ' . l:stem . l:newnum . l:suffix
endfunction


nnoremap <silent> <Plug>SaveNextFile :call <SID>SaveNextFile()<CR>

