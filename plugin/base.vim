" ------------------------------------------------------
" Created By : sdo
" File Name : base.vim
" Creation Date : 2023-05-08 00:22:02
" Last Modified : 2023-05-08 01:44:31
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.9
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

" We define bolean values
let g:true = 0        " We define true
let g:false = !true   " We define false

" We load the file where we can change config
source ../vimrc/base.vimrc

function! OkFor(var)
	if exists(a:var)
		if a:var == g:true
			return g:true
		else
			return g:false
		endif
	else
		return g:false
	endif
	return g:false
endfunction
