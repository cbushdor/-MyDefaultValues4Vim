" ------------------------------------------------------
" Created By : sdo
" File Name : locallib.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-06-05 21:18:59
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.8
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

function! MyRaiseError(...)
	echoerr a:0
	throw a:1 
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
			"echo "this i here"
			call MyRaiseError(a:myvar.." is not declared properly! You'd better read :help internal-variables.")
			return g:false
		endif
		return g:false
	catch
		echom "CheckValue::ERROR: " .. v:exception
		q
	endtry
endfunction

