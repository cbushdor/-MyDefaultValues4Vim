" ------------------------------------------------------
" Created By : sdo
" File Name : txt.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-05-26 03:00:30
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.147
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

function! CheckValue(myvar)
	let d =  exists(a:myvar) " Variable detected
	if d
		" echo a:myvar.." detected!"
		let r = split(a:myvar,':')
		if r[0] == 'g'
			let p = g:
		elseif r[0] == 's'
			let p = s:
		elseif r[0] == 'l'
			let p = l:
		elseif r[0] == 'w'
			let p = w:
		elseif r[0] == 'b'
			let p = b:
		elseif r[0] == 't'
			let p = t:
		elseif r[0] == 'v'
			let p = v:
		endif
		"	echo "g:false:"..g:false
		"	echo "g:true:"..g:true
		"	echo "g:my_auto_DeleteTrailingWS: "..get(g:,'my_auto_DeleteTrailingWS')
		"	echo a:myvar..": "..get(p,'my_auto_DeleteTrailingWS')
		"	echo "get(p,r[1]): "..get(p,r[1])
		return get(p,r[1]) == g:true
	endif
	"echo a:myvar.." not detected!"
	return d
endfunction

if CheckValue('s:my_auto_DeleteTrailingWS')
	echo "continue"
else 
	echo "can't continue"
	finish
endif

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
