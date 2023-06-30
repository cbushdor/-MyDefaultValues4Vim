" ------------------------------------------------------
" Created By : sdo
" File Name : locallib.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-06-30 17:13:45
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.478
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

" Search for a commen
function! MySearch(file,mysearch,mln)
	let l:fiCon= readfile(a:file,getftype(a:file))
	let ln = 0
	let myStop = -1
	for l in l:fiCon
		let str = l:fiCon[ln]
		if l =~ a:mysearch
			let myStop = ln + a:mln
		endif
		if ln == myStop
			return substitute(l,'\v^[^\ ]+\ +','','g')
		endif
		let ln += 1
	endfor
	return ""
endfunction

" We raise an error with this function
function! MyRaiseError(m,e)
	echoerr a:m
	throw a:e 
endfunction

" Prompt a question
function! Confirm(msg,cho)
	let l:cho = split(a:cho,',')
	echo a:msg .. ' ['..toupper(l:cho[0])..l:cho[1]..']?'

	let l:answer = tolower(nr2char(getchar()))

	if l:answer ==? "\n"
		let l:answer = l:cho[0]
	endif
	if l:answer ==? l:cho[0]
		return g:true
	elseif l:answer ==?  l:cho[1]
		return g:false
	else
		echo 'Default value is taken!'
		return g:true
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
		":.s/\(call\)/\= s:printsNew($COMMENT."\r".a:message."\r".submatch(1))/
		:.s/\(call\)/\= s:printsNew("\r".a:message."\r".submatch(1))/
		:w
		:e $FI
		return g:true
	catch /.*/
		echo v:exception
		echo "Why don't you declare: call StartsLoading(...) in ~/.vimrc"
		q
	endtry
endfunction


" We check if variables are set in order to allow or not exxecution of module
function! CheckValue(myvar,file)
	try
		let d =  exists(a:myvar) " Variable detected

		"echo "============>"..a:myvar.." detected! "
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
			let l:answ = Confirm("Variable "..a:myvar.." does not exists. Would you like to set it as let "..a:myvar.."=true in ~/.vimrc ","y,n")
			let l:myans = (l:answ == g:true) ? "g:true" : "g:false"

			" We found a comment to put before the new variable in 
			" ~/.vimrc if it exists
			"let comment = MySearch(expand('%'),'Purpose',1)
			let comment = MySearch(a:file,'Purpose',1)
			if strlen(comment) > 0
				let comment = ' " '..comment
			endif
			call Mylog("let "..a:myvar.."="..l:myans..comment, "/Users/sdo/.vimrc")
			"		echo "ok"
		endif
		return g:false
	catch /.*/
		echo v:exception
		"echom expand("%").."::"..expand("<sfile>:t")
		echo "Why don't you declare it in ~/.vimrc s.a ".. "let "..a:myvar.."=false"
		q
	endtry
endfunction

