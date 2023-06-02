" ------------------------------------------------------
" Created By : sdo
" File Name : txt.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-06-02 22:15:42
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.366
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

if !CheckValue('g:my_auto_DeleteTrailingWS')
	:q
else
	let cur = "."..expand("<sfile>:t:r") " this file ref for extension comp
	let fext= "."..expand("%:e") " opened file extension
	let $FEX= "*."..expand("<sfile>:t:r")

	if cur == fext
		autocmd BufWritePre,FileWritePre $FEX  :call DeleteTrailingWS()
		echo "DeleteTrailingWS() enabled..."
	endif
endif

function! DeleteTrailingWS()
	exe "normal! mz"
	%s/\s\+$//ge
	exe "normal! 'z"
endfunction
