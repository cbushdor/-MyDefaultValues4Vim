" ------------------------------------------------------
" Created By : sdo
" File Name : txt.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-05-30 03:12:26
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.361
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

function! EchoWarning(msg)
	"echohl WarningMsg
	echohl Red
	echo "Warning"
	echohl None
	echon ': ' a:msg
endfunction

"call EchoWarning('test')

function! MyRaiseError(mess)
	command Hardcopy call Hardcopy()
	echoerr(a:mess)
endfunction

function! CheckValue(myvar)
	try
		if !exists("g:true") " We check if g:true exists
			call MyRaiseError("o:true does not exist!")
		endif
		if !exists("g:false") " We check if g:false exists
			call MyRaiseError("g:false does not exist!")
		endif

		let d =  exists(a:myvar) " Variable detected

		"echo "============>"..a:myvar.." detected!"
		if d " memory exists we check if extension exists to return content of memory
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
			call MyRaiseError(a:myvar.." is not declared properly! You'd better read :help internal-variables.")
			return g:false
		endif
		return g:false
	catch
		echom "ERROR: " .. v:exception
	endtry
endfunction

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

function! IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction


function! DeleteTrailingWS()
	exe "normal! mz"
	%s/\s\+$//ge
	exe "normal! 'z"
endfunction
