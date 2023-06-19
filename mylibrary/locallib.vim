" ------------------------------------------------------
" Created By : sdo
" File Name : locallib.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-06-20 01:04:43
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.221
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

"let $MYENV="/Users/sdo/Downloads/tests/ttttt/event.log"

if exists("g:locallib_vim")
	finish
endif

let g:locallib_vim=1

" We raise an error with this function
function! MyRaiseError(m,e)
	echoerr a:m
	throw a:e 
endfunction

" Prompt a question
function! Confirm(msg,...)
	echo a:msg . ' '

	let l:answer = nr2char(getchar())

	if l:answer ==? 'y'
		return g:true
	elseif l:answer ==? 'n'
		return g:false
	else
		echo 'Please enter "y" or "n"'
		return Confirm(a:msg)
	endif
endfunction

" We use this to print a string with regexp
:function! s:printsNew(mess)
	: return a:mess
:endfunction

" We create a new line with message in file
function! Mylog(message, file)
	try
		let $FI=expand("%") " Current file name
		let $MYENV=a:file " File that s.a ~/.vimrc

		" :e  $MYENV we load file
		" /call StartsLoading/ for every line matching "call StartsLoading"
		" normal execute the following in normal mode
		" 2n find the second ocurrence of the pattern
		" gn select it
		" :w we write changes
		" :e $FI we load asked file
		" in case we can raise and error message

		:e  $MYENV
		g/call StartsLoading/normal 2ngn
		:.s/\(call\)/\= s:printsNew(a:message."\r".submatch(1))/
		:w
		:e $FI
		return g:true
	catch /.*/
		echo v:exception
		echo "Why don't you declare: call StartsLoading(...) in ~/.vimrc"
		q
	endtry
endfun


" We check if variables are set in order to allow or not exxecution of module
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
			let l:answ = Confirm("Variable "..a:myvar.." does not exists. Would you like to set one in ~/.vimrc [y/n]?")
			"	echo "------------------------->"..answ
			if l:answ == g:false 
				call MyRaiseError(a:myvar.." is not declared properly! You'd better read :help internal-variables.",a:myvar)
				"return g:false
			else
				let l:answ = Confirm("let "..a:myvar.."=true in ~/.vimrc [y/n]?")
				"		echo "We will set variable in ~/.vimrc"
				let l:myans = l:answ == g:false ? "g:false" : "g:true"
				"call Mylog("let "..a:myvar.."="..l:myans, "/Users/sdo/Downloads/tests/ttttt/event.log")
				call Mylog("let "..a:myvar.."="..l:myans, "/Users/sdo/.vimrc")
				"		echo "ok"
				return l:answ
			endif
		endif
		return g:false
	catch /.*/
		echo v:exception
		"echom expand("%").."::"..expand("<sfile>:t")
		echo "Why don't you declare it in ~/.vimrc s.a ".. "let "..a:myvar.."=false"
		q
	endtry
endfunction

