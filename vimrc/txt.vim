" ------------------------------------------------------
" Created By : sdo
" File Name : txt.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-05-25 02:55:30
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.25
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

echom "We load file"
echo "-----------------------------------------"

function! GetPotionFold(lnum)
	if getline(a:lnum) =~? '\v^\s*$'
		return '-1'
	endif

	return '0'
endfunction
      
function! IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction

let $FEX= "*."..expand("<sfile>:t:r")
"autocmd BufNewFile,FileWritePre * :call DeleteTrailingWS()
autocmd BufWritePre,FileWritePre $FEX  :call DeleteTrailingWS()

function! DeleteTrailingWS()
	exe "normal! mz"
	%s/\s\+$//ge
	exe "normal! 'z"
endfunction
