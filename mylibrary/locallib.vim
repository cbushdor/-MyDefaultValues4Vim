" ------------------------------------------------------
" Created By : sdo
" File Name : locallib.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-06-08 01:45:55
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.50
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

if exists("g:locallib_vim")
	finish
endif

let g:locallib_vim=1

function! MyRaiseError(m,e)
	echoerr a:m
	throw a:e 
endfunction

function! CheckValue(myvar)
	try
		let d =  exists(a:myvar) " Variable detected

		"echo "============>"..a:myvar.." detected! "..d
		if d " Memory exists we check if extension exists to return content of memory
			let r = split(a:myvar,':')
			if r[0] == 'g' " Scope is g
				let p = g:
			elseif r[0] == 's' " Scope is s
				let p = s:
			elseif r[0] == 'l' " Scope is l 
				let p = l:
			elseif r[0] == 'w' " Scope is w 
				let p = w:
			elseif r[0] == 'b' " Scope is b 
				let p = b:
			elseif r[0] == 't' " Scope is t 
				let p = t:
			elseif r[0] == 'v' " Scope is v 
				let p = v:
			elseif r[0] == 'a' " Scope is a 
				let p = a:
			else " no scope but memory exists
				call MyRaiseError(a:myvar.." error! You'd better read :help internal-variables.")
			endif
			return get(p,r[1]) " we return content of memory passed
		else " we know that mem does not exists 
			"call MyRaiseError(a:myvar.." is not declared properly! You'd better read :help internal-variables.",ERROR_DECLARATION)
			call MyRaiseError(a:myvar.." is not declared properly! You'd better read :help internal-variables.",a:myvar)
			"call MyRaiseError(a:myvar.." is not declared properly! You'd better read :help internal-variables.",a:myvar)
			return g:false
		endif
		return g:false
	catch /.*/
		echo v:exception
		"echom expand("%").."::"..expand("<sfile>:t")
		echo "Why don't you declare it in ~/.vimrc s.a ".. "let "..a:myvar.."=false"
		q
	endtry
endfunction

